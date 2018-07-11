--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

Clockwork.kernel:IncludePrefixed("cl_schema.lua");
Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_theme.lua");
Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_schema.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");

Schema.customPermits = {};

for k, v in pairs(_file.Find("models/humans/group17/*.mdl", "GAME")) do
	Clockwork.animation:AddMaleHumanModel("models/humans/group17/"..v);
end;

Clockwork.animation:AddCivilProtectionModel("models/eliteghostcp.mdl");
Clockwork.animation:AddCivilProtectionModel("models/eliteshockcp.mdl");
Clockwork.animation:AddCivilProtectionModel("models/leet_police2.mdl");
Clockwork.animation:AddCivilProtectionModel("models/sect_police2.mdl");
Clockwork.animation:AddCivilProtectionModel("models/policetrench.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_female.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_female_01.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_female_02.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_female_03.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_female_04.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_female_05.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_female_06.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_female_07.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_male_01.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_male_02.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_male_03.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_male_04.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_male_05.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_male_06.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_male_07.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_male_08.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/c18_police_male_09.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_female.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_female_01.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_female_02.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_female_03.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_female_04.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_female_05.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_female_06.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_female_07.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_male_01.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_male_02.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_male_03.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_male_04.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_male_05.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_male_06.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_male_07.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_male_08.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/commander/c18_police_cmd_male_09.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_female.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_female_01.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_female_02.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_female_03.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_female_04.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_female_05.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_female_06.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_female_07.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_male_01.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_male_02.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_male_03.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_male_04.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_male_05.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_male_06.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_male_07.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_male_08.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/divisional/c18_police_dvl_male_09.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_female.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_female_01.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_female_02.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_female_03.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_female_04.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_female_05.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_female_06.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_female_07.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_male_01.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_male_02.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_male_03.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_male_04.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_male_05.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_male_06.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_male_07.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_male_08.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/elite/c18_police_epu_male_09.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_female.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_female_01.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_female_02.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_female_03.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_female_04.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_female_05.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_female_06.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_female_07.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_male_01.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_male_02.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_male_03.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_male_04.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_male_05.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_male_06.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_male_07.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_male_08.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/highcommand/sectorial/c18_police_sec_male_09.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_female.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_female_01.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_female_02.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_female_03.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_female_04.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_female_05.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_female_06.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_female_07.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_male_01.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_male_02.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_male_03.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_male_04.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_male_05.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_male_06.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_male_07.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_male_08.mdl");
Clockwork.animation:AddCivilProtectionModel("models/police/trenchcoat/c18_trenchcoat_police_male_09.mdl");

Clockwork.animation:AddMaleHumanModel("models/player/hood_sas.mdl");

Clockwork.option:SetKey("default_date", {month = 1, year = 2016, day = 1});
Clockwork.option:SetKey("default_time", {minute = 0, hour = 0, day = 1});
Clockwork.option:SetKey("format_singular_cash", "%a");
Clockwork.option:SetKey("model_shipment", "models/items/item_item_crate.mdl");
Clockwork.option:SetKey("intro_image", "halfliferp/hl2rp_logo");
Clockwork.option:SetKey("schema_logo", "halfliferp/hl2rp_logo");
Clockwork.option:SetKey("format_cash", "%a %n");
Clockwork.option:SetKey("menu_music", "music/hl2_song19.mp3");
Clockwork.option:SetKey("name_cash", "Tokens");
Clockwork.option:SetKey("model_cash", "models/props_lab/box01a.mdl");
Clockwork.option:SetKey("gradient", "halfliferp/bg_gradient");

Clockwork.config:ShareKey("intro_text_small");
Clockwork.config:ShareKey("intro_text_big");
Clockwork.config:ShareKey("business_cost");
Clockwork.config:ShareKey("permits");

Clockwork.quiz:SetEnabled(true);
Clockwork.quiz:AddQuestion("Do you understand that roleplaying is slow paced and relaxed?", 1, "Yes.", "No.");
Clockwork.quiz:AddQuestion("Can you type properly, and understand that you may punished for not doing so?", 2, "yes i can", "Yes, I can.");
Clockwork.quiz:AddQuestion("You do not need weapons to roleplay, do you understand?", 1, "Yes.", "No.");
Clockwork.quiz:AddQuestion("You do not need items to roleplay, do you understand?", 1, "Yes.", "No.");
Clockwork.quiz:AddQuestion("What do you think serious roleplaying is about?", 2, "Collecting items and upgrades.", "Developing your character.");
Clockwork.quiz:AddQuestion("What universe is this roleplaying game set in?", 2, "Real Life.", "Half-Life 2.");

