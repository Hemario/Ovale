local __exports = LibStub:NewLibrary("ovale/scripts/ovale_demonhunter_spells", 80000)
if not __exports then return end
local __Scripts = LibStub:GetLibrary("ovale/Scripts")
local OvaleScripts = __Scripts.OvaleScripts
__exports.register = function()
    local name = "ovale_demonhunter_spells"
    local desc = "[7.0] Ovale: DemonHunter spells"
    local code = [[

ItemRequire(shifting_cosmic_sliver unusable 1=oncooldown,!metamorphosis_veng,buff,!metamorphosis_veng_buff)	

Define(annihilation 201427)
	SpellInfo(annihilation fury=40)
Define(blade_dance 188499)
	SpellInfo(blade_dance replace death_sweep=buff,metamorphosis_havoc_buff)
	SpellInfo(blade_dance fury=35 cd=9 cd_haste=melee)
	SpellInfo(blade_dance add_fury=-20 talent=first_blood_talent)
	SpellAddTargetDebuff(blade_dance blade_dance_debuff)
Define(blade_dance_debuff 258883)
	SpellInfo(blade_dance_debuff duration=4 tick=1)
Define(blur 198589)
	SpellInfo(blur cd=60 gcd=0 offgcd=1)
Define(chaos_brand_debuff 1490)
Define(chaos_nova 179057)
	SpellInfo(chaos_nova cd=60 fury=30)
	SpellInfo(chaos_nova cd=40 fury=0 talent=unleashed_power_talent)
	SpellAddBuff(chaos_nova chaos_nova_debuff=1)
Define(chaos_nova_debuff 179057)
	SpellInfo(chaos_nova_debuff duration=2)
Define(chaos_strike 162794)
	SpellInfo(chaos_strike replace annihilation=buff,metamorphosis_havoc_buff)
	SpellInfo(chaos_strike fury=40)
Define(consume_magic 278326)
	SpellInfo(consume_magic cd=10)
Define(dark_slash 258860)
	SpellInfo(dark_slash cd=20)
	SpellAddTargetDebuff(dark_slash dark_slash_debuff=1)
Define(dark_slash_debuff 258860)
	SpellInfo(dark_slash_debuff duration=8)
Define(darkness 196718)
	SpellInfo(darkness cd=180)
Define(death_sweep 210152)
	SpellInfo(death_sweep fury=35 cd=9 cd_haste=melee)
	SpellInfo(death_sweep add_fury=-20 talent=first_blood_talent)
Define(demon_spikes 203720)
	SpellInfo(demon_spikes cd_haste=melee haste=melee specialization=vengeance cd=20 gcd=0 offgcd=1 charges=2)
	SpellAddBuff(demon_spikes demon_spikes_buff=1)
Define(demon_spikes_buff 203819)
	SpellInfo(demon_spikes_buff duration=6)
Define(demons_bite 162243)
	SpellInfo(demons_bite fury=-20)
	SpellInfo(demons_bite unusable=1 talent=demon_blades_talent)
Define(disrupt 183752)
	SpellInfo(disrupt cd=15 gcd=0 interrupt=1 offgcd=1)
Define(eye_beam 198013)
	SpellInfo(eye_beam fury=30 cd=30 channel=1.8)
	SpellInfo(eye_beam channel=2.8 talent=blind_fury_talent)
Define(extended_by_demonic_buff -22547) # OvaleDemonHunterDemonic
Define(feast_of_souls_buff 207693)
	SpellInfo(feast_of_souls_buff duration=6)
Define(fel_barrage 258925)
	SpellInfo(fel_barrage cd=60 channel=3)
Define(fel_devastation 212084)
	SpellInfo(fel_devastation cd=60 channel=2)
Define(fel_eruption 211881)
	SpellInfo(fel_eruption cd=30 interrupt=1)
	SpellInfo(fel_eruption fury=10 specialization=havoc)
Define(fel_rush 195072)
	SpellInfo(fel_rush cd=10 charges=2)
	SpellAddBuff(fel_rush momentum_buff=1 talent=momentum_talent specialization=havoc)
Define(felblade 232893)
	SpellInfo(felblade cd=15 cd_haste=melee fury=-40 pain=-30)
Define(fiery_brand 204021)
	SpellInfo(fiery_brand cd=60 gcd=0)
	SpellAddTargetDebuff(fiery_brand fiery_brand_debuff=1)
Define(fiery_brand_debuff 207771)
	SpellInfo(fiery_brand_debuff duration=8)
Define(fracture 263642)	
	SpellInfo(fracture pain=-25 charges=2 cd=4.5 cd_haste=melee)
Define(frailty_debuff 247456)
	SpellInfo(frailty_debuff duration=20)
Define(immolation_aura 178740)
	SpellInfo(immolation_aura cd=15 cd_haste=melee)
	SpellAddBuff(immolation_aura immolation_aura_buff=1)
Define(immolation_aura_buff 178740)
	SpellInfo(immolation_aura_buff duration=6)
Define(immolation_aura_havoc 258920)
	SpellInfo(immolation_aura_havoc cd=30 cd_haste=melee)
	SpellAddBuff(immolation_aura_havoc immolation_aura_havoc_buff=1)
Define(immolation_aura_havoc_buff 258920)
	SpellInfo(immolation_aura_buff duration=10)
Define(imprison 217832)
	SpellInfo(imprison cd=45 interrupt=1)
Define(infernal_strike 189110)
	SpellInfo(infernal_strike cd=20 charges=2 offgcd=1)
	SpellInfo(infernal_strike add_cd=8 talent=abyssal_strike_talent)
Define(metamorphosis_havoc 191427)
	SpellInfo(metamorphosis_havoc cd=240)
	SpellAddBuff(metamorphosis_havoc metamorphosis_havoc_buff=1)
Define(metamorphosis_havoc_buff 162264)
	SpellInfo(metamorphosis_havoc_buff duration=30)
Define(metamorphosis_veng 187827)
	SpellInfo(metamorphosis_veng cd=180 gcd=0 offgcd=1)
	SpellAddBuff(metamorphosis_veng metamorphosis_veng_buff=1)
Define(metamorphosis_veng_buff 187827)
	SpellInfo(metamorphosis_veng_buff duration=15)
Define(momentum_buff 208628)
	SpellInfo(momentum_buff duration=6)
Define(nemesis 206491)
	SpellInfo(nemesis cd=120)
	SpellAddTargetDebuff(nemesis nemesis_debuff=1)
Define(nemesis_debuff 206491)
	SpellInfo(nemesis_debuff duration=60)
Define(netherwalk 196555)
	SpellInfo(netherwalk cd=120)
	SpellAddBuff(netherwalk netherwalk_buff=1)
Define(netherwalk_buff 196555)
	SpellInfo(netherwalk_buff duration=5)
Define(pick_up_fragment 210788)
Define(prepared_buff 203650)
	SpellInfo(prepared_buff duration=10)
Define(razor_spikes_debuff 210003)
	SpellInfo(razor_spikes_debuff duration=6)
Define(shear 203782)
	SpellInfo(shear pain=-10)
	SpellInfo(shear replace=fracture talent=fracture_talent)
Define(sigil_of_chains 202138)
	SpellInfo(sigil_of_chains cd=90)
Define(sigil_of_flame 204596)
	SpellInfo(sigil_of_flame cd=30)
	SpellInfo(sigil_of_flame cd=24 talent=quickened_sigils_talent)
Define(sigil_of_flame_debuff 204598)
	SpellInfo(sigil_of_flame_debuff duration=6)
	SpellInfo(sigil_of_flame_debuff duration=8 talent=concentrated_sigils_talent)
Define(sigil_of_misery 207684)
	SpellInfo(sigil_of_misery cd=90)
	SpellInfo(sigil_of_misery cd=72 talent=quickened_sigils_talent)
Define(sigil_of_misery_debuff 207685)
	SpellInfo(sigil_of_misery_debuff duration=20)
	SpellInfo(sigil_of_misery_debuff duration=22 talent=concentrated_sigils_talent)
Define(sigil_of_silence 202137)
	SpellInfo(sigil_of_silence cd=60)
	SpellInfo(sigil_of_silence cd=48 talent=quickened_sigils_talent)
Define(sigil_of_silence_debuff 204490)
	SpellInfo(sigil_of_silence_debuff duration=6)
	SpellInfo(sigil_of_silence_debuff duration=8 talent=concentrated_sigils_talent)
Define(soul_barrier 263648)
	SpellInfo(soul_barrier cd=30)
	SpellAddBuff(soul_barrier soul_fragments=0)
Define(soul_barrier_buff 263648)
	SpellInfo(soul_barrier_buff duration=12)
Define(soul_cleave 228477)
	SpellInfo(soul_cleave pain=30)
	SpellAddBuff(soul_cleave soul_fragments=-2)
	SpellAddBuff(soul_cleave feast_of_souls_buff=1 talent=feast_of_souls_talent)
Define(soul_fragments 203981)
	SpellInfo(soul_fragments duration=20)		
Define(spectral_sight 188501)
	SpellInfo(spectral_sight cd=30)
Define(spirit_bomb 247454)
	SpellRequire(spirit_bomb unusable 1=buff,!soul_fragments)
	SpellAddBuff(spirit_bomb soul_fragments=-5)
	SpellAddTargetDebuff(spirit_bomb frailty_debuff=1)
Define(throw_glaive_veng 204157)
	SpellInfo(throw_glaive_veng cd=3 cd_haste=melee)
Define(throw_glaive_havoc 185123)
	SpellInfo(throw_glaive_havoc charges=1 cd=9 cd_haste=melee)
	SpellInfo(throw_glaive_havoc charges=2 talent=master_of_the_glaive_talent)
	SpellAddTargetDebuff(throw_glaive_havoc throw_glaive_havoc_debuff=1)
Define(throw_glaive_havoc_debuff 213405)
	SpellInfo(throw_glaive_havoc_debuff duration=6)
Define(vengeful_retreat 198793)
	SpellInfo(vengeful_retreat cd=20)
	
	SpellAddTargetDebuff(vengeful_retreat vengeful_retreat_debuff=1)
Define(vengeful_retreat_debuff 198813)
	SpellInfo(vengeful_retreat_debuff duration=3)

#items
Define(oblivions_embrace 151799)
	SpellInfo(demon_spikes charges=3 if_equipped=oblivions_embrace)

# Tier set
SpellInfo(demons_bite fury_percent=110 itemset=T19 itemcount=2)
SpellInfo(felblade fury_percent=110 itemset=T19 itemcount=2)

#Talents
Define(abyssal_strike_talent 1)
Define(agonizing_flames_talent 2)
Define(blind_fury_talent 1)
Define(burning_alive_talent 6)
Define(charred_flesh_talent 8)
Define(concentrated_sigils_talent 13)
Define(cycle_of_hatred_talent 13)
Define(dark_slash_talent 15)
Define(demon_blades_talent 5)
Define(demonic_appetite_talent 2)
Define(demonic_talent 19)
Define(desperate_instincts_talent 11)
Define(fallout_talent 5)
Define(feast_of_souls_talent 4)
Define(feed_the_demon_talent 11)
Define(fel_barrage_talent 9)
Define(fel_devastation_talent 18)
Define(fel_eruption_talent 18)
Define(fel_mastery_talent 8)
Define(felblade_talent_havoc 3)
Define(felblade_talent 9)
Define(first_blood_talent 14)
Define(flame_crash_talent 7)
Define(fracture_talent 12)
Define(gluttony_talent 16)
Define(immolation_aura_talent 6)
Define(insatiable_hunger_talent 4)
Define(last_resort_talent 19)
Define(master_of_the_glaive_talent 17)
Define(momentum_talent 20)
Define(nemesis_talent 21)
Define(netherwalk_talent 12)
Define(quickened_sigils_talent 14)
Define(razor_spikes_talent 3)
Define(sigil_of_chains_talent 15)
Define(soul_barrier_talent 21)
Define(soul_rending_talent 10)
Define(spirit_bomb_talent 17)
Define(trail_of_ruin_talent 7)
Define(unleashed_power_talent 16)
Define(void_reaver_talent 20)

# Tags
SpellInfo(dark_slash tag=main)
SpellInfo(demon_spikes tag=shortcd)
SpellInfo(fel_barrage tag=main)
SpellInfo(fel_eruption tag=main)
SpellInfo(fel_rush tag=main)
SpellInfo(felblade tag=main)
SpellInfo(sigil_of_flame tag=main)
SpellInfo(vengeful_retreat tag=main)

]]
    OvaleScripts:RegisterScript("DEMONHUNTER", nil, name, desc, code, "include")
end
