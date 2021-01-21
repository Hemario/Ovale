import { ipairs, LuaObj } from "@wowts/lua";
import { format } from "@wowts/string";
import { ClassId, eventDispatcher } from "@wowts/wow-mock";
import { readdirSync, readFileSync, writeFileSync } from "fs";
import { IoC } from "../../ioc";
import { registerScripts } from "../../scripts";
import { getDefinition, getDesc, getItemDefinition } from "./ast-helpers";
import {
    convertFromItemData,
    convertFromSpellData,
    CustomAuras,
    CustomSpellData,
} from "./customspell";
import { replaceInFile } from "./file-tools";
import { getFixes } from "./fixes";
import { DbcData } from "./importspells";

const limitLine1 = "// THE REST OF THIS FILE IS AUTOMATICALLY GENERATED";
const limitLine2 = "// ANY CHANGES MADE BELOW THIS POINT WILL BE LOST";
const simcClasses = [
    "deathknight",
    "demonhunter",
    "druid",
    "hunter",
    "mage",
    "monk",
    "paladin",
    "priest",
    "rogue",
    "shaman",
    "warlock",
    "warrior",
];

function canonicalize(s: string) {
    const token = "xXxUnDeRsCoReXxX";
    s = s.toLowerCase();
    s = s.replace(/[\s\-_(){}[\]]/g, token);
    s = s.replace(/\./g, "");
    s = s.replace(/xXxUnDeRsCoReXxX/g, "_");
    s = s.replace("_+", "_");
    s = s.replace("^_", "");
    s = s.replace("_$", "");
    return s;
}

function truncateFile(fileName: string, newCode: string) {
    const file = readFileSync(fileName, { encoding: "utf8" });
    const lines = file.split("\n");
    const output: string[] = [];
    for (const line of lines) {
        if (line.indexOf(limitLine1) >= 0) {
            break;
        }
        output.push(line);
    }
    output.push("    " + limitLine1);
    output.push("    " + limitLine2);
    output.push("");
    output.push(newCode);
    output.push("}");
    writeFileSync(fileName, output.join("\n"), { encoding: "utf8" });
}

function getProfileFiles(
    profileFile: string | undefined,
    profilesDirectory: string
) {
    const files: string[] = [];
    if (profileFile) {
        files.push(profileFile);
    } else {
        const dir = readdirSync(profilesDirectory);
        for (const name of dir) {
            files.push(name);
        }
        files.sort();
    }
    return files;
}

function addId<T>(ids: T[], id?: T) {
    if (id && !ids.includes(id)) {
        ids.push(id);
    }
}

function isDefined<T>(t: T | undefined): t is T {
    return t !== undefined;
}

class ClassData {
    spells: number[] = [];
    talents: number[] = [];
    items: number[] = [];
    spellLists: string[] = [];
    azeriteTraits: number[] = [];
    essences: number[] = [];
    runeforges: number[] = [];
    conduits: number[] = [];
    soulbindAbilities: number[] = [];
    customIds: number[] = [];
}

export class ClassScripts {
    constructor(
        private spellData: DbcData,
        private profilesDirectory: string,
        private outputDirectory: string
    ) {
        const { customIdentifierById, customIdentifiers } = getFixes(
            this.spellData
        );
        this.customIdentifierById = customIdentifierById;
        this.customIdentifiers = customIdentifiers;
    }
    private customIdentifierById: Map<
        number,
        { id: number; identifier: string }
    >;
    private customIdentifiers: Map<string, number>;
    private classData = new Map<string, ClassData>();
    private modifiedFiles = new Map<string, string>();