Clockwork.flag:Add("v", "Light Blackmarket", "Access to light blackmarket goods.");
Clockwork.flag:Add("V", "Heavy Blackmarket", "Access to heavy blackmarket goods.");
Clockwork.flag:Add("m", "Resistance Manager", "Access to the resistance manager's goods.");
Clockwork.flag:Add("Z", "Arabic Language", "Learn to speak Arabic.");
Clockwork.flag:Add("C", "Chinese Language", "Learn to speak Chinese.");
Clockwork.flag:Add("D", "Dutch Langauge", "Learn to speak Dutch.");
Clockwork.flag:Add("f", "Finnish Language", "Learn to speak Finnish.");
Clockwork.flag:Add("F", "French Language", "Learn to speak French.");
Clockwork.flag:Add("L", "German Language", "Learn to speak German. Sieg heil.");
Clockwork.flag:Add("i", "Irish Language", "Learn to speak Irish.");
Clockwork.flag:Add("I", "Italian Language", "Learn to speak Italian.");
Clockwork.flag:Add("J", "Japanese Language", "Learn to speak Anime.");
Clockwork.flag:Add("j", "Portugese Language", "Learn to speak Portugese.");
Clockwork.flag:Add("Y", "Romanian Language", "Learn to speak Romanian.");
Clockwork.flag:Add("R", "Russian Language", "Learn to speak Russian. Cyka blyat");
Clockwork.flag:Add("P", "Spanish Language", "Learn to speak Spanish.");

-- A function to add a custom permit.
function Schema:AddCustomPermit(name, flag, model)
	local formattedName = string.gsub(name, "[%s%p]", "");
	local lowerName = string.lower(name);

	self.customPermits[ string.lower(formattedName) ] = {
		model = model,
		name = name,
		flag = flag,
		key = Clockwork.kernel:SetCamelCase(formattedName, true)
	};
end;

-- A function to check if a string is a Combine rank.
function Schema:IsStringCombineRank(text, rank)
	if (type(rank) == "table") then
		for k, v in ipairs(rank) do
			if (self:IsStringCombineRank(text, v)) then
				return true;
			end;
		end;
	elseif (rank == "EpU") then
		if (string.find(text, "%pSeC%p") or string.find(text, "%pDvL%p")
		or string.find(text, "%pEpU%p")) then
			return true;
		end;
	else
		return string.find(text, "%p"..rank.."%p");
	end;
end;

-- A function to check if a player is a Combine rank.
function Schema:IsPlayerCombineRank(player, rank, realRank)
	local name = player:Name();
	local faction = player:GetFaction();

	if (self:IsCombineFaction(faction)) then
		if (type(rank) == "table") then
			for k, v in ipairs(rank) do
				if (self:IsPlayerCombineRank(player, v, realRank)) then
					return true;
				end;
			end;
		elseif (rank == "EpU" and !realRank) then
			if (string.find(name, "%pSeC%p") or string.find(name, "%pDvL%p")
			or string.find(name, "%pEpU%p")) then
				return true;
			end;
		else
			return string.find(name, "%p"..rank.."%p");
		end;
	end;
end;

-- A function to get a player's Combine rank.
function Schema:GetPlayerCombineRank(player)
	local faction = player:GetFaction();

	if (faction == FACTION_OTA) then
		if (self:IsPlayerCombineRank(player, "OWS")) then
			return 0;
		elseif (self:IsPlayerCombineRank(player, "EOW")) then
			return 1;
		else
			return 2;
		end;
	elseif (self:IsPlayerCombineRank(player, "RCT")) then
		return 0;
	elseif (self:IsPlayerCombineRank(player, "04")) then
		return 1;
	elseif (self:IsPlayerCombineRank(player, "03")) then
		return 2;
	elseif (self:IsPlayerCombineRank(player, "02")) then
		return 3;
	elseif (self:IsPlayerCombineRank(player, "01")) then
		return 4;
	elseif (self:IsPlayerCombineRank(player, "OfC")) then
		return 6;
	elseif (self:IsPlayerCombineRank(player, "EpU", true)) then
		return 7;
	elseif (self:IsPlayerCombineRank(player, "DvL")) then
		return 8;
	elseif (self:IsPlayerCombineRank(player, "SeC")) then
		return 9;
	elseif (self:IsPlayerCombineRank(player, "SCN")) then
		if (!self:IsPlayerCombineRank(player, "SYNTH")) then
			return 10;
		else
			return 11;
		end;
	else
		return 5;
	end;
end;

-- A function to get if a faction is Combine.
function Schema:IsCombineFaction(faction)
	return (faction == FACTION_MPF or faction == FACTION_OTA);
end;
