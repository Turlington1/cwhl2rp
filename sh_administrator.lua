--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local FACTION = Clockwork.faction:New("Office of the City Administrator");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "halfliferp/factions/admin";
FACTION.models = {
	female = {
		"models/humans/group17/female_01.mdl",
		"models/humans/group17/female_02.mdl",
		"models/humans/group17/female_03.mdl",
		"models/humans/group17/female_04.mdl",
		"models/humans/group17/female_06.mdl",
		"models/humans/group17/female_07.mdl"
	},
	male = {
		"models/suits/male_01_closed_coat_tie.mdl",
		"models/suits/male_01_closed_tie.mdl",
		"models/suits/male_01_open.mdl",
		"models/suits/male_01_open_tie.mdl",
		"models/suits/male_01_open_waistcoat.mdl",
		"models/suits/male_01_shirt.mdl",
		"models/suits/male_01_shirt_tie.mdl",
		"models/suits/male_02_closed_coat_tie.mdl",
		"models/suits/male_02_closed_tie.mdl",
		"models/suits/male_02_open.mdl",
		"models/suits/male_02_open_tie.mdl",
		"models/suits/male_02_open_waistcoat.mdl",
		"models/suits/male_02_shirt.mdl",
		"models/suits/male_02_shirt_tie.mdl",
		"models/suits/male_03_closed_coat_tie.mdl",
		"models/suits/male_03_closed_tie.mdl",
		"models/suits/male_03_open.mdl",
		"models/suits/male_03_open_tie.mdl",
		"models/suits/male_03_open_waistcoat.mdl",
		"models/suits/male_03_shirt.mdl",
		"models/suits/male_03_shirt_tie.mdl",
		"models/suits/male_04_closed_coat_tie.mdl",
		"models/suits/male_04_closed_tie.mdl",
		"models/suits/male_04_open.mdl",
		"models/suits/male_04_open_tie.mdl",
		"models/suits/male_04_open_waistcoat.mdl",
		"models/suits/male_04_shirt.mdl",
		"models/suits/male_04_shirt_tie.mdl",
		"models/suits/male_05_closed_coat_tie.mdl",
		"models/suits/male_05_closed_tie.mdl",
		"models/suits/male_05_open.mdl",
		"models/suits/male_05_open_tie.mdl",
		"models/suits/male_05_open_waistcoat.mdl",
		"models/suits/male_05_shirt.mdl",
		"models/suits/male_05_shirt_tie.mdl",
		"models/suits/male_06_closed_coat_tie.mdl",
		"models/suits/male_06_closed_tie.mdl",
		"models/suits/male_06_open.mdl",
		"models/suits/male_06_open_tie.mdl",
		"models/suits/male_06_open_waistcoat.mdl",
		"models/suits/male_06_shirt.mdl",
		"models/suits/male_06_shirt_tie.mdl",
		"models/suits/male_07_closed_coat_tie.mdl",
		"models/suits/male_07_closed_tie.mdl",
		"models/suits/male_07_open.mdl",
		"models/suits/male_07_open_tie.mdl",
		"models/suits/male_07_open_waistcoat.mdl",
		"models/suits/male_07_shirt.mdl",
		"models/suits/male_07_shirt_tie.mdl",
		"models/suits/male_08_closed_coat_tie.mdl",
		"models/suits/male_08_closed_tie.mdl",
		"models/suits/male_08_open.mdl",
		"models/suits/male_08_open_tie.mdl",
		"models/suits/male_08_open_waistcoat.mdl",
		"models/suits/male_08_shirt.mdl",
		"models/suits/male_08_shirt_tie.mdl",
		"models/suits/male_09_closed_coat_tie.mdl",
		"models/suits/male_09_closed_tie.mdl",
		"models/suits/male_09_open.mdl",
		"models/suits/male_09_open_tie.mdl",
		"models/suits/male_09_open_waistcoat.mdl",
		"models/suits/male_09_shirt.mdl",
		"models/suits/male_09_shirt_tie.mdl"
	};
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (faction.name != FACTION_CITIZEN) then
		return false;
	end;
end;

FACTION_ADMIN = FACTION:Register();