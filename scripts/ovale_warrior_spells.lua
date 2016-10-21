local OVALE, Ovale = ...
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "ovale_warrior_spells"
	local desc = "[7.0] Ovale: Warrior spells"
	local code = [[
# Warrior spells and functions.

# Learned spells.
Define(meat_cleaver 12950)
	SpellInfo(meat_cleaver learn=1 level=58 specialization=fury)
Define(unwavering_sentinel 29144)
	SpellInfo(unwavering_sentinel learn=1 level=10 specialization=protection)
Define(avatar 107574)
	SpellInfo(avatar cd=90 gcd=0)
Define(avatar_buff 107574)
	SpellInfo(avatar_buff duration=20)
Define(battle_cry 1719)
	SpellAddBuff(battle_cry battle_cry_buff=1 cd=60)
Define(battle_cry_buff 1719)
	SpellInfo(battle_cry_buff duration=5)
Define(battle_cry_deadly_calm_buff -1719)
	SpellInfo(battle_cry_deadly_calm_buff duration=5)
	SpellRequire(mortal_strike rage 0=buff,battle_cry_deadly_calm_buff)
	SpellRequire(overpower rage 0=buff,battle_cry_deadly_calm_buff)
	SpellRequire(rend rage 0=buff,battle_cry_deadly_calm_buff)
	SpellRequire(focused_rage rage 0=buff,battle_cry_deadly_calm_buff)
	SpellRequire(execute rage 0=buff,battle_cry_deadly_calm_buff)
	SpellRequire(slam rage 0=buff,battle_cry_deadly_calm_buff)
	SpellRequire(cleave rage 0=buff,battle_cry_deadly_calm_buff)
	SpellAddBuff(battle_cry battle_cry_deadly_calm_buff=1 talent=deadly_calm_talent)
Define(berserker_rage 18499)
	SpellInfo(berserker_rage cd=60 gcd=0)
	SpellAddBuff(berserker_rage berserker_rage_buff=1)
	SpellAddBuff(berserker_rage enrage_buff=1 specialization=fury talent=outburst_talent)
Define(berserker_rage_buff 18499)
	SpellInfo(berserker_rage_buff duration=6)
Define(bladestorm 46924)
	SpellInfo(bladestorm cd=90 channel=6 haste=melee)
Define(bloodbath 12292)
	SpellInfo(bloodbath cd=30 gcd=0)
	SpellAddBuff(bloodbath bloodbath_buff=1)
Define(bloodbath_buff 12292)
	SpellInfo(bloodbath_buff duration=10)
Define(bloodthirst 23881)
	SpellInfo(bloodthirst cd=4.5 rage=-10)
	SpellAddBuff(bloodthirst meat_cleaver_buff=-1)
Define(charge 100)
	SpellInfo(charge cd=20 gcd=0 offgcd=1 rage=-20 travel_time=1)
	SpellInfo(charge addcd=-3 talent=double_time_talent)
	SpellAddTargetDebuff(charge charge_debuff=1)
Define(charge_debuff 100)	# OvaleWarriorCharge
Define(cleave 845)
	SpellInfo(cleave cd=6 cd_haste=melee rage=10)
	SpellInfo(cleave rage_percent=80 talent=dauntless_talent)
	SpellRequire(cleave rage 0=buff,battle_cry_buff talent=deadly_calm_talent)
Define(cleave_buff 188923)
Define(colossus_smash 167105)
	SpellInfo(colossus_smash cd=45)
	SpellAddTargetDebuff(colossus_smash colossus_smash_debuff=1)
Define(colossus_smash_debuff 167105)
	SpellInfo(colossus_smash_debuff duration=8)
	SpellInfo(colossus_smash_debuff addduration=16 talent=titanic_might_talent)
Define(commanding_shout 97462)
	SpellInfo(commanding_shout cd=180 gcd=0 offgcd=1)
	SpellAddBuff(commanding_shout commanding_shout_buff=1)
Define(commanding_shout_buff 97463)
	SpellInfo(commanding_shout_buff duration=10)
Define(deep_wounds 115768)
Define(deep_wounds_debuff 115767)
	SpellInfo(deep_wounds_debuff duration=15 tick=3)
Define(demoralizing_shout 1160)
	SpellInfo(demoralizing_shout cd=90 gcd=0 offgcd=1)
	SpellAddTargetDebuff(demoralizing_shout demoralizing_shout_debuff=1)
Define(demoralizing_shout_debuff 1160)
	SpellInfo(demoralizing_shout_debuff duration=8)
Define(devastate 20243)
	SpellAddTargetDebuff(devastate deep_wounds_debuff=1 if_spell=deep_wounds)
Define(dragon_roar 118000)
	SpellInfo(dragon_roar cd=25)
	SpellAddBuff(dragon_roar dragon_roar_buff=1)
Define(dragon_roar_buff 118000)
	SpellInfo(dragon_roar_buff duration=6)
Define(enrage_buff 184362)
	SpellInfo(enrage_buff duration=4 enrage=1)
Define(enraged_regeneration 184364)
	SpellInfo(enraged_regeneration cd=120 gcd=0 offgcd=1)
Define(enraged_regeneration_buff 184364)
	SpellInfo(enraged_regeneration_buff duration=8)
Define(execute 5308)
	SpellInfo(execute rage=25 target_health_pct=20)
Define(execute_arms 163201)
	SpellInfo(execute_arms rage=10 extra_rage=30 target_health_pct=20)
	SpellInfo(execute_arms rage_percent=80 talent=dauntless_talent)
	SpellRequire(execute_arms rage 0=buff,battle_cry_buff talent=deadly_calm_talent)
Define(focused_rage 207982)
	SpellInfo(focused_rage cd=1.5 cd_haste=melee gcd=0 offgcd=1 rage=15)
	SpellInfo(focused_rage rage_percent=80 talent=dauntless_talent)
	SpellRequire(focused_rage rage 0=buff,battle_cry_buff talent=deadly_calm_talent)
	SpellAddBuff(focused_rage focused_rage_buff=1)
	SpellInfo(focused_rage replace=focused_rage_protection specialization=protection)
Define(focused_rage_buff 207982)
	SpellInfo(focused_rage_buff duration=30)
Define(focused_rage_protection 204488)
	SpellInfo(focused_rage_protection cd=1.5 cd_haste=melee rage=30)
	SpellAddBuff(focused_rage_protection focused_rage_protection_buff=1)
Define(focused_rage_protection_buff 204488)
	SpellInfo(focused_rage_protection_buff duration=30)
Define(frenzy_buff 202539)
	SpellInfo(frenzy_buff duration=10)
Define(frothing_berserker_buff 215572)
Define(furious_slash 100130)
	SpellAddBuff(furious_slash frenzy_buff=1 talent=frenzy_talent)
Define(hamstring 1715)
	SpellInfo(hamstring cd=1 gcd=0 offgcd=1 rage=8)
	SpellAddTargetDebuff(hamstring hamstring_debuff=1)
Define(hamstring_debuff 1715)
	SpellInfo(hamstring_debuff duration=15)
Define(heroic_leap 6544)
	SpellInfo(heroic_leap cd=45 gcd=0 offgcd=1 travel_time=1)
	SpellInfo(heroic_leap addcd=-15 talent=bounding_stride_talent)
	SpellAddBuff(heroic_leap heroic_leap_buff=1 talent=bounding_stride_talent)
Define(heroic_leap_buff 202164)
Define(heroic_throw 57755)
	SpellInfo(heroic_throw cd=6 travel_time=1)
	SpellInfo(heroic_throw addcd=-6 specialization=protection)
Define(ignore_pain 190456)
	SpellInfo(ignore_pain cd=1 gcd=0 offgcd=1 rage=20 extra_rage=40)
	SpellAddBuff(ignore_pain ignore_pain_buff=1)
Define(ignore_pain_buff 190456)
	SpellInfo(ignore_pain duration=15)
Define(impending_victory 202168)
	SpellInfo(impending_victory rage=10 cd=30)
	SpellRequire(impending_victory cd 0=victorious_buff)
	SpellAddBuff(impending_victory victorious_buff=0)
Define(intercept 198304)
	SpellInfo(intercept cd=20 rage=-20)
Define(juggernaut 200875)
	SpellAddBuff(execute juggernaut_buff=1 if_spell=juggernaut)
Define(juggernaut_buff 201009)
Define(last_stand 12975)
	SpellInfo(last_stand cd=180 gcd=0 offgcd=1)
	SpellAddBuff(last_stand last_stand_buff=1)
Define(last_stand_buff 12975)
	SpellInfo(last_stand_buff duration=15)
Define(massacre_buff 206316)
Define(meat_cleaver_buff 85739)
	SpellInfo(meat_cleaver_buff duration=10)
Define(mortal_strike 12294)
	SpellInfo(mortal_strike cd=6 cd_haste=melee rage=20)
	SpellInfo(mortal_strike rage_percent=80 talent=dauntless_talent)
	SpellInfo(mortal_strike charges=2 talent=mortal_combo_talent)
	SpellRequire(mortal_strike rage 0=buff,battle_cry_buff talent=deadly_calm_talent)
	SpellAddTargetDebuff(mortal_strike mortal_wounds_debuff=1)
Define(mortal_wounds_debuff 115804)
	SpellInfo(mortal_wounds_debuff duration=10)
Define(odyns_fury 205545)
	SpellInfo(odyns_fury cd=45)
Define(overpower 7384)
	SpellInfo(overpower rage=10)
	SpellAddBuff(overpower overpower_buff=-1)
	SpellRequire(overpower rage 0=buff,battle_cry_buff talent=deadly_calm_talent)
	SpellRequire(overpower unusable 1=buff,!overpower_buff)
Define(overpower_buff 60503)
	SpellInfo(overpower_buff duration=12)
Define(precise_strikes_buff 164323)
Define(pummel 6552)
	SpellInfo(pummel cd=15 gcd=0 interrupt=1 offgcd=1)
Define(raging_blow 85288)
	SpellInfo(raging_blow rage=-5)
	SpellInfo(raging_blow cd=4.5 cd_haste=melee talent=inner_rage_talent)
	SpellRequire(raging_blow unusable 1=buff,!enrage_buff talent=!inner_rage_talent)
Define(rampage 184367)
	SpellInfo(rampage gcd=1.5 cd_haste=none rage=85)
	SpellInfo(rampage rage=70 talent=carnage_talent)
	SpellAddBuff(rampage enrage_buff=1)
	SpellAddBuff(rampage meat_cleaver_buff=-1)
	SpellRequire(rampage rage 0=buff,massacre_buff talent=massacre_talent)
Define(rampage_buff 166588) #T17 4 piece
	SpellInfo(rampage_buff duration=5)
Define(ravager 152277)
	SpellInfo(ravager cd=60)
	SpellInfo(ravager ravager_buff=1)
	SpellInfo(ravager replace=ravager_protection specialization=protection)
Define(ravager_buff 152277)
	SpellInfo(ravager_buff duration=10)
Define(ravager_protection 228920)
	SpellAddBuff(ravager_protection ravager_protection_buff=1)
Define(ravager_protection_buff 227744)
	SpellInfo(ravager_protection_buff duration=10)
Define(rend 772)
	SpellInfo(rend rage=15)
	SpellRequire(rend rage 0=buff,battle_cry_buff talent=deadly_calm_talent)
	SpellInfo(rend rage_percent=80 talent=dauntless_talent)
Define(rend_debuff 772)
	SpellInfo(rend_debuff duration=15 tick=3)
Define(revenge 6572)
	SpellInfo(revenge cd=9 cd_haste=melee)
	SpellInfo(revenge rage=-5)
	SpellAddTargetDebuff(devastate deep_wounds_debuff=1 if_spell=deep_wounds)
Define(shattered_defenses_buff 209574)
Define(shield_block 2565)
	SpellInfo(shield_block cd=13 cd_haste=melee gcd=0 offgcd=1 rage=10)
Define(shield_block_buff 132404)
	SpellInfo(shield_block_buff duration=6)
Define(shield_slam 23922)
	SpellInfo(shield_slam cd=9 cd_haste=melee rage=-15)
Define(shield_wall 871)
	SpellInfo(shield_wall cd=240 gcd=0 offgcd=1)
	SpellAddBuff(shield_wall shield_wall_buff=1)
Define(shield_wall_buff 871)
	SpellInfo(shield_wall duration=8)
Define(shockwave 46968)
	SpellInfo(shockwave cd=40)
Define(slam 1464)
	SpellInfo(slam rage=20)
	SpellInfo(slam rage_percent=80 talent=dauntless_talent)
	SpellRequire(slam rage 0=buff,battle_cry_buff talent=deadly_calm_talent)
Define(spell_reflection 23920)
	SpellInfo(spell_reflection cd=25)
Define(stone_heart_buff 225947)
Define(storm_bolt 107570)
	SpellInfo(storm_bolt cd=30)
Define(t18_class_trinket 124523)
Define(taunt 355)
	SpellInfo(taunt cd=8)
	SpellInfo(taunt addcd=-8 if_buff=berserker_rage_buff talent=warlords_challenge_talent)
Define(thunder_clap 6343)
	SpellInfo(thunder_clap cd=6 cd_haste=melee)
Define(ultimatum_buff 122510)
	SpellInfo(ultimatum_buff duration=10)
Define(unquenchable_thirst 169683)
Define(unyielding_strikes 169685)
Define(unyielding_strikes_buff 169686)
	SpellInfo(unyielding_strikes_buff duration=5 max_stacks=6 stacking=1)
Define(vengeance_focused_rage_buff 202573)
	SpellRequire(focused_rage rage_percent 50=buff,vengeance_focused_rage_buff)
Define(vengeance_ignore_pain_buff 202574)
	SpellRequire(ignore_pain rage_percent 50=buff,vengeance_ignore_pain_buff)
Define(victorious_buff 32216)
	SpellInfo(victorious_buff duration=20)
Define(victory_rush 34428)
	SpellRequire(victory_rush unusable 1=buff,!victorious_buff)
	SpellAddBuff(victory_rush victorious_buff=0)
Define(warbreaker 209577)
	SpellInfo(warbreaker cd=60)
Define(whirlwind 190411)
	SpellInfo(whirlwind rage=25 specialization=arms)
	SpellInfo(whirlwind rage_percent=80 talent=dauntless_talent specialization=arms)
	SpellAddBuff(whirlwind meat_cleaver_buff=1)
	SpellAddBuff(whirlwind wrecking_ball_buff=0)
Define(wrecking_ball_buff 215570)
	SpellInfo(wrecking_ball_buff duration=12)

# Artifacts
Define(neltharions_fury 203524)
	SpellInfo(neltharions_fury cd=45)
Define(neltharions_fury_buff 203524)
	SpellInfo(neltharions_fury_buff duration=3)

# Legion legendary items
Define(archavons_heavy_hand 137060)
Define(archavons_heavy_hand_spell 205144)
	# TODO Mortal strike refunds 15 rage
Define(fujiedas_fury_buff 207776)
	SpellAddBuff(bloodthirst fujiedas_fury_buff=1 if_spell=fujiedas_fury_buff)

# Talents
Define(anger_management_talent 19)
Define(avatar_talent 9)
Define(bladestorm_talent 19)
Define(bloodbath_talent 16)
Define(booming_voice_talent 18)
Define(bounding_stride_talent 11)
Define(carnage_talent 15)
Define(dauntless_talent 1)
Define(deadly_calm_talent 16)
Define(dragon_roar_talent 18)
Define(double_time_talent 6)
Define(fervor_of_battle_talent 7)
Define(focused_rage_talent 15)
Define(frenzy_talent 17)
Define(frothing_berserker_talent 14)
Define(gladiators_resolve_talent 21)
Define(heavy_repercussions_talent 20)
Define(in_for_the_kill_talent 13)
Define(inner_rage_talent 18)
Define(massacre_talent 13)
Define(mortal_combo_talent 14)
Define(outburst_talent 8)
Define(ravager_talent 20)
Define(sweeping_strikes_talent 3)
Define(titanic_might_talent 18)
Define(ultimatum_talent 8)
Define(vengeance_talent 16)
Define(warlords_challenge_talent 10)
Define(wrecking_ball_talent 7)

# Non-default tags for OvaleSimulationCraft.
	SpellInfo(heroic_throw tag=main)
	SpellInfo(impending_victory tag=main)
	SpellInfo(colossus_smash tag=main)
	# SpellInfo(dragon_roar tag=main) # TODO: As Checkbox?
	SpellInfo(hamstring tag=cd)
	SpellInfo(battlecry tag=cd)
	SpellInfo(avatar tag=cd)
	SpellInfo(intercept tag=shortcd)
]]

	OvaleScripts:RegisterScript("WARRIOR", nil, name, desc, code, "include")
end