    private importClassScript(filename: string) {
        const output: string[] = [];
        const inputName = this.profilesDirectory + "/" + filename;
        const simc = readFileSync(inputName, { encoding: "utf8" });
        if (simc.indexOf("optimal_raid=") >= 0) return;
        let source: string | undefined,
            className: string | undefined,
            specialization: string | undefined;
        const matches = simc.match(/[^\r\n]+/g);
        if (matches) {
            for (const line of matches) {
                if (!source) {
                    if (line.substring(0, 3) == "### ") {
                        source = line.substring(4);
                    }
                }
                if (!className) {
                    for (const simcClass of simcClasses) {
                        const length = simcClass.length;
                        if (line.substring(0, length + 1) == simcClass + "=") {
                            className = simcClass.toUpperCase();
                        }
                    }
                }
                if (!specialization) {
                    if (line.substring(0, 5) == "spec=") {
                        specialization = line.substring(5);
                    }
                }
                if (className && specialization) {
                    break;
                }
            }
        }

        if (!className || !specialization) {
            console.log("className and specialization must be defined");
            return;
        }

        console.log(filename);
        const ioc = new IoC();
        ioc.ovale.playerGUID = "player";
        const dictionary: LuaObj<number | string> = Object.assign(
            {},
            this.spellData.identifiers
        );
        ioc.ovale.playerClass = <ClassId>className;
        for (const [key] of this.spellData.spellLists) {
            ioc.data.buffSpellList[key] = {};
            dictionary[key] = key;
        }
        eventDispatcher.DispatchEvent("ADDON_LOADED", "Ovale");
        eventDispatcher.DispatchEvent("PLAYER_ENTERING_WORLD", "Ovale");
        registerScripts(ioc.scripts);
        const profile = ioc.simulationCraft.parseProfile(simc, dictionary, {
            effect: this.spellData.spellEffectById,
        });
        if (!profile) return;
        const profileName = profile.annotation.name.substring(
            1,
            profile.annotation.name.length - 1
        );
        let desc: string;
        if (source) {
            desc = format("%s: %s", source, profileName);
        } else {
            desc = profileName;
        }
        const name = canonicalize(desc);
        output.push("    {");
        output.push(format('        const name = "sc_%s";', name));
        output.push(
            format('        const desc = "[9.0] Simulationcraft: %s";', desc)
        );
        output.push("        const code = `");
        output.push(ioc.simulationCraft.emit(profile, true));
        output.push("`;");
        output.push(
            format(
                `        scripts.RegisterScript(
            "%s",
            "%s",
            name,
            desc,
            code,
            "%s"
        );`,
                profile.annotation.classId,
                profile.annotation.specialization,
                "script"
            )
        );
        output.push("    }");
        const outputFileName = "ovale_" + className.toLowerCase() + ".ts";
        console.log("Appending to " + outputFileName + ": " + name);
        const outputName = this.outputDirectory + "/" + outputFileName;
        const existing = this.modifiedFiles.get(outputName);
        const outputCode = output.join("\n");
        if (!existing) {
            this.modifiedFiles.set(outputName, outputCode);
        } else {
            this.modifiedFiles.set(outputName, existing + "\n\n" + outputCode);
        }
        let classData = this.classData.get(className);
        if (!classData) {
            classData = new ClassData();
            this.classData.set(className, classData);
        }
        const {
            azeriteTraits,
            conduits,
            customIds,
            essences,
            items,
            runeforges,
            soulbindAbilities,
            spellLists,
            spells,
            talents,
        } = classData;

        const identifiers = ipairs(profile.annotation.symbolList)
            .map((x) => x[1])
            .sort();
        for (const symbol of identifiers) {
            const spellList = this.spellData.spellLists.get(symbol);
            if (spellList) {
                for (const spell of spellList) {
                    if (this.customIdentifierById.has(spell.id))
                        addId(customIds, spell.id);
                    else if (spell.identifier.match(/_item$/)) {
                        addId(items, spell.id);
                    } else {
                        addId(spells, spell.id);
                    }
                }
                if (spellLists.indexOf(symbol) < 0) spellLists.push(symbol);
                continue;
            }
            const id = this.spellData.identifiers[symbol];
            if (this.customIdentifiers.has(symbol)) {
                addId(customIds, id);
                if (this.spellData.spellDataById.get(id)) {
                    addId(spells, id);
                }
            } else if (symbol.match(/_talent/)) {
                addId(talents, id);
            } else if (symbol.match(/_item$/)) {
                addId(items, id);
            } else if (symbol.match(/_trait$/)) {
                addId(azeriteTraits, id);
            } else if (symbol.match(/_essence_id$/)) {
                addId(essences, id);
            } else if (symbol.match(/_runeforge$/)) {
                addId(runeforges, id);
            } else if (symbol.match(/_conduit$/)) {
                addId(conduits, id);
            } else if (symbol.match(/_soulbind$/)) {
                addId(soulbindAbilities, id);
            } else {
                addId(spells, id);
            }
        }
    }

