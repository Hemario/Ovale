import { OvaleScriptsClass } from "../engine/scripts";

export function registerHunterSpells(OvaleScripts: OvaleScriptsClass) {
    const name = "ovale_hunter_spells";
    const desc = "[9.0] Ovale: Hunter spells";
    // THIS PART OF THIS FILE IS AUTOMATICALLY GENERATED
let code = `Define(a_murder_of_crows 131894)
# Summons a flock of crows to attack your target, dealing 131900s1*16 Physical damage over 15 seconds. If the target dies while under attack, A Murder of Crows' cooldown is reset.
  SpellInfo(a_murder_of_crows focus=30 cd=60 duration=15 tick=1)
  SpellRequire(a_murder_of_crows unusable set=1 enabled=(not hastalent(a_murder_of_crows_talent_survival)))
  # Under attack by a flock of crows.
  SpellAddTargetDebuff(a_murder_of_crows a_murder_of_crows add=1)
Define(aimed_shot 19434)
# A powerful aimed shot that deals s1 Physical damage.
  SpellInfo(aimed_shot focus=35 cd=12)
Define(ancestral_call 274738)
# Invoke the spirits of your ancestors, granting you a random secondary stat for 15 seconds.
  SpellInfo(ancestral_call cd=120 duration=15 gcd=0 offgcd=1)
Define(arcane_pulse 260364)
# Deals <damage> Arcane damage to nearby enemies and reduces their movement speed by 260369s1. Lasts 12 seconds.
  SpellInfo(arcane_pulse cd=180 gcd=1)
  # Reduces movement speed by w1.
  SpellAddBuff(arcane_pulse arcane_pulse_buff add=1)
Define(arcane_pulse_buff 260369)
# Reduces movement speed by s1.
  SpellInfo(arcane_pulse_buff duration=12 gcd=0 offgcd=1)
Define(arcane_shot 185358)
# A quick shot that causes sw2 Arcane damage.
  SpellInfo(arcane_shot focus=40)
Define(arcane_torrent 25046)
# Remove s1 beneficial effect from all enemies within A1 yards and restore m2 Energy.
  SpellInfo(arcane_torrent cd=120 gcd=1 energy=-15)
Define(aspect_of_the_eagle 186289)
# Increases the range of your ?s259387[Mongoose Bite][Raptor Strike] to 265189r yds for 15 seconds.
  SpellInfo(aspect_of_the_eagle cd=90 duration=15 gcd=0 offgcd=1)
  # The range of ?s259387[Mongoose Bite][Raptor Strike] is increased to 265189r yds.
  SpellAddBuff(aspect_of_the_eagle aspect_of_the_eagle add=1)
Define(aspect_of_the_wild 193530)
# Grants you and your pet s2 Focus per sec and s1 increased critical strike chance for 20 seconds.
  SpellInfo(aspect_of_the_wild cd=120 duration=20 gcd=0 offgcd=1 tick=1)
  # Gaining s2 Focus per sec.rnCritical Strike chance increased by s1.
  SpellAddBuff(aspect_of_the_wild aspect_of_the_wild add=1)
Define(bag_of_tricks 312411)
# Pull your chosen trick from the bag and use it on target enemy or ally. Enemies take <damage> damage, while allies are healed for <healing>. 
  SpellInfo(bag_of_tricks cd=90)
Define(barbed_shot 217200)
# Fire a shot that tears through your enemy, causing them to bleed for s1*s2 damage over 8 seconds.rnrnSends your pet into a frenzy, increasing attack speed by 272790s1 for 8 seconds, stacking up to 272790u times.rnrn|cFFFFFFFFGenerates 246152s1*8 seconds/246152t1 Focus over 8 seconds.|r
  SpellInfo(barbed_shot cd=12 duration=8 tick=2)
  # Suffering sw1 damage every t1 sec.
  SpellAddTargetDebuff(barbed_shot barbed_shot add=1)
Define(barrage 120360)
# Rapidly fires a spray of shots for 3 seconds, dealing an average of <damageSec> Physical damage to up to 120361I enemies in front of you. Usable while moving.
  SpellInfo(barrage focus=60 cd=20 duration=3 channel=3 tick=0.2)
  SpellRequire(barrage unusable set=1 enabled=(not hastalent(barrage_talent_marksmanship)))
Define(beast_cleave_buff 118455)
# After you Multi-Shot, your pet's melee attacks also strike up to 118459I other nearby enemy targets for s1 as much for the next 4 seconds.
  SpellInfo(beast_cleave_buff duration=4 gcd=0 offgcd=1)
  # Melee attacks also strike all other nearby enemy targets.
  SpellAddBuff(beast_cleave_buff beast_cleave_buff add=1)
Define(berserking 59621)
# Permanently enchant a melee weapon to sometimes increase your attack power by 59620s1, but at the cost of reduced armor. Cannot be applied to items higher than level ecix
  SpellInfo(berserking gcd=0 offgcd=1)
Define(bestial_wrath 19574)
# Sends you and your pet into a rage, instantly dealing <damage> Physical damage to its target, and increasing all damage you both deal by s1 for 15 seconds. ?s231548&s217200[rnrnBestial Wrath's remaining cooldown is reduced by s3 sec each time you use Barbed Shot.][]
  SpellInfo(bestial_wrath cd=90 duration=15)
  # Damage dealt increased by w1.
  SpellAddBuff(bestial_wrath bestial_wrath add=1)
Define(blood_fury 20572)
# Increases your attack power by s1 for 15 seconds.
  SpellInfo(blood_fury cd=120 duration=15 gcd=0 offgcd=1)
  # Attack power increased by w1.
  SpellAddBuff(blood_fury blood_fury add=1)
Define(bloodlust 2825)
# Increases haste by (25 of Spell Power) for all party and raid members for 40 seconds.rnrnAllies receiving this effect will become Sated and unable to benefit from Bloodlust or Time Warp again for 600 seconds.
  SpellInfo(bloodlust cd=300 duration=40 gcd=0 offgcd=1)
  # Haste increased by w1.
  SpellAddBuff(bloodlust bloodlust add=1)
Define(bloodshed 321530)
# Command your pet to tear into your target, causing your target to bleed for <damage> over 18 seconds and increase all damage taken from your pet by 321538s2 for 18 seconds.
  SpellInfo(bloodshed cd=60)
  SpellRequire(bloodshed unusable set=1 enabled=(not hastalent(bloodshed_talent)))
Define(butchery 212436)
# Attack up to I nearby enemies in a flurry of strikes, inflicting s1 Physical damage to each.?s294029[rnrnReduces the remaining cooldown on Wildfire Bomb by <cdr> sec for each target hit.][]
  SpellInfo(butchery focus=30 cd=9)
  SpellRequire(butchery unusable set=1 enabled=(not hastalent(butchery_talent)))
Define(carve 187708)
# A sweeping attack that strikes up to I enemies in front of you for s1 Physical damage.?s294029[rnrnReduces the remaining cooldown on Wildfire Bomb by <cdr> sec for each target hit.][]
  SpellInfo(carve focus=35 cd=6)
Define(chakrams 259391)
# Throw a pair of chakrams at your target, slicing all enemies in the chakrams' path for <damage> Physical damage. The chakrams will return to you, damaging enemies again.rnrnYour primary target takes 259398s2 increased damage.
  SpellInfo(chakrams focus=15 cd=20)
  SpellRequire(chakrams unusable set=1 enabled=(not hastalent(chakrams_talent)))
Define(chimaera_shot 53209)
# A two-headed shot that hits your primary target and another nearby target, dealing 171457sw2 Nature damage to one and 171454sw2 Frost damage to the other.?s137015[rnrn|cFFFFFFFFGenerates 204304s1 Focus for each target hit.|r][]
  SpellInfo(chimaera_shot cd=15)
  SpellRequire(chimaera_shot unusable set=1 enabled=(not hastalent(chimaera_shot_talent_beast_mastery)))
Define(chimaera_shot_marksmanship 342049)
# A two-headed shot that hits your primary target for 344120sw1 Nature damage and another nearby target for  344121sw1*(s1/100) Frost damage.
  SpellInfo(chimaera_shot_marksmanship focus=20)
  SpellRequire(chimaera_shot_marksmanship unusable set=1 enabled=(not hastalent(chimaera_shot_talent)))
Define(cobra_shot 193455)
# A quick shot causing s2*<mult> Physical damage.rnrnReduces the cooldown of Kill Command by s3 sec.
  SpellInfo(cobra_shot focus=35)
Define(coordinated_assault 266779)
# You and your pet attack as one, increasing all damage you both deal by s1 for 20 seconds.?s263186[rnrnWhile Coordinated Assault is active, Kill Command's chance to reset is increased by s4.][]
  SpellInfo(coordinated_assault cd=120 duration=20 gcd=0 offgcd=1)
  # Damage dealt increased by s1.?s263186[rnKill Command's chance to reset increased by s4.][]
  SpellAddBuff(coordinated_assault coordinated_assault add=1)
Define(counter_shot 147362)
# Interrupts spellcasting, preventing any spell in that school from being cast for 3 seconds.
  SpellInfo(counter_shot cd=24 duration=3 gcd=0 offgcd=1 interrupt=1)
Define(dead_eye_buff 321461)
# Kill Shot has m1+1 charges, and causes Aimed Shot to recharge 321461m1/(1+(321461m1/100)) faster for 3 seconds.
  SpellInfo(dead_eye_buff duration=3 gcd=0 offgcd=1)
Define(death_chakram 325028)
# Throw a deadly chakram at your current target that will rapidly deal 325037s1 Shadow damage x times, bouncing to other targets if they are nearby.rnrnEach time the chakram deals damage, its damage is increased by s3 and you generate s4 Focus.
  SpellInfo(death_chakram cd=45)
Define(dire_beast 120679)
# Summons a powerful wild beast that attacks the target and roars, increasing your Haste by 281036s1 for 8 seconds.
  SpellInfo(dire_beast cd=20 duration=8)
  SpellRequire(dire_beast unusable set=1 enabled=(not hastalent(dire_beast_talent)))
  # Haste increased by s1.
  SpellAddBuff(dire_beast dire_beast_buff add=1)
Define(dire_beast_buff 281036)
# Summons a powerful wild beast that attacks the target and roars, increasing your Haste by 281036s1 for 8 seconds.
  SpellInfo(dire_beast_buff duration=8 gcd=0 offgcd=1)
Define(double_tap 260402)
# Your next Aimed Shot will fire a second time instantly at s4 power without consuming Focus, or your next Rapid Fire will shoot s3 additional shots during its channel.
  SpellInfo(double_tap cd=60 duration=15)
  SpellRequire(double_tap unusable set=1 enabled=(not hastalent(double_tap_talent)))
  # Your next Aimed Shot will fire a second time instantly at s4 power and consume no Focus, or your next Rapid Fire will shoot s3 additional shots during its channel.
  SpellAddBuff(double_tap double_tap add=1)
Define(explosive_shot 212431)
# Fires an explosive shot at your target. After t1 sec, the shot will explode, dealing 212680s1 Fire damage to up to 212680I enemies within 212680A1 yards.
  SpellInfo(explosive_shot focus=20 cd=30 duration=3 tick=3)
  SpellRequire(explosive_shot unusable set=1 enabled=(not hastalent(explosive_shot_talent)))
  # Exploding for 212680s1 Fire damage after t1 sec.
  SpellAddTargetDebuff(explosive_shot explosive_shot add=1)
Define(fireblood 265221)
# Removes all poison, disease, curse, magic, and bleed effects and increases your ?a162700[Agility]?a162702[Strength]?a162697[Agility]?a162698[Strength]?a162699[Intellect]?a162701[Intellect][primary stat] by 265226s1*3 and an additional 265226s1 for each effect removed. Lasts 8 seconds. ?s195710[This effect shares a 30 sec cooldown with other similar effects.][]
  SpellInfo(fireblood cd=120 gcd=0 offgcd=1)
Define(flanking_strike 269751)
# You and your pet leap to the target and strike it as one, dealing a total of <damage> Physical damage.rnrn|cFFFFFFFFGenerates 269752s2 Focus for you and your pet.|r
  SpellInfo(flanking_strike cd=30)
  SpellRequire(flanking_strike unusable set=1 enabled=(not hastalent(flanking_strike_talent)))
Define(flare 1543)
# Exposes all hidden and invisible enemies within the targeted area for m1 sec.
  SpellInfo(flare cd=20)
Define(flayed_shot 324149)
# Fire a shot at your enemy, causing them to bleed for o1 Shadow damage over 14 seconds. Each time Flayed Shot deals damage, you have a s2 chance to gain Flayer's Mark, causing your next Kill Shot to be free and usable on any target, regardless of their current health.
  SpellInfo(flayed_shot focus=10 cd=30 duration=14 tick=2)
  # Bleeding for s1 Shadow damage every t1 sec.
  SpellAddTargetDebuff(flayed_shot flayed_shot add=1)
Define(flayers_mark 324156)
# Fire a shot at your enemy, causing them to bleed for o1 Shadow damage over 14 seconds. Each time Flayed Shot deals damage, you have a s2 chance to gain Flayer's Mark, causing your next Kill Shot to be free and usable on any target, regardless of their current health.
  SpellInfo(flayers_mark duration=12 gcd=0 offgcd=1)
  # Kill Shot can be used on any target, regardless of their current health, and will not consume any Focus.
  SpellAddBuff(flayers_mark flayers_mark add=1)
Define(freezing_trap 187650)
# Hurls a frost trap to the target location that incapacitates the first enemy that approaches for 60 seconds. Damage will break the effect. Limit 1. Trap will exist for 60 seconds.
  SpellInfo(freezing_trap cd=30)
Define(frenzy 138895)
# Haste increased by s1 for 10 seconds.
  SpellInfo(frenzy duration=10 max_stacks=5 gcd=0 offgcd=1)
Define(harpoon 190925)
# Hurls a harpoon at an enemy, rooting them in place for 3 seconds and pulling you to them.
  SpellInfo(harpoon cd=1 charge_cd=30 duration=3 gcd=0 offgcd=1)
  # Stunned.
  SpellAddTargetDebuff(harpoon harpoon_debuff add=1)
  # Rooted.
  SpellAddTargetDebuff(harpoon harpoon add=1)
Define(harpoon_debuff 186260)
# Hurls a harpoon at an enemy, rooting them in place for 3 seconds and pulling you to them.
  SpellInfo(harpoon_debuff gcd=0 offgcd=1)
Define(internal_bleeding 154953)
# Kidney Shot also deals up to ?s193531[6*154953o1][5*154953o1] Bleed damage over 6 seconds, based on combo points spent.
  SpellInfo(internal_bleeding duration=6 gcd=0 offgcd=1 tick=1)
  # Suffering w1 damage every t1 sec.
  SpellAddTargetDebuff(internal_bleeding internal_bleeding add=1)
Define(kill_command 34026)
# Give the command to kill, causing your pet to savagely deal <damage> Physical damage to the enemy.
  SpellInfo(kill_command focus=30 cd=7.5)
Define(kill_command_survival 259489)
# Give the command to kill, causing your pet to savagely deal <damage> Physical damage to the enemy.?s263186[rnrnHas a s2 chance to immediately reset its cooldown.][]rnrn|cFFFFFFFFGenerates s3 Focus.|r
  SpellInfo(kill_command_survival cd=6 focus=-15)
  # Your next ?s259387[Mongoose Bite][Raptor Strike] deals s1 increased damage.
  SpellAddBuff(kill_command_survival tip_of_the_spear add=1)
Define(kill_shot 320976)
# You attempt to finish off a wounded target, dealing s1 Physical damage. Only usable on enemies with less than s2 health.
  SpellInfo(kill_shot focus=10 cd=10)
Define(lights_judgment 255647)
# Call down a strike of Holy energy, dealing <damage> Holy damage to enemies within A1 yards after 3 sec.
  SpellInfo(lights_judgment cd=150)
Define(mongoose_bite 259387)
# A brutal attack that deals s1 Physical damage and grants you Mongoose Fury.rnrn|cFFFFFFFFMongoose Fury|rrnIncreases the damage of Mongoose Bite by 259388s1 for 14 seconds, stacking up to 259388u times. Successive attacks do not increase duration.
  SpellInfo(mongoose_bite focus=30)
  SpellRequire(mongoose_bite unusable set=1 enabled=(not hastalent(mongoose_bite_talent)))
Define(mongoose_fury 259388)
# A brutal attack that deals s1 Physical damage and grants you Mongoose Fury.rnrn|cFFFFFFFFMongoose Fury|rrnIncreases the damage of Mongoose Bite by 259388s1 for 14 seconds, stacking up to 259388u times. Successive attacks do not increase duration.
  SpellInfo(mongoose_fury duration=14 max_stacks=5 gcd=0 offgcd=1)
  # Mongoose Bite damage increased by s1.
  SpellAddBuff(mongoose_fury mongoose_fury add=1)
Define(multishot 2643)
# Fires several missiles, hitting up to I targets within A2 yards of your current target for s2 Physical damage?s115939[ and triggering Beast Cleave][].?s19434[rnrn|cFFFFFFFFGenerates 213363s1 Focus per target hit.|r][]
  SpellInfo(multishot focus=40)
Define(multishot_marksmanship 257620)
# Fires several missiles, hitting your current target and up to I enemies within A1 yards for s1 Physical damage.
  SpellInfo(multishot_marksmanship focus=20)
Define(muzzle 187707)
# Interrupts spellcasting, preventing any spell in that school from being cast for 3 seconds.
  SpellInfo(muzzle cd=15 duration=3 gcd=0 offgcd=1 interrupt=1)
Define(nesingwarys_trapping_apparatus 336744)
# Whenever a trap is triggered, gain 336744s1 Focus and increase all Focus gained by 336744s2 for 5 seconds. 
  SpellInfo(nesingwarys_trapping_apparatus duration=5 gcd=0 offgcd=1 focus=-45)
  # Focus Generation increased by s2.
  SpellAddBuff(nesingwarys_trapping_apparatus nesingwarys_trapping_apparatus add=1)
Define(pheromone_bomb 270332)
# Hurl a bomb at the target, exploding for 270329s1 Fire damage in a cone and coating enemies in pheromones, causing them to suffer 270332o1 Fire damage over 6 seconds.rnrnKill Command has a s2 chance to reset against targets coated with Pheromone Bomb.
  SpellInfo(pheromone_bomb duration=6 gcd=0 offgcd=1 tick=1)
  # Suffering w1 Fire damage every t1 sec.
  SpellAddTargetDebuff(pheromone_bomb pheromone_bomb add=1)
Define(precise_shots 260242)
# Aimed Shot causes your next 1-260242u ?s342049[Chimaera Shots][Arcane Shots] or Multi-Shots to deal 260242s1 more damage.
  SpellInfo(precise_shots duration=15 max_stacks=2 gcd=0 offgcd=1)
  # Damage of ?s342049[Chimaera Shot][Arcane Shot] or Multi-Shot increased by s1.
  SpellAddBuff(precise_shots precise_shots add=1)
Define(quaking_palm 107079)
# Strikes the target with lightning speed, incapacitating them for 4 seconds, and turns off your attack.
  SpellInfo(quaking_palm cd=120 duration=4 gcd=1)
  # Incapacitated.
  SpellAddTargetDebuff(quaking_palm quaking_palm add=1)
Define(rapid_fire 257044)
# Shoot a stream of s1 shots at your target over 2 seconds, dealing a total of m1*257045sw1 Physical damage. ?s321281[rnrnEach shot generates 263585s1 Focus.][]rnrnUsable while moving.
  SpellInfo(rapid_fire cd=20 duration=2 channel=2 tick=0.33)
  # Being targeted by Rapid Fire.
  SpellAddTargetDebuff(rapid_fire rapid_fire add=1)
Define(raptor_strike 186270)
# A vicious slash dealing s1 Physical damage.
  SpellInfo(raptor_strike focus=30)
Define(resonating_arrow 308491)
# Fire a resonating arrow to the target location that deals 308495s1 Arcane damage to any enemy in the area, and fill the area with echoing anima for 10 seconds. The effect causes your attacks to ignore line of sight to enemies in the area, and you have 308498s1 increased critical strike chance against them. rnrnLeaving the area of echoing anima will still allow the hunter to ignore line of sight towards the enemy for 308495s3/1000 sec.
  SpellInfo(resonating_arrow cd=60)
Define(revive_pet 982)
# Revives your pet, returning it to life with s1 of its base health.
  SpellInfo(revive_pet focus=35 duration=3)
Define(serpent_sting 259491)
# Fire a poison-tipped arrow at an enemy, dealing s1 Nature damage instantly and an additional o2 damage over 12 seconds.
  SpellInfo(serpent_sting focus=20 duration=12 tick=3)
  # Suffering w2 Nature damage every t2 sec.?a265428[ The Hunter's pet deals w3 increased damage to you.][]
  SpellAddTargetDebuff(serpent_sting serpent_sting add=1)
Define(shrapnel_bomb 270339)
# Hurl a bomb at the target, exploding for 270338s1 Fire damage in a cone and impaling enemies with burning shrapnel, scorching them for 270339o1 Fire damage over 6 seconds.rnrn?s259387[Mongoose Bite][Raptor Strike] and ?s212436[Butchery][Carve] apply Internal Bleeding, causing 270343o1 damage over 9 seconds. Internal Bleeding stacks up to 270343u times.
  SpellInfo(shrapnel_bomb duration=6 gcd=0 offgcd=1 tick=1)
  # Suffering w1 Fire damage every t1 sec.rn?s259387[Mongoose Bite][Raptor Strike] and Butchery apply a stack of Internal Bleeding.
  SpellAddTargetDebuff(shrapnel_bomb shrapnel_bomb add=1)
Define(stampede 201430)
# Summon a herd of stampeding animals from the wilds around you that deal damage to your enemies for 12 seconds.
  SpellInfo(stampede cd=120 duration=12)
  SpellRequire(stampede unusable set=1 enabled=(not hastalent(stampede_talent)))
Define(steady_focus_buff 193534)
# Using Steady Shot twice in a row increases your Haste by 193534s1 for 15 seconds.
  SpellInfo(steady_focus_buff duration=15 gcd=0 offgcd=1)
  # Haste increased by s1.
  SpellAddBuff(steady_focus_buff steady_focus_buff add=1)
Define(steady_shot 56641)
# A steady shot that causes s1 Physical damage.rnrnUsable while moving.?s321018[rnrn|cFFFFFFFFGenerates s2 Focus.][]
  SpellInfo(steady_shot)
  SpellRequire(steady_shot replaced_by set=cobra_shot enabled=(specialization(beast_mastery)))
Define(steel_trap 162488)
# Hurls a Steel Trap to the target location that snaps shut on the first enemy that approaches, immobilizing them for 20 seconds and causing them to bleed for 162487o1 damage over 20 seconds. rnrnDamage other than Steel Trap may break the immobilization effect. Trap will exist for 60 seconds. Limit 1.
  SpellInfo(steel_trap cd=30)
  SpellRequire(steel_trap unusable set=1 enabled=(not hastalent(steel_trap_talent)))
Define(tar_trap 187698)
# Hurls a tar trap to the target location that creates a 187699s1 yd radius pool of tar around itself for 30 seconds when the first enemy approaches. All enemies have 135299s1 reduced movement speed while in the area of effect. Trap will exist for 60 seconds.
  SpellInfo(tar_trap cd=30)
Define(tip_of_the_spear 260286)
# Kill Command increases the damage of your next ?s259387[Mongoose Bite][Raptor Strike] by 260286s1, stacking up to 260286u times.
  SpellInfo(tip_of_the_spear duration=10 max_stacks=3 gcd=0 offgcd=1)
Define(trick_shots_buff 257622)
# When Multi-Shot hits s2 or more targets, your next Aimed Shot or Rapid Fire will ricochet and hit up to s1 additional targets for s4 of normal damage.
  SpellInfo(trick_shots_buff duration=20 gcd=0 offgcd=1)
  # Your next Aimed Shot or Rapid Fire will ricochet and hit 257621s1 additional targets for 257621s4 of normal damage.
  SpellAddBuff(trick_shots_buff trick_shots_buff add=1)
Define(trueshot 288613)
# Reduces the cooldown of your Aimed Shot and Rapid Fire by m1/4, and causes Aimed Shot to cast s4 faster for 15 seconds.rnrnWhile Trueshot is active, you generate s5 additional Focus.
  SpellInfo(trueshot cd=120 duration=15 gcd=0 offgcd=1)
  # The cooldown of Aimed Shot and Rapid Fire is reduced by m1/4, and Aimed Shot casts s4 faster.rnrnAll Focus generation is increased by s5.
  SpellAddBuff(trueshot trueshot add=1)
Define(vipers_venom_buff 268552)
# ?s259387[Mongoose Bite][Raptor Strike] has a chance to make your next Serpent Sting cost no Focus and deal an additional 268552s1 initial damage.
  SpellInfo(vipers_venom_buff duration=8 gcd=0 offgcd=1)
Define(volatile_bomb 271045)
# Hurl a bomb at the target, exploding for 271048s1 Fire damage in a cone and coating enemies in volatile wildfire, scorching them for 271049o1 Fire damage over 6 seconds.rnrnVolatile Bomb causes an extra explosion for 260231s1 Fire damage against targets affected by Serpent Sting, and refreshes your Serpent Stings when it explodes.
  SpellInfo(volatile_bomb cd=18)
Define(volley 260243)
# Rain a volley of arrows down over 6 seconds, dealing up to 260247s1*12 Physical damage to any enemy in the area, and gain the effects of Trick Shots for as long as Volley is active.
  SpellInfo(volley cd=45 duration=6 tick=0.5)
  SpellRequire(volley unusable set=1 enabled=(not hastalent(volley_talent)))
  # Raining arrows down in the target area.
  SpellAddBuff(volley volley add=1)
Define(war_stomp 20549)
# Stuns up to i enemies within A1 yds for 2 seconds.
  SpellInfo(war_stomp cd=90 duration=2 gcd=0 offgcd=1)
  # Stunned.
  SpellAddTargetDebuff(war_stomp war_stomp add=1)
Define(wild_spirits 328231)
# Evoke the energy of Wild Spirits at the target location, dealing 328837s3 Nature damage and apply Hunter's Mark to all enemy targets within the area for 15 seconds.rnrnWhile the Wild Spirits are active, each damaging ability you or your pet use against a target in the area will strike up to 328757I nearby targets for 328757s1 Nature damage.
  SpellInfo(wild_spirits cd=120)
Define(wildfire_bomb 259495)
# Hurl a bomb at the target, exploding for 265157s1 Fire damage in a cone and coating enemies in wildfire, scorching them for 269747o1 Fire damage over 6 seconds.
  SpellInfo(wildfire_bomb cd=18)
Define(wildfire_bomb_debuff 269747)
# Hurl a bomb at the target, exploding for 265157s1 Fire damage in a cone and coating enemies in wildfire, scorching them for 269747o1 Fire damage over 6 seconds.
  SpellInfo(wildfire_bomb_debuff duration=6 gcd=0 offgcd=1 tick=1)
  # Suffering w1 Fire damage every t1 sec.
  SpellAddTargetDebuff(wildfire_bomb_debuff wildfire_bomb_debuff add=1)
Define(a_murder_of_crows_talent_survival 22299)
# Summons a flock of crows to attack your target, dealing 131900s1*16 Physical damage over 15 seconds. If the target dies while under attack, A Murder of Crows' cooldown is reset.
Define(alpha_predator_talent 22296)
# Kill Command now has s1+1 charges, and deals s2 increased damage.
Define(barrage_talent_marksmanship 22497)
# Rapidly fires a spray of shots for 3 seconds, dealing an average of <damageSec> Physical damage to up to 120361I enemies in front of you. Usable while moving.
Define(bloodshed_talent 22295)
# Command your pet to tear into your target, causing your target to bleed for <damage> over 18 seconds and increase all damage taken from your pet by 321538s2 for 18 seconds.
Define(butchery_talent 22297)
# Attack up to I nearby enemies in a flurry of strikes, inflicting s1 Physical damage to each.?s294029[rnrnReduces the remaining cooldown on Wildfire Bomb by <cdr> sec for each target hit.][]
Define(chakrams_talent 23105)
# Throw a pair of chakrams at your target, slicing all enemies in the chakrams' path for <damage> Physical damage. The chakrams will return to you, damaging enemies again.rnrnYour primary target takes 259398s2 increased damage.
Define(chimaera_shot_talent 21998)
# A two-headed shot that hits your primary target for 344120sw1 Nature damage and another nearby target for  344121sw1*(s1/100) Frost damage.
Define(chimaera_shot_talent_beast_mastery 22290)
# A two-headed shot that hits your primary target and another nearby target, dealing 171457sw2 Nature damage to one and 171454sw2 Frost damage to the other.?s137015[rnrn|cFFFFFFFFGenerates 204304s1 Focus for each target hit.|r][]
Define(chimaera_shot_talent 21998)
# A two-headed shot that hits your primary target for 344120sw1 Nature damage and another nearby target for  344121sw1*(s1/100) Frost damage.
Define(dire_beast_talent 22282)
# Summons a powerful wild beast that attacks the target and roars, increasing your Haste by 281036s1 for 8 seconds.
Define(double_tap_talent 22287)
# Your next Aimed Shot will fire a second time instantly at s4 power without consuming Focus, or your next Rapid Fire will shoot s3 additional shots during its channel.
Define(explosive_shot_talent 22498)
# Fires an explosive shot at your target. After t1 sec, the shot will explode, dealing 212680s1 Fire damage to up to 212680I enemies within 212680A1 yards.
Define(flanking_strike_talent 22271)
# You and your pet leap to the target and strike it as one, dealing a total of <damage> Physical damage.rnrn|cFFFFFFFFGenerates 269752s2 Focus for you and your pet.|r
Define(hydras_bite_talent 22769)
# Serpent Sting fires arrows at s1 additional enemies near your target, and its damage over time is increased by s2.
Define(killer_instinct_talent 22291)
# Kill Command deals s1 increased damage against enemies below s2 health.
Define(mongoose_bite_talent 22278)
# A brutal attack that deals s1 Physical damage and grants you Mongoose Fury.rnrn|cFFFFFFFFMongoose Fury|rrnIncreases the damage of Mongoose Bite by 259388s1 for 14 seconds, stacking up to 259388u times. Successive attacks do not increase duration.
Define(scent_of_blood_talent_beast_mastery 22500)
# Activating Bestial Wrath grants s1 charges of Barbed Shot.
Define(stampede_talent 23044)
# Summon a herd of stampeding animals from the wilds around you that deal damage to your enemies for 12 seconds.
Define(steady_focus_talent 22267)
# Using Steady Shot twice in a row increases your Haste by 193534s1 for 15 seconds.
Define(steel_trap_talent 19361)
# Hurls a Steel Trap to the target location that snaps shut on the first enemy that approaches, immobilizing them for 20 seconds and causing them to bleed for 162487o1 damage over 20 seconds. rnrnDamage other than Steel Trap may break the immobilization effect. Trap will exist for 60 seconds. Limit 1.
Define(steel_trap_talent 19361)
# Hurls a Steel Trap to the target location that snaps shut on the first enemy that approaches, immobilizing them for 20 seconds and causing them to bleed for 162487o1 damage over 20 seconds. rnrnDamage other than Steel Trap may break the immobilization effect. Trap will exist for 60 seconds. Limit 1.
Define(streamline_talent 22286)
# Rapid Fire's damage is increased by s1, and Rapid Fire also causes your next Aimed Shot to cast 342076s1 faster.
Define(terms_of_engagement_talent 22283)
# Harpoon deals 271625s1 Physical damage and generates (265898s1/5)*10 seconds Focus over 10 seconds. Killing an enemy resets the cooldown of Harpoon.
Define(volley_talent 22288)
# Rain a volley of arrows down over 6 seconds, dealing up to 260247s1*12 Physical damage to any enemy in the area, and gain the effects of Trick Shots for as long as Volley is active.
Define(volley_talent 22288)
# Rain a volley of arrows down over 6 seconds, dealing up to 260247s1*12 Physical damage to any enemy in the area, and gain the effects of Trick Shots for as long as Volley is active.
Define(wildfire_infusion_talent 22301)
# Lace your Wildfire Bomb with extra reagents, randomly giving it one of the following enhancements each time you throw it:rnrn|cFFFFFFFFShrapnel Bomb: |rShrapnel pierces the targets, causing ?s259387[Mongoose Bite][Raptor Strike] and ?s212436[Butchery][Carve] to apply a bleed for 9 seconds that stacks up to 270343u times.rnrn|cFFFFFFFFPheromone Bomb: |rKill Command has a 270323s2 chance to reset against targets coated with Pheromones.rnrn|cFFFFFFFFVolatile Bomb: |rReacts violently with poison, causing an extra explosion against enemies suffering from your Serpent Sting and refreshes your Serpent Stings.
Define(potion_of_spectral_agility_item 171270)
    ItemInfo(potion_of_spectral_agility_item cd=1 proc=307159)
Define(dreadfire_vessel_item 184030)
    ItemInfo(dreadfire_vessel_item cd=90 proc=344732)
Define(nessingwarys_trapping_apparatus_runeforge 7004)
Define(qapla_eredun_war_order_runeforge 7009)
Define(sephuzs_proclamation_runeforge 7103)
Define(soulforge_embers_runeforge 7005)
Define(eagletalons_true_focus_runeforge 7011)
Define(surging_shots_runeforge 7012)
Define(rylakstalkers_confounding_strikes_runeforge 7016)
Define(reversal_of_fortune_conduit 175)
Define(niyas_tools_poison_soulbind 320660)
    `;
// END
    code += `
SpellRequire(kill_shot unusable set=1 enabled=(target.healthpercent() > 20))
SpellRequire(harpoon unusable set=1 enabled=(target.distance() < 8))
  `;

    OvaleScripts.RegisterScript(
        "HUNTER",
        undefined,
        name,
        desc,
        code,
        "include"
    );
}
