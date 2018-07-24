import { OvaleScripts } from "../Scripts";
export function register() {
    let name = "ovale_monk_spells";
    let desc = "[8.0.1] Ovale: Monk spells";
    let code = `
ItemRequire(shifting_cosmic_sliver unusable 1=oncooldown,!fortifying_brew,buff,!fortifying_brew_buff)

## Spells
Define(blackout_combo_buff 228563)
	SpellInfo(blackout_combo_buff duration=15)
Define(blackout_kick 100784)
	SpellInfo(blackout_kick cd=3)
	SpellInfo(blackout_kick chi=1 specialization=windwalker)
	SpellRequire(blackout_kick chi_percent 0=buff,combo_breaker_bok_buff specialization=windwalker)
	SpellRequire(blackout_kick chi_percent 0=buff,serenity_buff if_spell=serenity specialization=windwalker)
	SpellAddBuff(blackout_kick combo_breaker_bok_buff=0)
	SpellAddBuff(blackout_kick shuffle_buff=1)
	SpellAddBuff(blackout_kick teachings_of_the_monastery_buff=0)
Define(blackout_kick_buff 116768)
	SpellInfo(blackout_kick_buff duration=15)
Define(blackout_strike 205523)
	SpellInfo(blackout_strike cd=3)
	SpellAddBuff(blackout_strike blackout_combo_buff=1 talent=blackout_combo_talent)
Define(black_ox_brew 115399)
	SpellInfo(black_ox_brew cd=120 gcd=0 offgcd=1 talent=black_ox_brew_talent)
Define(breath_of_fire 115181)
	SpellInfo(breath_of_fire cd=15)
	SpellAddTargetDebuff(breath_of_fire breath_of_fire_debuff=1 if_target_debuff=keg_smash_debuff)
	SpellAddBuff(breath_of_fire blackout_combo_buff=0)
Define(breath_of_fire_debuff 123725)
	SpellInfo(breath_of_fire_debuff duration=12 tick=2)
Define(chi_burst 123986)
	SpellInfo(chi_burst cd=30 travel_time=1 tag=main)
	SpellInfo(chi_burst chi=-1 max_chi=-2 specialization=windwalker)
Define(chi_torpedo 115008)
	SpellInfo(chi_torpedo charges=2 cd=20)
	SpellAddBuff(chi_torpedo )
Define(chi_torpedo_buff 119085)
	SpellInfo(chi_torpedo_buff duration=10)
Define(chi_wave 115098)
	SpellInfo(chi_wave cd=15)
Define(crackling_jade_lightning 117952)
	SpellInfo(crackling_jade_lightning channel=4)
Define(dampen_harm 122278)
	SpellInfo(dampen_harm cd=120 gcd=0 offgcd=1)
	SpellAddBuff(dampen_harm dampen_harm_buff=3)
Define(dampen_harm_buff 122278)
	SpellInfo(dampen_harm_buff duration=45)
Define(diffuse_magic 122783)
	SpellInfo(diffuse_magic cd=90 gcd=0 offgcd=1)
Define(diffuse_magic_buff 122783)
	SpellInfo(diffuse_magic_buff duration=6)
Define(elusive_brew_stacks_buff 128939)
	SpellInfo(elusive_brew_stacks_buff duration=30 max_stacks=15)
Define(elusive_dance_buff 196739)
	SpellInfo(elusive_dance_buff duration=6)
Define(energizing_elixir 115288)
	SpellInfo(energizing_brew cd=60 gcd=0 offgcd=1)
Define(enveloping_mist 124682)
	SpellInfo(enveloping_mist chi=3)
	SpellAddBuff(enveloping_mist thunder_focus_tea_buff=-1 if_spell=thunder_focus_tea)
	SpellAddTargetBuff(enveloping_mist enveloping_mist_buff=1)
Define(enveloping_mist_buff 132120)
	SpellInfo(enveloping_mist_buff duration=6 tick=1)
Define(expel_harm 115072)
	SpellInfo(expel_harm energy=15 specialization=brewmaster)
	SpellRequire(expel_harm unusable 1=spellcount_max,0)
	SpellRequire(expel_harm unusable 1=debuff,healing_immunity_debuff)
Define(eye_of_the_tiger_debuff 196608)
	SpellInfo(eye_of_the_tiger_debuff duration=8)
Define(fists_of_fury 113656)
	SpellInfo(fists_of_fury channel=4 cd=25)
	SpellInfo(fists_of_fury chi=3)
	SpellRequire(fists_of_fury chi_percent 0=buff,serenity_buff)
Define(fortifying_brew 115203)
	SpellInfo(fortifying_brew cd=420 gcd=0 offgcd=1)
	SpellAddBuff(fortifying_brew fortifying_brew_buff=1)
Define(fortifying_brew_buff 120954)
	SpellInfo(fortifying_brew_buff duration=15)
Define(fortifying_brew_mistweaver 243435)
	SpellInfo(fortifying_brew_mistweaver cd=90 gcd=0 offgcd=1)\
	SpellAddBuff(fortifying_brew_mistweaver fortifying_brew_buff_mistweaver=1)
Define(fortifying_brew_buff_mistweaver 243435)
	SpellInfo(fortifying_brew_buff duration=15)
Define(gift_of_the_ox 124502)
Define(good_karma 280195)
Define(guard 115295)
Define(healing_elixir 122281)
	SpellInfo(healing_elixir charges=2 cd=30 talent=brew_healing_elixir_talent specialization=brewmaster)
	SpellInfo(healing_elixir charges=2 cd=30 talent=mist_healing_elixir_talent specialization=mistweaver)
	SpellRequire(healing_elixir unusable 1=debuff,healing_immunity_debuff)
Define(invoke_chiji_the_red_crane 198664)
Define(invoke_niuzao_the_black_ox 132578)
	SpellInfo(invoke_niuzao cd=180 talent=invoke_niuzao_talent)
Define(invoke_xuen_the_white_tiger 123904)
	SpellInfo(invoke_xuen_the_white_tiger cd=180 talent=invoke_xuen_talent)
Define(ironskin_brew 115308)
	SpellInfo(ironskin_brew cd=21 charges=3 gcd=0 offgcd=1 cd_haste=melee)
	SpellInfo(ironskin_brew cd=18 charges=4 gcd=0 offgcd=1 cd_haste=melee talent=light_brewing_talent)
	SpellAddBuff(ironskin_brew brew_stache_buff=1 trait=brew_stache_trait)
	SpellAddBuff(ironskin_brew ironskin_brew_buff=1)
	SpellAddBuff(ironskin_brew blackout_combo_buff=0)
Define(ironskin_brew_buff 215479)
	SpellInfo(ironskin_brew_buff duration=6)
	SpellInfo(ironskin_brew_buff add_duration=0.5 pertrait=potent_kick_trait)
Define(keg_smash 121253)
	SpellInfo(keg_smash charges=1 cd=8 energy=40 specialization=brewmaster cd_haste=melee)
	SpellAddTargetDebuff(keg_smash keg_smash_debuff=1)
	SpellAddBuff(keg_smash blackout_combo_buff=0)
Define(keg_smash_debuff 121253)
Define(leg_sweep 119381)
	SpellInfo(leg_sweep cd=50 talent=tiger_tail_sweep_talent specialization=brewmaster)
	SpellInfo(leg_sweep cd=50 talent=ww_tiger_tail_sweep_talent specialization=mistweaver)
	SpellInfo(leg_sweep cd=50 talent=ww_tiger_tail_sweep_talent specialization=windwalker)
	SpellAddTargetDebuff(leg_sweep leg_sweep_debuff=1)
Define(leg_sweep_debuff 119381)
	SpellInfo(leg_sweep_debuff duration=5)
Define(life_cocoon 116849)
	SpellInfo(life_cocoon cd=120)
	SpellAddTargetBuff(life_cocoon life_cocoon_buf=1)
Define(life_cocoon_buff 116849)
	SpellInfo(life_cocoon_buff duration=12)
Define(mana_tea 197908)
	SpellInfo(mana_tea cd=90)
Define(mana_tea_buff 197908)
	SpellInfo(mana_tea_buff duration=12)
Define(mystic_touch 8647)
Define(mystic_touch_debuff 113746)
Define(paralysis 115078)
	SpellInfo(paralysis cd=45 interrupt=1)
Define(provoke 115546)
	SpellInfo(provoke cd=8)
Define(purifying_brew 119582)
	SpellInfo(purifying_brew cd=15 charges=3 gcd=0 offgcd=1 cd_haste=melee)
	SpellInfo(purifying_brew add_cd=-3 charges=4 talent=light_brewing_talent)
	SpellInfo(purifying_brew unusable=1)
	SpellAddBuff(purifying_brew blackout_combo_buff=0)
	SpellRequire(purifying_brew unusable 0=debuff,any_stagger_debuff)
Define(reawaken 212051)
Define(refreshing_jade_wind 196725)
	SpellInfo(refreshing_jade_wind cd=9 mana=700 cd_haste=spell)
Define(refreshing_jade_wind_buff 196725)
	SpellInfo(refreshing_jade_wind_buff duration=9 tick=0.8 haste=spell)
Define(renewing_mist 115151)
	SpellInfo(renewing_mist cd=9)
	SpellAddBuff(renewing_mist thunder_focus_tea_buff=-1 if_spell=thunder_focus_tea)
	SpellAddTargetBuff(renewing_mist renewing_mist_buff=1)
Define(renewing_mist_buff 119611)
	SpellInfo(renewing_mist_buff duration=18 haste=spell tick=2)
	SpellInfo(renewing_mist_buff add_duration=1 talent=mist_wrap_talent)
Define(resuscitate 115178)
Define(revival 115310)
	SpellInfo(revival cd=180)
Define(ring_of_peace 116844)
	SpellInfo(ring_of_peace cd=45)
Define(rising_sun_kick 107428)
	SpellInfo(rising_sun_kick cd=10 chi=2 specialization=windwalker cd_haste=melee)
	SpellRequire(rising_sun_kick chi_percent 0=buff,serenity_buff)
	SpellAddBuff(rising_sun_kick thunder_focus_tea_buff=-1 if_spell=thunder_focus_tea specialization=mistweaver)
Define(roll 109132)
	SpellInfo(roll cd=20 charges=2)
	SpellInfo(roll charges=3 talent=celerity_talent)
	SpellInfo(roll replace=chi_torpedo talent=chi_torpedo_talent)
Define(rushing_jade_wind 116847)
	SpellInfo(rushing_jade_wind cd=6 cd_haste=melee talent=rushing_jade_wind_talent)
	SpellAddBuff(rushing_jade_wind rushing_jade_wind_buff=1)
Define(rushing_jade_wind_buff 116847)
	SpellInfo(rushing_jade_wind_buff duration=9 haste=melee)
Define(rushing_jade_wind_windwalker 261715)
	SpellInfo(rushing_jade_wind cd=6 cd_haste=melee talent=rushing_jade_wind_talent)
Define(rushing_jade_wind_buff_windwalker 261715)
	SpellInfo(rushing_jade_wind_buff_windwalker tick=0.88 haste=melee)
Define(serenity 152173)
	SpellInfo(serenity cd=90)
	SpellAddBuff(serenity serenity_buff=1)
Define(serenity_buff 152173)
	SpellInfo(serenity_buff duration=12)
Define(song_of_chiji 198898)
	SpellInfo(song_of_chiji cd=30)
	SpellAddTargetDebuff(song_of_chiji song_of_chiji_debuff=1)
Define(song_of_chiji_debuff 198909)
	SpellInfo(song_of_chiji_debuff duration=20)
Define(soothing_mist 115175)
	SpellInfo(soothing_mist cd=1 channel=8 haste=spell)
	SpellInfo(soothing_mist soothing_mist_buff=1)
Define(soothing_mist_buff 115175)
	SpellInfo(soothing_mist_buff duration=8 haste=spell tick=1)
Define(spear_hand_strike 116705)
	SpellInfo(spear_hand_strike cd=15 gcd=0 interrupt=1 offgcd=1)
Define(spinning_crane_kick 101546)
	SpellInfo(spinning_crane_kick channel=1.5 tick=0.5)
	SpellInfo(spinning_crane_kick chi=2 haste=melee specialization=windwalker)
	SpellInfo(spinning_crane_kick haste=spell specialization=mistweaver)
	SpellRequire(spinning_crane_kick chi_percent 0=buff,serenity_buff)
Define(storm_earth_and_fire 137639)
	SpellInfo(storm_earth_and_fire tag=cd gcd=0 offgcd=1 charges=2)
	SpellInfo(storm_earth_and_fire replace=serenity talent=serenity_talent)
	SpellAddBuff(storm_earth_and_fire storm_earth_and_fire_buff=1)
Define(storm_earth_and_fire_buff 137639)
	SpellInfo(storm_earth_and_fire_buff duration=15)
Define(summon_black_ox_statue 115315)
	SpellInfo(summon_black_ox_statue cd=10 duration=900 totem=1)
Define(summon_jade_serpent_statue 115313)
	SpellInfo(summon_jade_serpent_statue cd=10 duration=900 totem=1)
Define(teachings_of_the_monastery 116645)
Define(teachings_of_the_monastery_buff 202090)
	SpellInfo(teachings_of_the_monastery_buff duration=12 max_stacks=3)
Define(thunder_focus_tea 116680)
	SpellInfo(thunder_focus_tea cd=30 gcd=0 offgcd=1)
	SpellAddBuff(thunder_focus_tea thunder_focus_tea_buff=1)
	SpellAddBuff(thunder_focus_tea thunder_focus_tea_buff=2 talent=focused_thunder_talent)
Define(thunder_focus_tea_buff 116680)
	SpellInfo(thunder_focus_tea_buff duration=30)
Define(tiger_palm 100780)
	SpellInfo(tiger_palm energy=50 specialization=windwalker)
	SpellInfo(tiger_palm energy=25 specialization=brewmaster)
	SpellAddBuff(tiger_palm teachings_of_the_monastery_buff=1)
	SpellAddBuff(tiger_palm blackout_combo_buff=0 specialization=mistweaver)
	SpellAddTargetDebuff(tiger_palm eye_of_the_tiger_debuff=1 specialization=!mistweaver talent=eye_of_the_tiger_talent)
Define(tigers_lust 116841)
	SpellInfo(tigers_lust cd=30)
	SpellAddBuff(tigers_lust tigers_lust_buff=1)
Define(tigers_lust_buff 116841)
	SpellInfo(tigers_lust_buff duration=6)
Define(touch_of_death 115080)
	SpellInfo(touch_of_death cd=120 tag=main)
	SpellAddTargetDebuff(touch_of_death touch_of_death_debuff=1)
	SpellRequire(touch_of_death unusable 1=target_debuff,touch_of_death_debuff)
Define(touch_of_death_debuff 115080)
	SpellInfo(touch_of_death_debuff duration=8)
Define(touch_of_karma 122470)
	SpellInfo(touch_of_karma cd=90 tag=cd gcd=0 offgcd=1)
	SpellAddTargetDebuff(touch_of_karma touch_of_karma_debuff=1)
Define(touch_of_karma_debuff 122470)
	SpellInfo(touch_of_karma_debuff duration=10)
Define(transcendence 101643)
Define(transcendence_transfer 119996)
Define(vivify 116670)
	SpellAddBuff(vivify thunder_focus_tea_buff=-1 if_spell=thunder_focus_tea)
Define(whirling_dragon_punch 152175)
	SpellInfo(whirling_dragon_punch cd=24 unusable=1 cd_haste=melee)
	SpellRequire(whirling_dragon_punch unusable 0=oncooldown,rising_sun_kick)
	SpellRequire(whirling_dragon_punch unusable 0=oncooldown,fists_of_fury)
Define(zen_meditation 115176)
	SpellInfo(zen_meditation cd=300 gcd=0 offgcd=1)
	SpellAddBuff(zen_meditation zen_meditation_buff=1)
Define(zen_meditation_buff 115176)
	SpellInfo(zen_meditation_buff duration=8)
	
## Stagger
Define(stagger 115069)
Define(heavy_stagger_debuff 124273)
	SpellInfo(heavy_stagger_debuff duration=10 tick=1)
	SpellInfo(heavy_stagger_debuff add_duration=3 tlent=bob_and_weave_talent)
Define(light_stagger_debuff 124275)
	SpellInfo(light_stagger_debuff duration=10 tick=1)
	SpellInfo(light_stagger_debuff add_duration=3 tlent=bob_and_weave_talent)
Define(moderate_stagger_debuff 124274)
	SpellInfo(moderate_stagger_debuff duration=10 tick=1)
	SpellInfo(moderate_stagger_debuff add_duration=3 tlent=bob_and_weave_talent)
SpellList(any_stagger_debuff light_stagger_debuff moderate_stagger_debuff heavy_stagger_debuff)

## Items
Define(convergence_of_fates 140806)
Define(drinking_horn_cover 137097)
Define(firestone_walkers 137027)
Define(fundamental_observation 137063)
	SpellInfo(zen_meditation cd=150 if_equipped=fundamental_observation)
Define(hidden_masters_forbidden_touch 137057)
Define(hidden_masters_forbidden_touch_buff 213114)
	SpellInfo(hidden_masters_forbidden_touch_buff duration=5)
Define(katsuos_eclipse 137029)
	SpellInfo(fists_of_fury chi=2 if_equipped=katsuos_eclipse)

Define(salsalabims_lost_tunic 137016)
Define(stormstouts_last_gasp 151788)
	SpellInfo(keg_smash charges=2 if_equipped=stormstouts_last_gasp)
Define(the_emperors_capacitor 144239)
	SpellAddBuff(crackling_jade_lightning the_emperors_capacitor_buff=0)
Define(the_emperors_capacitor_buff 235054)

## Tiers
SpellInfo(rising_sun_kick add_cd=-1 specialization=windwalker itemset=T19 itemcount=2)
Define(rising_fist_debuff 242259) # T20 2p bonus
	SpellInfo(rising_fist_debuff duration=8)
	SpellAddBuff(fists_of_fury rising_fist_debuff=1 itemset=T20 itemcount=4)
	SpellAddTargetDebuff(rising_sun_kick rising_fist_debuff=0)
Define(pressure_point_buff 247255) # T20 4p bonus
	SpellInfo(pressure_point_buff duration=5)

## Talents
Define(ascension_talent 7)
Define(black_ox_brew_talent 9)
Define(blackout_combo_talent 21)
Define(bob_and_weave_talent 13)
Define(celerity_talent 4)
Define(chi_burst_talent 3)
Define(chi_torpedo_talent 5)
Define(chi_wave_talent 2)
Define(dampen_harm_talent 15)
Define(diffuse_magic_talent 14)
Define(energizing_elixir_talent 9)
Define(eye_of_the_tiger_talent 1)
Define(fist_of_the_white_tiger_talent 8)
Define(focused_thunder_talent 19)
Define(good_karma_talent 11)
Define(guard_talent 20)
Define(healing_elixir_talent 14)
Define(healing_elixir_talent_mistweaver 13)
Define(high_tolerance_talent 19)
Define(hit_combo_talent 16)
Define(inner_strength_talent 13)
Define(invoke_chiji_talent 18)
Define(invoke_niuzao_talent 18)
Define(invoke_xuen_talent 18)
Define(lifecycles_talent 7)
Define(light_brewing_talent 7)
Define(mana_tea_talent 9)
Define(mist_wrap_talent 1)
Define(refreshing_jade_wind_talent 17)
Define(ring_of_peace_talent 12)
Define(rising_mist_talent 21)
Define(rushing_jade_wind_talent 17)
Define(rushing_jade_wind_talent 17)
Define(serenity_talent 21)
Define(song_of_chiji_talent 11)
Define(special_delivery_talent 16)
Define(spirit_of_the_crane_talent 8)
Define(spiritual_focus_talent 19)
Define(spitfire_talent 8)
Define(summon_black_ox_statue_talent 11)
Define(summon_jade_serpent_statue_talent 16)
Define(tiger_tail_sweep_talent 10)
Define(tigers_lust_talent 6)
Define(upwelling_talent 20)
Define(whirling_dragon_punch_talent 20)

# Non-default tags for OvaleSimulationCraft.
	SpellInfo(chi_brew tag=main)
	SpellInfo(chi_torpedo tag=shortcd)
	SpellInfo(dampen_harm tag=cd)
	SpellInfo(diffuse_magic tag=cd)
`;
    OvaleScripts.RegisterScript("MONK", undefined, name, desc, code, "include");
}