    importClassScripts(profileFile?: string) {
        const files = getProfileFiles(profileFile, this.profilesDirectory);

        for (const filename of files) {
            if (!filename.startsWith("generate")) {
                this.importClassScript(filename);
            }
        }

        this.writeFiles();
        this.writeSpellScripts();
    }

    private writeFiles() {
        for (const [file, source] of this.modifiedFiles.entries()) {
            truncateFile(file, source);
        }
    }

    private writeSpellScripts() {
        for (const [className, classData] of this.classData) {
            const {
                azeriteTraits,
                conduits,
                customIds,
                essences,
                items,
                runeforges,
                soulbindAbilities,
                spellLists,
                spells: spellIds,
                talents: talentIds,
            } = classData;
            let output = `    let code = \``;
            const spells: CustomSpellData[] = [];
            const remainingsSpellIds = spellIds.concat();
            const addSpells = (addedIds: number[]) => {
                for (const spellId of addedIds) {
                    if (
                        remainingsSpellIds.indexOf(spellId) < 0 &&
                        spellIds.indexOf(spellId) < 0
                    ) {
                        remainingsSpellIds.push(spellId);
                        spellIds.push(spellId);
                    }
                }
            };
            while (remainingsSpellIds.length) {
                const spellId = remainingsSpellIds.pop();
                if (!spellId) continue;
                const spell = this.spellData.spellDataById.get(spellId);
                if (!spell) {
                    continue;
                }
                if (spell.replaced_by) {
                    addSpells(spell.replaced_by);
                }

                const customSpell = convertFromSpellData(
                    spell,
                    this.spellData.spellDataById
                );
                spells.push(customSpell);
                if (customSpell.auras) {
                    for (const t in customSpell.auras) {
                        const target = t as keyof CustomAuras;
                        const auras = customSpell.auras[target];
                        if (auras) {
                            addSpells(auras.map((x) => x.id));
                        }
                    }
                }
            }

            const sortedSpells = spells.sort((x, y) =>
                x.identifier < y.identifier ? -1 : 1
            );
            for (const spell of sortedSpells) {
                if (!spell) continue;
                output += `Define(${spell.identifier} ${spell.id})\n`;
                output += getDefinition(
                    this.spellData,
                    spell.identifier,
                    spell,
                    talentIds,
                    spellIds
                );
            }

            for (const spellList of spellLists) {
                const spells = this.spellData.spellLists.get(spellList);
                if (spells) {
                    output += `SpellList(${spellList} ${spells
                        .map((x) => x.identifier)
                        .join(" ")})\n`;
                }
            }

            const talents = talentIds
                .map((x) => this.spellData.talentsById.get(x))
                .filter(isDefined)
                .sort((x, y) => (x.name > y.name ? 1 : -1));
            for (let i = 0; i < talents.length; i++) {
                const talent = talents[i];
                if (!talent) continue;
                output += `Define(${talent.identifier} ${talent.id})\n`;
                const spell = this.spellData.spellDataById.get(talent.spell_id);
                if (spell && spell.desc) {
                    output += `# ${getDesc(spell)}\n`;
                }
            }

            const writeIds = <T, U extends { identifier: string }>(
                ids: T[],
                repository: Map<T, U>,
                idProperty: keyof U,
                infoHandler?: (item: U) => string | undefined
            ) => {
                for (const id of ids) {
                    const item = repository.get(id);
                    if (!item) continue;
                    output += `Define(${item.identifier} ${item[idProperty]})\n`;
                    if (infoHandler) {
                        const data = infoHandler(item);
                        if (data) output += data + "\n";
                    }
                }
            };

            writeIds(customIds, this.customIdentifierById, "id");
            writeIds(items, this.spellData.itemsById, "id", (item) =>
                getItemDefinition(
                    convertFromItemData(item, this.spellData.spellDataById)
                )
            );
            writeIds(azeriteTraits, this.spellData.azeriteTraitById, "spellId");
            writeIds(essences, this.spellData.essenceById, "id");
            writeIds(runeforges, this.spellData.runeforgeById, "bonus_id");
            writeIds(conduits, this.spellData.conduitById, "id");
            writeIds(
                soulbindAbilities,
                this.spellData.soulbindAbilityById,
                "spell_id"
            );

            output += `    \`;`;

            const fileName =
                this.outputDirectory + "/ovale_" + className + "_spells.ts";
            replaceInFile(fileName, output);
        }
    }
}
