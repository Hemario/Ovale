local OVALE, Ovale = ...
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "ovale_priest_spells"
	local desc = "[6.0.2] Ovale: Priest spells"
	local code = [[
# Priest spells and functions.

# Learned spells
Define(borrowed_time 52798)
	SpellInfo(borrowed_time learn=1 level=10 specialization=discipline)
Define(rapture 47536)
	SpellInfo(rapture learn=1 level=10 specialization=discipline)
Define(surge_of_light 109186)
	SpellInfo(surge_of_light learn=1 level=45 specialization=discipline)
	SpellInfo(surge_of_light learn=1 level=45 specialization=holy)

Define(archangel 81700)
	SpellInfo(archangel cd=30 gcd=0 offgcd=1)
	SpellRequire(archangel unusable 1=buff,!evangelism_buff)
	SpellAddBuff(archangel archangel_buff=1)
	SpellAddBuff(archangel clear_thoughts_buff=1 itemset=T17 itemcount=4)
	SpellAddBuff(archangel evangelism_buff=0 if_spell=evangelism)
Define(archangel_buff 81700)
	SpellInfo(archangel_buff duration=18)
Define(auspicious_spirits_talent 21)
Define(binding_heal 32546)
	SpellAddTargetBuff(binding_heal renew=refresh,buff,chakra_serenity_buff if_spell=chakra_serenity)
Define(borrowed_time_buff 59889)
	SpellInfo(borrowed_time_buff duration=6)
Define(cascade_caster 121135)
	SpellInfo(cascade_caster cd=25 travel_time=1)
Define(cascade_heal 121135)
	SpellInfo(cascade_heal cd=25 travel_time=1)
Define(cascade_talent 16)
Define(chakra_chastise 81209)
	SpellInfo(chakra_chastise cd=30)
	SpellInfo(chakra_chastise addcd=-20 if_spell=enhanced_chakras)
	SpellAddBuff(chakra_chastise chakra_chastise_buff=1)
Define(chakra_chastise_buff 81209)
Define(chakra_sanctuary 81209)
	SpellInfo(chakra_sanctuary cd=30)
	SpellInfo(chakra_sanctuary addcd=-20 if_spell=enhanced_chakras)
	SpellAddBuff(chakra_sanctuary chakra_sanctuary_buff=1)
Define(chakra_sanctuary_buff 81209)
Define(chakra_serenity 81208)
	SpellInfo(chakra_serenity cd=30)
	SpellInfo(chakra_serenity addcd=-20 if_spell=enhanced_chakras)
	SpellAddBuff(chakra_serenity chakra_serenity_buff=1)
Define(chakra_serenity_buff 81209)
Define(circle_of_healing 34861)
	SpellInfo(circle_of_healing cd=12)
	SpellInfo(circle_of_healing addcd=-4 itemset=T14_heal itemcount=4)
Define(clarity_of_power 155246)
Define(clarity_of_power_talent 19)
Define(clear_thoughts_buff 167695)
	SpellInfo(clear_thoughts_buff duration=6)
Define(devouring_plague 2944)
	SpellInfo(devouring_plague shadoworbs=finisher min_shadoworbs=3)
	SpellAddBuff(devouring_plague shadow_word_insanity_buff=1 talent=insanity_talent)
	SpellAddTargetDebuff(devouring_plague devouring_plague_debuff=1)
	SpellAddTargetDebuff(devouring_plague void_entropy_debuff=refresh if_spell=void_entropy)
Define(devouring_plague_debuff 158831)
	SpellInfo(devouring_plague_debuff duration=6 haste=spell tick=1)
Define(dispersion 47585)
	SpellInfo(dispersion cd=120)
	SpellInfo(dispersion addcd=-15 glyph=glyph_of_dispersion)
Define(divine_insight 109175)
Define(divine_insight_buff 123267)
	SpellInfo(divine_insight_buff duration=10)
Define(divine_star_caster 110744)
	SpellInfo(divine_star_caster cd=15 travel_time=1)
Define(divine_star_heal 110744)
	SpellInfo(divine_star_heal cd=15 travel_time=1)
Define(divine_star_talent 17)
Define(empowered_archangel 157197)
Define(empowered_archangel_buff 172359)
	SpellInfo(empowered_archangel_buff duration=30)
Define(enhanced_chakras 157206)
Define(enhanced_mind_flay 157223)
Define(enhanced_power_word_shield 157129)
Define(enhanced_renew 157207)
Define(enhanced_shadow_word_death 157218)
Define(evangelism 81662)
Define(evangelism_buff 81661)
	SpellInfo(evangelism_buff duration=20 max_stacks=5)
Define(flash_heal 2061)
	SpellAddBuff(flash_heal empowered_archangel_buff=0 if_spell=empowered_archangel)
	SpellAddBuff(flash_heal serendipity_buff=1 if_spell=serendipity)
	SpellAddBuff(flash_heal surge_of_light_buff=0 if_spell=surge_of_light)
	SpellAddTargetBuff(flash_heal renew=refresh,buff,chakra_serenity_buff if_spell=chakra_serenity)
Define(glyph_of_dispersion 63229)
Define(glyph_of_mind_harvest 162532)
Define(glyph_of_mind_harvest_debuff 162532)
Define(glyph_of_prayer_of_mending 55685)
Define(glyph_of_renew 119872)
Define(glyph_of_shadow_word_death 120583)
Define(glyph_of_silence 159626)
Define(glyph_of_smite 55692)
Define(glyph_of_weakened_soul 89489)
Define(halo_caster 120644)
	SpellInfo(halo_caster cd=40 travel_time=2)
Define(halo_heal 120517)
	SpellInfo(halo_heal cd=40 travel_time=2)
Define(halo_talent 18)
Define(heal 2060)
	SpellAddBuff(heal serendipity_buff=0 if_spell=serendipity)
	SpellAddTargetBuff(heal renew=refresh,buff,chakra_serenity_buff if_spell=chakra_serenity)
Define(insanity 129197)
	SpellInfo(insanity channel=3 buff=shadow_word_insanity_buff)
	SpellInfo(insanity channel=2 if_spell=enhanced_mind_flay)
	SpellInfo(insanity unusable=1 talent=!insanity_talent)
Define(holy_fire 14914)
	SpellInfo(holy_fire cd=10)
	SpellInfo(holy_fire replace=power_word_solace talent=power_word_solace_talent)
	SpellAddBuff(holy_fire evangelism_buff=1 if_spell=evangelism)
	SpellAddTargetDebuff(holy_fire holy_fire_debuff=1)
Define(holy_fire_debuff 14914)
	SpellInfo(holy_fire_debuff duration=9 haste=spell tick=1)
Define(holy_word 88625)
Define(holy_word_chastise 88625)
	SpellInfo(holy_word_chastise cd=30)
	SpellInfo(holy_word_chastise replace 1=buff,chakra_sanctuary_buff if_spell=chakra_sanctuary)
Define(holy_word_sanctuary 88625)
	SpellInfo(holy_word_sanctuary cd=40)
Define(holy_word_serenity 88684)
	SpellInfo(holy_word_serenity cd=10)
	SpellInfo(holy_word_serenity replace 1=buff,chakra_serenity_buff if_spell=chakra_serenity)
	SpellAddTargetBuff(holy_word_serenity holy_word_serenity_buff=1)
	SpellAddTargetBuff(holy_word_serenity renew=refresh,buff,chakra_serenity_buff if_spell=chakra_serenity)
Define(holy_word_serenity_buff 88684)
	SpellInfo(holy_word_serenity_buff duration=6)
Define(insanity_talent 9)
Define(lightwell 126135)
	SpellInfo(lightwell cd=180)
Define(mental_instinct_buff 167254)
	SpellInfo(mental_instinct_buff duration=4 max_stacks=12)
Define(mind_blast 8092)
	SpellInfo(mind_blast cd=9 cd_haste=spell shadoworbs=-1)
	SpellInfo(mind_blast addcd=-3 if_spell=clarity_of_power)
	SpellInfo(mind_blast addcd=6 glyph=glyph_of_mind_harvest)
	SpellRequire(mind_blast shadoworbs -3=target_debuff,glyph_of_mind_harvest_debuff glyph=glyph_of_mind_harvest)
	SpellAddBuff(mind_blast shadowy_insight_buff=0 if_spell=shadowy_insight)
	SpellAddTargetDebuff(mind_blast glyph_of_mind_harvest_debuff=1 glyph=glyph_of_mind_harvest)
Define(mind_flay 15407)
	SpellInfo(mind_flay channel=3 haste=spell)
	SpellInfo(mind_flay channel=2 if_spell=enhanced_mind_flay)
	SpellRequire(mind_flay replace insanity=buff,shadow_word_insanity_buff talent=insanity_talent)
Define(mind_sear 48045)
	SpellInfo(mind_sear channel=5 haste=spell)
Define(mind_spike 73510)
	SpellAddBuff(mind_spike surge_of_darkness_buff=-1 if_spell=surge_of_darkness)
	SpellAddTargetDebuff(mind_spike devouring_plague_debuff=0,buff,!surge_of_darkness_buff)
	SpellAddTargetDebuff(mind_spike shadow_word_pain_debuff=0,buff,!surge_of_darkness_buff)
	SpellAddTargetDebuff(mind_spike vampiric_touch_debuff=0,buff,!surge_of_darkness_buff)
	SpellAddTargetDebuff(mind_spike void_entropy_debuff=0,buff,!surge_of_darkness_buff if_spell=void_entropy)
Define(mindbender 123040)
	SpellInfo(mindbender cd=60)
Define(mindbender_talent 8)
Define(penance 47540)
	SpellInfo(penance cd=9)
	SpellInfo(penance addcd=-3 itemset=T14_heal itemcount=4)
	SpellAddBuff(penance evangelism_buff=1 if_spell=evangelism)
Define(penance_heal 47540)
Define(power_infusion 10060)
	SpellInfo(power_infusion cd=120 gcd=0)
	SpellAddBuff(power_infusion power_infusion_buff=1)
Define(power_infusion_buff 10060)
	SpellInfo(power_infusion_buff duration=20)
Define(power_infusion_talent 14)
Define(power_word_fortitude 21562)
	SpellAddBuff(power_word_fortitude power_word_fortitude_buff=1)
Define(power_word_fortitude_buff 21562)
	SpellInfo(power_word_fortitude_buff duration=3600)
Define(power_word_shield 17)
	SpellInfo(power_word_shield cd=6)
	SpellInfo(power_word_shield cd=0 if_spell=rapture)
	SpellRequire(power_word_shield unusable 1=target_debuff,weakened_soul_debuff)
	SpellAddBuff(power_word_shield borrowed_time_buff=1 if_spell=borrowed_time)
	SpellAddDebuff(power_word_shield weakened_soul_debuff=1)
Define(power_word_solace 129250)
	SpellInfo(power_word_solace cd=10)
	SpellAddBuff(power_word_solace evangelism_buff=1 if_spell=evangelism)
	SpellAddTargetDebuff(power_word_solace power_word_solace_debuff=1)
Define(power_word_solace_debuff 129250)
	SpellInfo(power_word_solace_debuff duration=9 haste=spell tick=1)
Define(power_word_solace_talent 9)
Define(prayer_of_healing 596)
	SpellAddBuff(prayer_of_healing empowered_archangel_buff=0 if_spell=empowered_archangel)
Define(prayer_of_mending 33076)
	SpellInfo(prayer_of_mending cd=10)
	SpellRequire(prayer_of_mending cd 0=buff,divine_insight_buff if_spell=divine_insight)
	SpellAddTargetBuff(prayer_of_mending prayer_of_mending_buff=4 glyph=glyph_of_prayer_of_mending)
	SpellAddTargetBuff(prayer_of_mending prayer_of_mending_buff=8 glyph=glyph_of_prayer_of_mending itemset=T17 itemcount=2 specialization=holy)
	SpellAddTargetBuff(prayer_of_mending prayer_of_mending_buff=5 glyph=!glyph_of_prayer_of_mending)
	SpellAddTargetBuff(prayer_of_mending prayer_of_mending_buff=9 glyph=!glyph_of_prayer_of_mending itemset=T17 itemcount=2 specialization=holy)
Define(prayer_of_mending_buff 41635)
	SpellInfo(prayer_of_mending_buff duration=30)
	SpellInfo(prayer_of_mending_buff max_stacks=4 glyph=glyph_of_prayer_of_mending)
	SpellInfo(prayer_of_mending_buff max_stacks=5 glyph=!glyph_of_prayer_of_mending)
Define(renew 139)
Define(renew_buff 139)
	SpellInfo(renew_buff duration=12 haste=spell tick=3)
	SpellInfo(renew_buff addduration=-3 glyph=glyph_of_renew)
	SpellInfo(renew_buff addduration=3 if_spell=enhanced_renew)
Define(serendipity 63733)
Define(serendipity_buff 63735)
	SpellInfo(serendipity_buff duration=20 max_stacks=2)
Define(shadow_word_death 32379)
	SpellInfo(shadow_word_death cd=8 shadoworbs=-1 target_health_pct=20)
	SpellRequire(shadow_word_death shadoworbs 0=buff,shadow_word_death_reset_cooldown_buff if_spell=!enhanced_shadow_word_death)
Define(shadow_word_death_glyphed 129176)
	SpellInfo(shadow_word_death_glyphed cd=8 shadoworbs=-1)
	SpellRequire(shadow_word_death_glyphed shadoworbs 0=buff,shadow_word_death_reset_cooldown_buff if_spell=!enhanced_shadow_word_death)
Define(shadow_word_death_reset_cooldown_buff 125927)	# OvaleShadowWordDeath
	SpellInfo(shadow_word_death_reset_cooldown_buff duration=9)
Define(shadow_word_insanity_buff 132573)
	SpellInfo(shadow_word_insanity_buff duration=6)
Define(shadow_word_pain 589)
	SpellAddTargetDebuff(shadow_word_pain shadow_word_pain_debuff=1)
Define(shadow_word_pain_debuff 589)
	SpellInfo(shadow_word_pain_debuff duration=18 haste=spell tick=3)
	SpellInfo(shadow_word_pain_debuff addduration=3 itemset=T14_caster itemcount=4)
Define(shadowfiend 34433)
	SpellInfo(shadowfiend cd=180)
	SpellInfo(shadowfiend replace=mindbender if_spell=mindbender)
Define(shadowform 15473)
	SpellInfo(shadowform to_stance=priest_shadowform if_stance=!priest_shadowform)
	SpellAddBuff(shadowform shadowform_buff=1 if_stance=!priest_shadowform)
	SpellAddBuff(shadowform shadowform_buff=0 if_stance=priest_shadowform)
Define(shadowform_buff 15473)
Define(shadowy_insight 162452)
Define(shadowy_insight_buff 124430)
	SpellInfo(shadowy_insight_buff duration=12)
Define(silence 15487)
	SpellInfo(silence cd=45 gcd=0 interrupt=1)
	SpellInfo(silence addcd=-25 glyph=glyph_of_silence)
Define(smite 585)
	SpellAddBuff(smite evangelism_buff=1 if_spell=evangelism)
Define(surge_of_darkness 87160)
Define(surge_of_darkness_buff 87160)
	SpellInfo(surge_of_darkness_buff duration=10 max_stacks=3)
Define(surge_of_darkness_talent 7)
Define(surge_of_light_buff 114255)
	SpellInfo(surge_of_light_buff duration=20)
Define(vampiric_touch 34914)
	SpellAddTargetDebuff(vampiric_touch vampiric_touch_debuff=1)
Define(vampiric_touch_debuff 34914)
	SpellInfo(vampiric_touch_debuff duration=15 haste=spell tick=3)
	SpellInfo(vampiric_touch_debuff addduration=3 itemset=T14_caster itemcount=4)
Define(void_entropy 155361)
	SpellInfo(void_entropy shadoworbs=finisher min_shadoworbs=3)
	SpellAddBuff(void_entropy shadow_word_insanity_buff=1 talent=insanity_talent)
	SpellAddTargetDebuff(void_entropy void_entropy_debuff=1)
Define(void_entropy_debuff 155361)
	SpellInfo(void_entropy_debuff duration=60 haste=spell tick=3)
Define(void_entropy_talent 20)
Define(weakened_soul_debuff 6788)
	SpellInfo(weakened_soul_debuff duration=15)
	SpellInfo(weakened_soul_debuff addduration=-2 glyph=glyph_of_weakened_soul)
	SpellInfo(weakened_soul_debuff addduration=-3 if_spell=enhanced_power_word_shield)

# Non-default tags for OvaleSimulationCraft.
	SpellInfo(cascade_caster tag=shortcd)
	SpellInfo(divine_star_caster tag=shortcd)
	SpellInfo(mindbender tag=cd)
]]

	OvaleScripts:RegisterScript("PRIEST", name, desc, code, "include")
end
