local __exports = LibStub:NewLibrary("ovale/scripts/ovale_warrior_spells", 90000)
if not __exports then return end
__exports.registerWarriorSpells = function(OvaleScripts)
    local name = "ovale_warrior_spells"
    local desc = "[9.0] Ovale: Warrior spells"
    local code = [[Define(ancestral_call 274738)
# Invoke the spirits of your ancestors, granting you a random secondary stat for 15 seconds.
  SpellInfo(ancestral_call cd=120 duration=15 gcd=0 offgcd=1)
Define(arcane_torrent 25046)
# Remove s1 beneficial effect from all enemies within A1 yards and restore m2 Energy.
  SpellInfo(arcane_torrent cd=120 gcd=1 energy=-15)
Define(avatar 107574)
# Transform into a colossus for 20 seconds, causing you to deal s1 increased damage and removing all roots and snares.rnrn|cFFFFFFFFGenerates s5/10 Rage.|r
  SpellInfo(avatar cd=90 duration=20 gcd=0 offgcd=1 rage=-20)
  SpellRequire(avatar unusable set=1 enabled=(not hastalent(avatar_talent)))
  # Damage done increased by s1.
  SpellAddBuff(avatar avatar add=1)
Define(bag_of_tricks 312411)
# Pull your chosen trick from the bag and use it on target enemy or ally. Enemies take <damage> damage, while allies are healed for <healing>. 
  SpellInfo(bag_of_tricks cd=90)
Define(berserking 59621)
# Permanently enchant a melee weapon to sometimes increase your attack power by 59620s1, but at the cost of reduced armor. Cannot be applied to items higher than level ecix
  SpellInfo(berserking gcd=0 offgcd=1)
Define(bladestorm 227847)
# Become an unstoppable storm of destructive force, striking up to s1 nearby targets for (1+6 seconds)*50622s1 Physical damage over 6 seconds.rnrnYou are immune to movement impairing and loss of control effects, but can use defensive abilities and can avoid attacks.
  SpellInfo(bladestorm cd=90 duration=6 tick=1)
  SpellAddBuff(bladestorm bladestorm_buff add=1)
  # Dealing damage to all nearby enemies every t1 sec.rnImmune to crowd control.
  SpellAddBuff(bladestorm bladestorm add=1)
Define(bladestorm_buff 50622)
# You become a whirling storm of destructive force, striking all nearby targets with your main hand weapon for s1 Physical damage.
  SpellInfo(bladestorm_buff gcd=0 offgcd=1)
Define(blood_fury 20572)
# Increases your attack power by s1 for 15 seconds.
  SpellInfo(blood_fury cd=120 duration=15 gcd=0 offgcd=1)
  # Attack power increased by w1.
  SpellAddBuff(blood_fury blood_fury add=1)
Define(blood_of_the_enemy 297969)
# Infuse your Heart of Azeroth with Blood of the Enemy.
  SpellInfo(blood_of_the_enemy)
Define(bloodbath 335096)
# Assault the target in a bloodthirsty craze, dealing s1 Physical damage and restoring 117313s1 of your health.rnrn|cFFFFFFFFGenerates s2/10 Rage.|r
  SpellInfo(bloodbath cd=3 rage=-8)
Define(bloodthirst 23881)
# Assault the target in a bloodthirsty craze, dealing s1 Physical damage and restoring 117313s1 of your health.rnrn|cFFFFFFFFGenerates s2/10 Rage.|r
  SpellInfo(bloodthirst cd=4.5 rage=-8)
Define(charge 100)
# Charge to an enemy, dealing 126664s2 Physical damage, rooting it for 1 second?s103828[, and stunning it for 7922d][].rnrn|cFFFFFFFFGenerates /10;s2 Rage.|r
  SpellInfo(charge cd=1.5 charge_cd=20 gcd=0 offgcd=1 rage=-10)
Define(cleave 845)
# Strikes up to s2 enemies in front of you for s1 Physical damage, inflicting Deep Wounds. Cleave will consume your Overpower effect to deal increased damage.
  SpellInfo(cleave rage=20 cd=6)
  SpellRequire(cleave unusable set=1 enabled=(not hastalent(cleave_talent)))
Define(colossus_smash 167105)
# Smashes the enemy's armor, dealing s1 Physical damage, and increasing damage you deal to them by 208086s1 for 10 seconds.
  SpellInfo(colossus_smash cd=90)
Define(colossus_smash_debuff 208086)
# Smashes the enemy's armor, dealing s1 Physical damage, and increasing damage you deal to them by 208086s1 for 10 seconds.
  SpellInfo(colossus_smash_debuff duration=10 gcd=0 offgcd=1)
  # Taking w1 additional damage from @auracaster.
  SpellAddTargetDebuff(colossus_smash_debuff colossus_smash_debuff add=1)
Define(concentrated_flame 295368)
# Blast your target with a ball of concentrated flame, dealing 295365s2*(1+@versadmg) Fire damage to an enemy or healing an ally for 295365s2*(1+@versadmg)?a295377[, then burn the target for an additional 295377m1 of the damage or healing done over 6 seconds][]. rnrnEach cast of Concentrated Flame deals s3 increased damage or healing. This bonus resets after every third cast.
  SpellInfo(concentrated_flame duration=6 gcd=0 offgcd=1 tick=2)
  # Suffering w1 damage every t1 sec.
  SpellAddTargetDebuff(concentrated_flame concentrated_flame add=1)
Define(conductive_ink 302491)
# Your damaging abilities against enemies above M3 health have a very high chance to apply Conductive Ink. When an enemy falls below M3 health, Conductive Ink inflicts s1*(1+@versadmg) Nature damage per stack.
  SpellInfo(conductive_ink gcd=0 offgcd=1)
  # Falling below 296964M~1 health will cause Conductive Ink to inflict 296963s1*(1+@versadmg) Nature damage.
  SpellAddTargetDebuff(conductive_ink conductive_ink_buff_trigger add=1)
Define(conductive_ink_buff_trigger 302565)
# Your damaging abilities against enemies above M3 health have a very high chance to apply Conductive Ink. When an enemy falls below M3 health, Conductive Ink inflicts s1*(1+@versadmg) Nature damage per stack.
  SpellInfo(conductive_ink_buff_trigger duration=120 max_stacks=999 gcd=0 offgcd=1)
Define(crushing_assault 278826)
# Your melee abilities have a chance to increase the damage of your next Slam by s1 and reduce its Rage cost by s2/10.
  SpellInfo(crushing_assault duration=10 gcd=0 offgcd=1)
Define(crushing_blow 335097)
# Charge to an enemy and strike a mighty blow with both weapons that deals a total of 335098s1+335100s1 Physical damage.?s316452[rnrnCrushing Blow has a s1 chance to instantly reset its own cooldown.][]rnrn|cFFFFFFFFGenerates m2/10 Rage.|r
  SpellInfo(crushing_blow cd=8 rage=-12)
  SpellAddTargetDebuff(crushing_blow crushing_blow_debuff add=1)
  SpellAddTargetDebuff(crushing_blow crushing_blow_debuff_unused_0 add=1)
Define(crushing_blow_debuff 335098)
# Charge to an enemy and strike a mighty blow with both weapons that deals a total of 335098s1+335100s1 Physical damage.?s316452[rnrnCrushing Blow has a s1 chance to instantly reset its own cooldown.][]rnrn|cFFFFFFFFGenerates m2/10 Rage.|r
  SpellInfo(crushing_blow_debuff gcd=0 offgcd=1)
Define(crushing_blow_debuff_unused_0 335100)
# Charge to an enemy and strike a mighty blow with both weapons that deals a total of 335098s1+335100s1 Physical damage.?s316452[rnrnCrushing Blow has a s1 chance to instantly reset its own cooldown.][]rnrn|cFFFFFFFFGenerates m2/10 Rage.|r
  SpellInfo(crushing_blow_debuff_unused_0 gcd=0 offgcd=1)
Define(deadly_calm 262228)
# Reduces the Rage cost of your next n abilities by s1.rnrn|cFFFFFFFFPassive:|r Your maximum Rage is increased by 314522s1/10.
  SpellInfo(deadly_calm cd=60 duration=20 gcd=0 offgcd=1)
  SpellRequire(deadly_calm unusable set=1 enabled=(not hastalent(deadly_calm_talent)))
  # Your abilities cost s1 less Rage.
  SpellAddBuff(deadly_calm deadly_calm add=1)
Define(deep_wounds_debuff 262115)
# Mortal Strike, ?s262161[Warbreaker][Colossus Smash], ?s845[Cleave, ][]and ?s152277[Ravager][Bladestorm] inflict Deep Wounds, dealing 262115o1 Bleed damage over 12 seconds and increasing the damage the enemy takes from you by (110.00000000000001 of Spell Power).1.
  SpellInfo(deep_wounds_debuff duration=12 gcd=0 offgcd=1 tick=3)
Define(dragon_roar 118000)
# Roar explosively, dealing s1 Physical damage to all enemies within A1 yds. Dragon Roar critically strikes for 3 times normal damage.rnrn|cFFFFFFFFGenerates s2/10 Rage.|r
  SpellInfo(dragon_roar cd=30 rage=-10)
  SpellRequire(dragon_roar unusable set=1 enabled=(not hastalent(dragon_roar_talent_protection)))
Define(execute 5308)
# Attempt to finish off a wounded foe, causing 280849s1+163558s1 Physical damage. Only usable on enemies that have less than 20 health.?s316403[rnrn|cFFFFFFFFGenerates m3/10 Rage.|r][]
  SpellInfo(execute rage=0 cd=6)
  SpellAddTargetDebuff(execute execute_debuff_unused_0 add=1)
  SpellAddTargetDebuff(execute execute_offhand add=1)
Define(execute_debuff_unused_0 280849)
# Attempt to finish off a wounded foe, causing 280849s1+163558s1 Physical damage. Only usable on enemies that have less than 20 health.?s316403[rnrn|cFFFFFFFFGenerates m3/10 Rage.|r][]
  SpellInfo(execute_debuff_unused_0 gcd=0 offgcd=1)
Define(execute_offhand 163558)
# Attempt to finish off a wounded foe, causing 280849s1+163558s1 Physical damage. Only usable on enemies that have less than 20 health.?s316403[rnrn|cFFFFFFFFGenerates m3/10 Rage.|r][]
  SpellInfo(execute_offhand)
Define(fireblood 265221)
# Removes all poison, disease, curse, magic, and bleed effects and increases your ?a162700[Agility]?a162702[Strength]?a162697[Agility]?a162698[Strength]?a162699[Intellect]?a162701[Intellect][primary stat] by 265226s1*3 and an additional 265226s1 for each effect removed. Lasts 8 seconds. ?s195710[This effect shares a 30 sec cooldown with other similar effects.][]
  SpellInfo(fireblood cd=120 gcd=0 offgcd=1)
Define(focused_azerite_beam 295258)
# Focus excess Azerite energy into the Heart of Azeroth, then expel that energy outward, dealing m1*10 Fire damage to all enemies in front of you over 3 seconds.?a295263[ Castable while moving.][]
  SpellInfo(focused_azerite_beam cd=90 duration=3 channel=3 tick=0.33)
  SpellAddBuff(focused_azerite_beam focused_azerite_beam add=1)
  SpellAddBuff(focused_azerite_beam focused_azerite_beam_unused_0 add=1)
Define(focused_azerite_beam_unused_0 295261)
# Focus excess Azerite energy into the Heart of Azeroth, then expel that energy outward, dealing m1*10 Fire damage to all enemies in front of you over 3 seconds.?a295263[ Castable while moving.][]
  SpellInfo(focused_azerite_beam_unused_0 cd=90)
Define(guardian_of_azeroth 295840)
# Call upon Azeroth to summon a Guardian of Azeroth for 30 seconds who impales your target with spikes of Azerite every s1/10.1 sec that deal 295834m1*(1+@versadmg) Fire damage.?a295841[ Every 303347t1 sec, the Guardian launches a volley of Azerite Spikes at its target, dealing 295841s1 Fire damage to all nearby enemies.][]?a295843[rnrnEach time the Guardian of Azeroth casts a spell, you gain 295855s1 Haste, stacking up to 295855u times. This effect ends when the Guardian of Azeroth despawns.][]rn
  SpellInfo(guardian_of_azeroth cd=180 duration=30)
Define(guardian_of_azeroth_buff 295855)
# Each time the Guardian of Azeroth casts a spell, you gain 295855s1 Haste, stacking up to 295855u times. This effect ends when the Guardian of Azeroth despawns.
  SpellInfo(guardian_of_azeroth_buff duration=60 max_stacks=5 gcd=0 offgcd=1)
  # Haste increased by s1.
  SpellAddBuff(guardian_of_azeroth_buff guardian_of_azeroth_buff add=1)
Define(heroic_leap 6544)
# Leap through the air toward a target location, slamming down with destructive force to deal 52174s1 Physical damage to all enemies within 52174a1 yards?c3[, and resetting the remaining cooldown on Taunt][].
  SpellInfo(heroic_leap cd=0.8 charge_cd=45 gcd=0 offgcd=1)
Define(intimidating_shout 5246)
# ?s275338[Causes the targeted enemy and up to s1 additional enemies within 5246A3 yards to cower in fear.][Causes the targeted enemy to cower in fear, and up to s1 additional enemies within 5246A3 yards to flee.] Targets are disoriented for 8 seconds.
  SpellInfo(intimidating_shout cd=90 duration=8)
  # Disoriented.
  SpellAddTargetDebuff(intimidating_shout intimidating_shout add=1)
Define(lights_judgment 255647)
# Call down a strike of Holy energy, dealing <damage> Holy damage to enemies within A1 yards after 3 sec.
  SpellInfo(lights_judgment cd=150)
  SpellAddTargetDebuff(lights_judgment lights_judgment_debuff add=1)
Define(lights_judgment_debuff 256893)
# Call down a strike of Holy energy, dealing <damage> Holy damage to enemies within A1 yards.
  SpellInfo(lights_judgment_debuff cd=150)
Define(meat_cleaver 280392)
# Whirlwind deals s1 more damage and now affects your next s2+s3 single-target melee attacks, instead of the next s3 attacks.
  SpellInfo(meat_cleaver gcd=0 offgcd=1)
  SpellRequire(meat_cleaver unusable set=1 enabled=(not hastalent(meat_cleaver_talent)))
Define(memory_of_lucid_dreams 299300)
# Infuse your Heart of Azeroth with Memory of Lucid Dreams.
  SpellInfo(memory_of_lucid_dreams)
Define(memory_of_lucid_dreams_buff 298357)
# Clear your mind and attune yourself with the Heart of Azeroth, ?a137020[causing Frostbolt and Flurry to generate an additional Icicle]?a137019[increasing your Fire Blast recharge rate by 303399s1*-2][increasing your ?a137033[Insanity]?(a137032|a137031|a137021|a137020|a137019|a137012|a137029|a137024|a137041|a137039)[Mana]?a137027|a137028[Holy Power]?(a137050|a137049|a137048|a137010)[Rage]?(a137017|a137015|a137016)[Focus]?(a137011|a137025|a137023|a137037|a137036|a137035)[Energy]?a212613[Pain]?a212612[Fury]?(a137046|a137044|a137043)[Soul Shard]?(a137008|a137007|a137006)[Rune]?a137040[Maelstrom]?a137013[Astral Power][] generation rate by s1]?a298377[ and ][]?a137020&a298377[increases ][]?a298377[your Leech by 298268s6][] for 12 seconds.
  SpellInfo(memory_of_lucid_dreams_buff cd=120 duration=12)
  # ?a303412[Frostbolt and Flurry will generate an additional Icicle]?a303399[Fire Blast recharge rate increased by 303399s1*-2][@spelldesc304633 generation increased by s1].?w2>0[rnLeech increased by w2.][]
  SpellAddBuff(memory_of_lucid_dreams_buff memory_of_lucid_dreams_buff add=1)
Define(mortal_strike 12294)
# A vicious strike that deals s1 Physical damage and reduces the effectiveness of healing on the target by 115804s1 for 10 seconds.
  SpellInfo(mortal_strike rage=30 cd=6)
Define(mortal_strike_debuff 198819)
# When activated, your next Mortal Strike will deal m1 increased damage and reduce healing taken by 198819m1 for 6 seconds.
  SpellInfo(mortal_strike_debuff duration=6 gcd=0 offgcd=1)
  # Healing effects received reduced by w1.
  SpellAddTargetDebuff(mortal_strike_debuff mortal_strike_debuff add=1)
Define(noxious_venom 267410)
  SpellInfo(noxious_venom duration=4 max_stacks=3 gcd=0 offgcd=1 tick=1)
Define(onslaught 315720)
# Brutally attack an enemy for s1 Physical damage. Requires Enrage.rnrn|cFFFFFFFFGenerates m2/10 Rage.|r
  SpellInfo(onslaught cd=12 rage=-15)
  SpellRequire(onslaught unusable set=1 enabled=(not hastalent(onslaught_talent)))
Define(overpower 7384)
# Overpower the enemy, dealing s1 Physical damage. Cannot be blocked, dodged, or parried.?s316440&s845[rnrnIncreases the damage of your next Mortal Strike or Cleave by s2]?s316440[rnrnIncreases the damage of your next Mortal Strike by s2][]?(s316440&!s316441)[.][]?s316441[, stacking up to u times.][]
  SpellInfo(overpower cd=12 duration=15 max_stacks=1)
  # Your next Mortal Strike ?s845[or Cleave ][]will deal w2 increased damage.
  SpellAddBuff(overpower overpower add=1)
Define(pummel 6552)
# Pummels the target, interrupting spellcasting and preventing any spell in that school from being cast for 4 seconds.
  SpellInfo(pummel cd=15 duration=4 gcd=0 offgcd=1 interrupt=1)
Define(purifying_blast 295337)
# Call down a purifying beam upon the target area, dealing 295293s3*(1+@versadmg)*s2 Fire damage over 6 seconds.?a295364[ Has a low chance to immediately annihilate any specimen deemed unworthy by MOTHER.][]?a295352[rnrnWhen an enemy dies within the beam, your damage is increased by 295354s1 for 8 seconds.][]rnrnAny Aberration struck by the beam is stunned for 3 seconds.
  SpellInfo(purifying_blast cd=60 duration=6)
Define(quaking_palm 107079)
# Strikes the target with lightning speed, incapacitating them for 4 seconds, and turns off your attack.
  SpellInfo(quaking_palm cd=120 duration=4 gcd=1)
  # Incapacitated.
  SpellAddTargetDebuff(quaking_palm quaking_palm add=1)
Define(raging_blow 85288)
# A mighty blow with both weapons that deals a total of <damage> Physical damage.?s316452[rnrnRaging Blow has a s1 chance to instantly reset its own cooldown.][]rnrn|cFFFFFFFFGenerates m2/10 Rage.|r
  SpellInfo(raging_blow cd=8 rage=-12)
  SpellAddTargetDebuff(raging_blow raging_blow_debuff_unused_0 add=1)
  SpellAddTargetDebuff(raging_blow raging_blow_debuff add=1)
Define(raging_blow_debuff 85384)
# A mighty blow with both weapons that deals a total of <damage> Physical damage.?s316452[rnrnRaging Blow has a s1 chance to instantly reset its own cooldown.][]rnrn|cFFFFFFFFGenerates m2/10 Rage.|r
  SpellInfo(raging_blow_debuff gcd=0 offgcd=1)
Define(raging_blow_debuff_unused_0 96103)
# A mighty blow with both weapons that deals a total of <damage> Physical damage.?s316452[rnrnRaging Blow has a s1 chance to instantly reset its own cooldown.][]rnrn|cFFFFFFFFGenerates m2/10 Rage.|r
  SpellInfo(raging_blow_debuff_unused_0 gcd=0 offgcd=1)
Define(rampage 184367)
# ?s316412[Enrages you and unleashes][Unleashes] a series of s1 brutal strikes for a total of <damage> Physical damage.
  SpellInfo(rampage rage=80)
  SpellAddTargetDebuff(rampage rampage_debuff add=1)
  SpellAddTargetDebuff(rampage rampage_debuff_unused_0 add=1)
  SpellAddTargetDebuff(rampage rampage_debuff_unused_2 add=1)
  SpellAddTargetDebuff(rampage rampage_debuff_unused_1 add=1)
Define(rampage_debuff 184707)
# ?s316412[Enrages you and unleashes][Unleashes] a series of s1 brutal strikes for a total of <damage> Physical damage.
  SpellInfo(rampage_debuff gcd=0 offgcd=1)
Define(rampage_debuff_unused_0 184709)
# ?s316412[Enrages you and unleashes][Unleashes] a series of s1 brutal strikes for a total of <damage> Physical damage.
  SpellInfo(rampage_debuff_unused_0 gcd=0 offgcd=1)
Define(rampage_debuff_unused_1 201363)
# ?s316412[Enrages you and unleashes][Unleashes] a series of s1 brutal strikes for a total of <damage> Physical damage.
  SpellInfo(rampage_debuff_unused_1 gcd=0 offgcd=1)
Define(rampage_debuff_unused_2 201364)
# ?s316412[Enrages you and unleashes][Unleashes] a series of s1 brutal strikes for a total of <damage> Physical damage.
  SpellInfo(rampage_debuff_unused_2 gcd=0 offgcd=1)
Define(ravager 152277)
# Throws a whirling weapon at the target location that chases nearby enemies, inflicting <damage> Physical damage and applying Deep Wounds to up to 156287s2 enemies over 12 seconds.rnrn|cFFFFFFFFGenerates 248439s1/10 Rage each time it deals damage.|r
  SpellInfo(ravager cd=45 duration=12 tick=2)
  SpellRequire(ravager unusable set=1 enabled=(not hastalent(ravager_talent)))
  # Ravager is currently active.
  SpellAddBuff(ravager ravager add=1)
Define(razor_coral_debuff 303568)
# ?a303565[Remove Razor Coral from your target, granting you 303573s1 Critical Strike per stack for 20 seconds.][Deal 304877s1*(1+@versadmg) Physical damage and apply Razor Coral to your target, giving your damaging abilities against the target a high chance to deal 304877s1*(1+@versadmg) Physical damage and add a stack of Razor Coral.rnrnReactivating this ability will remove Razor Coral from your target, granting you 303573s1 Critical Strike per stack for 20 seconds.]rn
  SpellInfo(razor_coral_debuff duration=120 max_stacks=100 gcd=0 offgcd=1)
  # Withdrawing the Razor Coral will grant w1 Critical Strike.
  SpellAddTargetDebuff(razor_coral_debuff razor_coral_debuff add=1)
Define(reaping_flames 310690)
# Burn your target with a bolt of Azerite, dealing 310712s3 Fire damage. If the target has less than s2 health?a310705[ or more than 310705s1 health][], the cooldown is reduced by s3 sec.?a310710[rnrnIf Reaping Flames kills an enemy, its cooldown is lowered to 310710s2 sec and it will deal 310710s1 increased damage on its next use.][]
  SpellInfo(reaping_flames cd=45)
Define(reckless_force_buff 298409)
# When an ability fails to critically strike, you have a high chance to gain Reckless Force. When Reckless Force reaches 302917u stacks, your critical strike is increased by 302932s1 for 4 seconds.
  SpellInfo(reckless_force_buff max_stacks=5 gcd=0 offgcd=1 tick=10)
Define(recklessness 1719)
# Go berserk, increasing all Rage generation by s4?a202751[, greatly empowering Bloodthirst and Raging Blow,][] and granting your abilities s1 increased critical strike chance for 10 seconds.?a202751[rnrn|cFFFFFFFFGenerates s3/10 Rage.|r][]
  SpellInfo(recklessness cd=90 duration=10 gcd=0 offgcd=1 rage=0)
  # Rage generation increased by s5.rnCritical strike chance of all abilities increased by w1.?a202751[rnBloodthirst and Raging Blow upgraded to @spellname335096 and @spellname335097.][]
  SpellAddBuff(recklessness recklessness add=1)
Define(rend 772)
# Wounds the target, causing s1 Physical damage instantly and an additional o2 Bleed damage over 15 seconds.rnrnIncreases critical damage you deal to the enemy by s3.
  SpellInfo(rend rage=30 duration=15 tick=3)
  SpellRequire(rend unusable set=1 enabled=(not hastalent(rend_talent)))
  # Bleeding for w2 damage every t2 sec. Taking w3 increased critical damage from @auracaster.
  SpellAddTargetDebuff(rend rend add=1)
Define(revenge 6572)
# Swing in a wide arc, dealing s1 Physical damage to all enemies in front of you. Deals reduced damage beyond <cap> targets.rnrnYour successful dodges and parries have a chance to make your next Revenge cost no Rage.
  SpellInfo(revenge rage=20)
Define(ripple_in_space 299306)
# Infuse your Heart of Azeroth with Ripple in Space.
  SpellInfo(ripple_in_space)
Define(shockwave 46968)
# Sends a wave of force in a frontal cone, causing s2 damage and stunning all enemies within a1 yards for 2 seconds.
  SpellInfo(shockwave cd=40)
  # Stunned.
  SpellAddBuff(shockwave shockwave add=1)
Define(siegebreaker 280772)
# Break the enemy's defenses, dealing s1 Physical damage, and increasing your damage done to the target by 280773s1 for 10 seconds.rnrn|cFFFFFFFFGenerates m2/10 Rage.|r
  SpellInfo(siegebreaker cd=30 rage=-10)
  SpellRequire(siegebreaker unusable set=1 enabled=(not hastalent(siegebreaker_talent)))
Define(siegebreaker_debuff 280773)
# Break the enemy's defenses, dealing s1 Physical damage, and increasing your damage done to the target by 280773s1 for 10 seconds.rnrn|cFFFFFFFFGenerates m2/10 Rage.|r
  SpellInfo(siegebreaker_debuff duration=10 gcd=0 offgcd=1)
  # Taking w1 increased damage from @auracaster.
  SpellAddTargetDebuff(siegebreaker_debuff siegebreaker_debuff add=1)
Define(skullsplitter 260643)
# Bash an enemy's skull, dealing s1 Physical damage.rnrn|cFFFFFFFFGenerates s2/10 Rage.|r
  SpellInfo(skullsplitter cd=21 rage=-20)
  SpellRequire(skullsplitter unusable set=1 enabled=(not hastalent(skullsplitter_talent)))
Define(slam 1464)
# Slams an opponent, causing s1 Physical damage.
  SpellInfo(slam rage=20)
  SpellRequire(slam replaced_by set=revenge enabled=(specialization(protection)))
Define(storm_bolt 107570)
# Hurls your weapon at an enemy, causing s1 Physical damage and stunning for 4 seconds.
  SpellInfo(storm_bolt cd=30)
  SpellRequire(storm_bolt unusable set=1 enabled=(not hastalent(storm_bolt_talent_fury)))
  # Stunned.
  SpellAddBuff(storm_bolt storm_bolt add=1)
Define(sudden_death 29725)
# Your attacks have a chance to make your next ?a317320[Condemn][Execute] cost no Rage, be usable on any target regardless of their health, and deal damage as if you spent s1 Rage.
  SpellInfo(sudden_death gcd=0 offgcd=1)
  SpellRequire(sudden_death unusable set=1 enabled=(not hastalent(sudden_death_talent)))
Define(sweeping_strikes 260708)
# For 12 seconds your single-target damaging abilities hit s1 additional Ltarget:targets; within 8 yds for s2 damage.
  SpellInfo(sweeping_strikes cd=45 duration=12 gcd=0.75)
  # Your single-target damaging abilities hit s1 additional Ltarget:targets; within 8 yds for s2 damage.
  SpellAddBuff(sweeping_strikes sweeping_strikes add=1)
Define(test_of_might 275540)
# When ?s262161[Warbreaker][Colossus Smash] expires, your Strength is increased by s1 for every s2 Rage you spent during ?s262161[Warbreaker][Colossus Smash]. Lasts 12 seconds.
  SpellInfo(test_of_might duration=12 gcd=0 offgcd=1)
  # Strength increased by w1.
  SpellAddBuff(test_of_might test_of_might add=1)
Define(the_unbound_force 299321)
# Infuse your Heart of Azeroth with The Unbound Force.
  SpellInfo(the_unbound_force)
Define(war_stomp 20549)
# Stuns up to i enemies within A1 yds for 2 seconds.
  SpellInfo(war_stomp cd=90 duration=2 gcd=0 offgcd=1)
  # Stunned.
  SpellAddTargetDebuff(war_stomp war_stomp add=1)
Define(warbreaker 262161)
# Smash the ground and shatter the armor of all enemies within A1 yds, dealing s1 Physical damage and increasing damage you deal to them by 208086s1 for 10 seconds.
  SpellInfo(warbreaker cd=45)
  SpellRequire(warbreaker unusable set=1 enabled=(not hastalent(warbreaker_talent)))
Define(whirlwind 190411)
# Unleashes a whirlwind of steel, striking up to s3 nearby enemies for <damage> Physical damage.?s12950[rnrnCauses your next 85739u single-target melee lattack:attacks; to strike up to 85739s1 additional targets for 85739s3 damage.][]?s316435[rnrn|cFFFFFFFFGenerates s1 Rage, plus an additional s2 per target hit.|r][]
  SpellInfo(whirlwind rage=30)
  SpellAddBuff(whirlwind whirlwind_buff_unused_1 add=1)
  SpellAddBuff(whirlwind whirlwind_offhand_unused_0 add=1)
  SpellAddBuff(whirlwind whirlwind_buff_unused_3 add=1)
  SpellAddBuff(whirlwind whirlwind_offhand add=1)
Define(whirlwind_buff_unused_1 199667)
# Unleashes a whirlwind of steel, striking up to s3 nearby enemies for <damage> Physical damage.?s12950[rnrnCauses your next 85739u single-target melee lattack:attacks; to strike up to 85739s1 additional targets for 85739s3 damage.][]?s316435[rnrn|cFFFFFFFFGenerates s1 Rage, plus an additional s2 per target hit.|r][]
  SpellInfo(whirlwind_buff_unused_1 gcd=0 offgcd=1)
Define(whirlwind_buff_unused_3 199852)
# Unleashes a whirlwind of steel, striking up to s3 nearby enemies for <damage> Physical damage.?s12950[rnrnCauses your next 85739u single-target melee lattack:attacks; to strike up to 85739s1 additional targets for 85739s3 damage.][]?s316435[rnrn|cFFFFFFFFGenerates s1 Rage, plus an additional s2 per target hit.|r][]
  SpellInfo(whirlwind_buff_unused_3 gcd=0 offgcd=1)
Define(whirlwind_offhand 199851)
# Unleashes a whirlwind of steel, striking up to s3 nearby enemies for <damage> Physical damage.?s12950[rnrnCauses your next 85739u single-target melee lattack:attacks; to strike up to 85739s1 additional targets for 85739s3 damage.][]?s316435[rnrn|cFFFFFFFFGenerates s1 Rage, plus an additional s2 per target hit.|r][]
  SpellInfo(whirlwind_offhand gcd=0 offgcd=1)
Define(whirlwind_offhand_unused_0 44949)
# Unleashes a whirlwind of steel, striking up to s3 nearby enemies for <damage> Physical damage.?s12950[rnrnCauses your next 85739u single-target melee lattack:attacks; to strike up to 85739s1 additional targets for 85739s3 damage.][]?s316435[rnrn|cFFFFFFFFGenerates s1 Rage, plus an additional s2 per target hit.|r][]
  SpellInfo(whirlwind_offhand_unused_0 gcd=0 offgcd=1)
Define(worldvein_resonance 298606)
# Infuse your Heart of Azeroth with Worldvein Resonance.
  SpellInfo(worldvein_resonance)
Define(avatar_talent 17) #22397
# Transform into a colossus for 20 seconds, causing you to deal s1 increased damage and removing all roots and snares.rnrn|cFFFFFFFFGenerates s5/10 Rage.|r
Define(cleave_talent 15) #22362
# Strikes up to s2 enemies in front of you for s1 Physical damage, inflicting Deep Wounds. Cleave will consume your Overpower effect to deal increased damage.
Define(cleave_talent 15) #22362
# Strikes up to s2 enemies in front of you for s1 Physical damage, inflicting Deep Wounds. Cleave will consume your Overpower effect to deal increased damage.
Define(deadly_calm_talent 18) #22399
# Reduces the Rage cost of your next n abilities by s1.rnrn|cFFFFFFFFPassive:|r Your maximum Rage is increased by 314522s1/10.
Define(deadly_calm_talent 18) #22399
# Reduces the Rage cost of your next n abilities by s1.rnrn|cFFFFFFFFPassive:|r Your maximum Rage is increased by 314522s1/10.
Define(dragon_roar_talent_protection 9) #23260
# Roar explosively, dealing s1 Physical damage to all enemies within A1 yds. Dragon Roar critically strikes for 3 times normal damage.rnrn|cFFFFFFFFGenerates s2/10 Rage.|r
Define(fervor_of_battle_talent 8) #22489
# Whirlwind also Slams your primary target.
Define(massacre_talent_arms 7) #22380
# ?a317320[Condemn][Execute] is now usable on targets below s2 health.
Define(meat_cleaver_talent 16) #22396
# Whirlwind deals s1 more damage and now affects your next s2+s3 single-target melee attacks, instead of the next s3 attacks.
Define(onslaught_talent 9) #23372
# Brutally attack an enemy for s1 Physical damage. Requires Enrage.rnrn|cFFFFFFFFGenerates m2/10 Rage.|r
Define(ravager_talent 21) #21667
# Throws a whirling weapon at the target location that chases nearby enemies, inflicting <damage> Physical damage and applying Deep Wounds to up to 156287s2 enemies over 12 seconds.rnrn|cFFFFFFFFGenerates 248439s1/10 Rage each time it deals damage.|r
Define(reckless_abandon_talent 20) #22402
# Recklessness generates s1/10 Rage and greatly empowers Bloodthirst and Raging Blow.
Define(rend_talent 9) #19138
# Wounds the target, causing s1 Physical damage instantly and an additional o2 Bleed damage over 15 seconds.rnrnIncreases critical damage you deal to the enemy by s3.
Define(siegebreaker_talent 21) #16037
# Break the enemy's defenses, dealing s1 Physical damage, and increasing your damage done to the target by 280773s1 for 10 seconds.rnrn|cFFFFFFFFGenerates m2/10 Rage.|r
Define(skullsplitter_talent 3) #22371
# Bash an enemy's skull, dealing s1 Physical damage.rnrn|cFFFFFFFFGenerates s2/10 Rage.|r
Define(storm_bolt_talent_fury 6) #23093
# Hurls your weapon at an enemy, causing s1 Physical damage and stunning for 4 seconds.
Define(sudden_death_talent 2) #22360
# Your attacks have a chance to make your next ?a317320[Condemn][Execute] cost no Rage, be usable on any target regardless of their health, and deal damage as if you spent s1 Rage.
Define(warbreaker_talent 14) #22391
# Smash the ground and shatter the armor of all enemies within A1 yds, dealing s1 Physical damage and increasing damage you deal to them by 208086s1 for 10 seconds.
Define(warbreaker_talent 14) #22391
# Smash the ground and shatter the armor of all enemies within A1 yds, dealing s1 Physical damage and increasing damage you deal to them by 208086s1 for 10 seconds.
Define(test_of_might_trait 275529)
Define(cold_steel_hot_blood_trait 288080)
Define(condensed_lifeforce_essence_id 14)
Define(memory_of_lucid_dreams_essence_id 27)
Define(blood_of_the_enemy_essence_id 23)
    ]]
    code = code .. [[
SpellRequire(execute unusable set=1 enabled=(target.healthpercent() > 20))
  ]]
    OvaleScripts:RegisterScript("WARRIOR", nil, name, desc, code, "include")
end
