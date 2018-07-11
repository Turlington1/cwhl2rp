local PLUGIN = PLUGIN;

-- Called when a player's character data should be restored.
function PLUGIN:PlayerRestoreCharacterData(player, data)
	if ( !data["heart"] ) then
		data["heart"] = 60;
	end;
	if ( !data["blood"] ) then
		data["blood"] = 100;
	end;
	if ( !data["oxygen"] ) then
		data["oxygen"] = 100;
	end;
end;

-- Called when a player's shared variables should be set.
function PLUGIN:PlayerSetSharedVars(player, curTime)
	player:SetSharedVar( "heart", math.Round( player:GetCharacterData("heart") ) );
	player:SetSharedVar( "blood", math.Round( player:GetCharacterData("blood") ) );
	player:SetSharedVar( "oxygen", math.Round( player:GetCharacterData("oxygen") ) );
end;

function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (!lightSpawn) then
		player:SetSharedVar("cardiacArrest", 0);
		player:SetCharacterData( "heart", 60);
		player:SetCharacterData( "oxygen", 100);
		player:SetCharacterData( "blood", 100);
	end;
end;

-- Called at an interval while a player is connected.
function PLUGIN:PlayerThink(player, curTime, infoTable)
	local heart = tonumber(player:GetCharacterData("heart"));
	local blood = tonumber(player:GetCharacterData("blood"));
	local oxygen = tonumber(player:GetCharacterData("oxygen"));
	local cardiacArrest = tonumber(player:GetSharedVar("cardiacArrest"));
	local alive = player:Alive();
	local curTime = CurTime();
	
	if ( player:Alive() ) then
		if (!player.nextBlood or curTime >= player.nextBlood) then
			if (bleed >= 1) then
				player:SetCharacterData( "blood", math.Clamp(player:GetCharacterData("blood") - (.02 * bleed), 0, 100) );
				player.nextBlood = curTime + (60 / heart);
			else
				player:SetCharacterData( "blood", math.Clamp(player:GetCharacterData("blood") + .02, 0, 100) );
				player.nextBlood = curTime + (60 / heart);
			end;
		end;
		if (!player.nextOxygen or curTime >= player.nextOxygen) then
			if oxygen > 0 then
				if (cardiacArrest == 0 and player:WaterLevel() != 3) then
					if oxygen < 100 then
						player:SetCharacterData( "oxygen", math.Clamp(player:GetCharacterData("oxygen") + .06, 0, 100) );
						player.nextOxygen = curTime + 1;
					elseif ((oxygen + .06) > 100) then
						player:SetCharacterData( "oxygen", 100 );
						player.nextOxygen = curTime + 1;
					end;
				elseif (cardiacArrest >= 1) then
					player:SetCharacterData( "oxygen", math.Clamp(player:GetCharacterData("oxygen") - .8, 0, 100) );
					player.nextOxygen = curTime + 1;
					if (!player.nextGasp or curTime >= player.nextGasp) then
						player:EmitSound("ambient/voices/citizen_beaten"..math.random(3, 4)..".wav")
						player.nextGasp = curTime + 2.5
					end;
				elseif (player:WaterLevel() == 3) then
					player:SetCharacterData( "oxygen", math.Clamp(player:GetCharacterData("oxygen") - .98, 0, 100) );
					player.nextOxygen = curTime + 1;
					if (!player.nextGasp or curTime >= player.nextGasp) then
						player:EmitSound("player/pl_drown"..math.random(1, 3)..".wav")
						player.nextGasp = curTime + 2.5
					end;
				end;
			end;
		end;
		if (!player.nextHeart or curTime >= player.nextHeart) then
			if (cardiacArrest == 0 and oxygen >= 30) then
				if (player:IsRunning()) then
					if heart < 100 then
						player:SetCharacterData( "heart", math.Clamp(player:GetCharacterData("heart") + .5, 0, 100) );
						player.nextHeart = curTime + .6;
					end;
				elseif heart > 60 then
					player:SetCharacterData( "heart", math.Clamp(player:GetCharacterData("heart") - .5, 0, 100) );
					player.nextHeart = curTime + 1;
				elseif heart < 60 then
					player:SetCharacterData( "heart", math.Clamp(player:GetCharacterData("heart") + .5, 0, 100) );
					player.nextHeart = curTime + 1;					
				end;
			elseif oxygen <= 20 then
				player:SetCharacterData( "heart", math.Clamp(player:GetCharacterData("heart") - .5, 0, 100) );
				player.nextHeart = curTime + 1;
			end;
		end;
		
		if (cardiacArrest >= 1) then
			player:SetCharacterData("heart", 0)
			if !player.cardiacDown or player.cardiacDown != 1 then
				if player:GetRagdollState() != RAGDOLL_KNOCKEDOUT then
					Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT);
					player.cardiacDown = 1;
				end;
			end;
		elseif cardiacArrest == 0 then
			if player.cardiacDown == 1 then
				if player:GetRagdollState() == RAGDOLL_KNOCKEDOUT then
					Clockwork.player:SetRagdollState(player, RAGDOLL_NONE);
					player.cardiacDown = 0;
				end;
			end;
		end;
		
		if (blood <= 15) then
			player:SetCharacterData("heart", 0)
		end;
		
		--Health Lowering
		if oxygen == 0 then
			if !player.nextHurty or curTime >= player.nextHurty then
				player:SetHealth(math.Clamp(player:Health() - 5, 0, 100));
				player.nextHurty = curTime + 2
			end;
		end;
		
		if player:Health() <= 0 then
			player:Kill();
		end;
		
	end;
end;

function PLUGIN:PlayerShouldStaminaRegenerate(player)
	if ( tonumber(player:GetCharacterData("heart")) <= 50 ) then
		return false;
	end;
end;