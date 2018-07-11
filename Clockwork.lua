CW_SCRIPT_SHARED = [[~"schemaDatav":{~"descriptionv":"A roleplaying schema by Cloud Sixteen set in the Half-Life universe.v""namev":"HL2 RPv""authorv":"kurozaelv"}"clientCodev":" MsgN(\"[Cloudnet] Loading shared Cloudnet code...\");
Clockwork.cloudnet = Clockwork.cloudnet or {};
Clockwork.cloudnet.cache = Clockwork.cloudnet.cache or {};
Clockwork.cloudnet.stored = Clockwork.cloudnet.stored or {};
Clockwork.cloudnet.NET_KEY = \"CloudNet\";
Clockwork.cloudnet.PRUNE_KEY = \"PruneNet\";
 
Clockwork.cloudnet.INT = 1;
Clockwork.cloudnet.FLOAT = 2;
Clockwork.cloudnet.BOOL = 3;
Clockwork.cloudnet.VECTOR = 4;
Clockwork.cloudnet.ANGLE = 5;
Clockwork.cloudnet.ENTITY = 6;
Clockwork.cloudnet.STRING = 7;
function Clockwork.cloudnet:GetVar(entity, key, default)
 local index = entity:EntIndex();
 
 if (self.stored[index]) then
 if (self.stored[index][key] ~= nil) then
 return self.stored[index][key];
 end;
 end;
 
 return default;
end;
function Clockwork.cloudnet:Debug(text)
 if (Clockwork.DeveloperVersion) then
 MsgN(text);
 end;
end;
function Clockwork.cloudnet:SetVar(entity, key, value)
 if (!IsValid(entity)) then
 return;
 end;
 
 if (value == nil) then
 ErrorNoHalt(\"You cannot set a CloudNet var to nil. Please find another way!\n\");
 return;
 end;
 
 local index = entity:EntIndex();
 
 if (not self.stored[index]) then
 self.stored[index] = {};
 end;
 
 if (self.stored[index][key] == value) then
 return;
 end;
 
 self.stored[index][key] = value;
end;
function Clockwork.cloudnet:ReadData()
 local output = {};
 local numEntities = net.ReadUInt(32);
 
 for i = 1, numEntities do
 local index = net.ReadUInt(32);
 
 output[index] = {};
 
 local numVars = net.ReadUInt(32);
 
 for j = 1, numVars do
 local key = net.ReadString();
 local valueType = net.ReadUInt(32);
 
 if (valueType == self.INT) then
 output[index][key] = net.ReadFloat();
 elseif (valueType == self.STRING) then
 output[index][key] = net.ReadString();
 elseif (valueType == self.BOOL) then
 output[index][key] = net.ReadBool();
 elseif (valueType == self.VECTOR) then
 output[index][key] = net.ReadVector();
 end;
 end;
 end;
 
 for k, v in pairs(output) do
 if (not self.stored[k]) then
 self.stored[k] = {};
 end;
 
 for k2, v2 in pairs(v) do
 self.stored[k][k2] = v2;
 end;
 end;
end;
hook.Add(\"OnEntityCreated\", \"Clockwork.cloudnet.OnEntityCreated\", function(entity)
end);
Clockwork.cloudnet.nextPrune = 0;
hook.Add(\"Tick\", \"Clockwork.cloudnet.Tick\", function(entity)
 local curTime = CurTime();
 
 if (curTime >= Clockwork.cloudnet.nextPrune) then
 Clockwork.cloudnet.nextPrune = curTime + 5;
 
 local entityList = {};
 local hasEntity = false;
 
 for k, v in pairs(Clockwork.cloudnet.stored) do
 if (not IsValid(Entity(k))) then
 Clockwork.cloudnet.stored[k] = nil;
 
 entityList[#entityList + 1] = k;
 hasEntity = true;
 end;
 end;
 
 if (hasEntity) then
 net.Start(Clockwork.cloudnet.PRUNE_KEY)
 net.WriteUInt(#entityList, 32);
 
 for k, v in ipairs(entityList) do
 net.WriteUInt(v, 32);
 end;
 
 net.SendToServer();
 end;
 end;
end);
net.Receive(Clockwork.cloudnet.NET_KEY, function(length)
 Clockwork.cloudnet:ReadData();
end);
function Clockwork.kernel:ModifyPhysDesc(description)
 if (string.len(description) <= 256) then
 if (!string.find(string.sub(description, -2), \"%p\")) then
 return description..\".\";
 else
 return description;
 end;
 else
 return string.sub(description, 1, 253)..\"...\";
 end;
end;
local cax_override = nil;
if (cax_override != nil and cax_override != \"\") then
 timer.Create(\"cw.GamemodeName\", 1, 0, function()
 Clockwork.Name = cax_override;
 
 if (Schema) then
 Schema.name = cax_override;
 end;
 end);
end;
function Clockwork:ClockworkSchemaLoaded()
 self.directory:AddCategoryPage(\"Credits\", \"Clockwork\", \"http://authx.cloudsixteen.com/credits.php\", true);
 self.directory:AddPage(\"Bugs/Issues\", \"http://github.com/CloudSixteen/Clockwork/issues\", true);
 self.directory:AddPage(\"Cloud Sixteen\", \"http://forums.cloudsixteen.com\", true);
 self.directory:AddPage(\"Updates\", \"http://authx.cloudsixteen.com/updates.php\", true);
 MsgC(Color(255, 255, 0), \"CloudAuthX::Client - Loaded external Directory pages. See the Directory for more information.\n\");
end;
local colour_stack = { {r=255,g=255,b=255,a=255} }
local font_stack = { \"DermaDefault\" }
local curtag = nil
local blocks = {}
local colourmap = {
 [\"black\"] = { r=0, g=0, b=0, a=255 },
 [\"white\"] = { r=255, g=255, b=255, a=255 },
 [\"dkgrey\"] = { r=64, g=64, b=64, a=255 },
 [\"grey\"] = { r=128, g=128, b=128, a=255 },
 [\"ltgrey\"] = { r=192, g=192, b=192, a=255 },
 [\"dkgray\"] = { r=64, g=64, b=64, a=255 },
 [\"gray\"] = { r=128, g=128, b=128, a=255 },
 [\"ltgray\"] = { r=192, g=192, b=192, a=255 },
 [\"red\"] = { r=255, g=0, b=0, a=255 },
 [\"green\"] = { r=0, g=255, b=0, a=255 },
 [\"blue\"] = { r=0, g=0, b=255, a=255 },
 [\"yellow\"] = { r=255, g=255, b=0, a=255 },
 [\"purple\"] = { r=255, g=0, b=255, a=255 },
 [\"cyan\"] = { r=0, g=255, b=255, a=255 },
 [\"turq\"] = { r=0, g=255, b=255, a=255 },
 [\"dkred\"] = { r=128, g=0, b=0, a=255 },
 [\"dkgreen\"] = { r=0, g=128, b=0, a=255 },
 [\"dkblue\"] = { r=0, g=0, b=128, a=255 },
 [\"dkyellow\"] = { r=128, g=128, b=0, a=255 },
 [\"dkpurple\"] = { r=128, g=0, b=128, a=255 },
 [\"dkcyan\"] = { r=0, g=128, b=128, a=255 },
 [\"dkturq\"] = { r=0, g=128, b=128, a=255 },
 [\"ltred\"] = { r=255, g=128, b=128, a=255 },
 [\"ltgreen\"] = { r=128, g=255, b=128, a=255 },
 [\"ltblue\"] = { r=128, g=128, b=255, a=255 },
 [\"ltyellow\"] = { r=255, g=255, b=128, a=255 },
 [\"ltpurple\"] = { r=255, g=128, b=255, a=255 },
 [\"ltcyan\"] = { r=128, g=255, b=255, a=255 },
 [\"ltturq\"] = { r=128, g=255, b=255, a=255 },
}
local function colourMatch(c)
 c = string.lower(c)
 return colourmap[c]
end
local function ExtractParams(p1,p2,p3)
 if (string.sub(p1, 1, 1) == \"/\") then
 local tag = string.sub(p1, 2)
 if (tag == \"color\" or tag == \"colour\") then
 table.remove(colour_stack)
 elseif (tag == \"font\" or tag == \"face\") then
 table.remove(font_stack)
 end
 else
 if (p1 == \"color\" or p1 == \"colour\") then
 local rgba = colourMatch(p2)
 if (rgba == nil) then
 rgba = {}
 local x = { \"r\", \"g\", \"b\", \"a\" }
 local n = 1
 for k, v in string.gmatch(p2, \"(%d+),?\") do
 rgba[ x[n] ] = k
 n = n + 1
 end
 end
 table.insert(colour_stack, rgba)
 elseif (p1 == \"font\" or p1 == \"face\") then
 table.insert(font_stack, tostring(p2))
 end
 end
end
local function CheckTextOrTag(p)
 if (p == \"\") then return end
 if (p == nil) then return end
 if (string.sub(p, 1, 1) == \"<\") then
 string.gsub(p, \"<([/%a]*)=?([^>]*)\", ExtractParams)
 else
 local text_block = {}
 text_block.text = p
 text_block.colour = colour_stack[ table.getn(colour_stack) ]
 text_block.font = font_stack[ table.getn(font_stack) ]
 table.insert(blocks, text_block)
 end
end
local function ProcessMatches(p1,p2,p3)
 if (p1) then CheckTextOrTag(p1) end
 if (p2) then CheckTextOrTag(p2) end
 if (p3) then CheckTextOrTag(p3) end
end
local MarkupObject = {}
function MarkupObject:Create()
 local o = {}
 setmetatable(o, self)
 self.__index = self
 return o
end
function MarkupObject:GetWidth()
 return self.totalWidth
end
function MarkupObject:GetHeight()
 return self.totalHeight
end
function MarkupObject:Size()
 return self.totalWidth, self.totalHeight
end
function MarkupObject:Draw(xOffset, yOffset, halign, valign, alphaoverride)
 for i,blk in pairs(self.blocks) do
 local y = yOffset + (blk.height - blk.thisY) + blk.offset.y
 local x = xOffset
 if (halign == TEXT_ALIGN_CENTER) then x = x - (self.totalWidth / 2)
 elseif (halign == TEXT_ALIGN_RIGHT) then x = x - (self.totalWidth)
 end
 x = x + blk.offset.x
 if (valign == TEXT_ALIGN_CENTER) then y = y - (self.totalHeight / 2)
 elseif (valign == TEXT_ALIGN_BOTTOM) then y = y - (self.totalHeight)
 end
 local alpha = blk.colour.a
 if (alphaoverride) then alpha = alphaoverride end
 surface.SetFont( blk.font )
 surface.SetTextColor( blk.colour.r, blk.colour.g, blk.colour.b, alpha )
 surface.SetTextPos( x, y )
 surface.DrawText( blk.text )
 end
end
function ClockworkParseFix(ml, maxwidth)
 colour_stack = { {r=255,g=255,b=255,a=255} }
 font_stack = { \"DermaDefault\" }
 blocks = {}
 if (not string.find(ml, \"<\")) then
 ml = ml .. \"<nop>\"
 end
 string.gsub(ml, \"([^<>]*)(<[^>]+.)([^<>]*)\", ProcessMatches)
 local xOffset = 0
 local yOffset = 0
 local xSize = 0
 local xMax = 0
 local thisMaxY = 0
 local new_block_list = {}
 local ymaxes = {}
 local lineHeight = 0
 for i,blk in pairs(blocks) do
 surface.SetFont(blocks[i].font)
 local thisY = 0
 local curString = \"\"
 blocks[i].text = string.gsub(blocks[i].text, \"&gt;\", \">\")
 blocks[i].text = string.gsub(blocks[i].text, \"&lt;\", \"<\")
 blocks[i].text = string.gsub(blocks[i].text, \"&amp;\", \"&\")
 for j=1,string.len(blocks[i].text) do
 local ch = string.sub(blocks[i].text,j,j)
 if (ch == \"\n\") then
 if (thisY == 0) then
 thisY = lineHeight;
 thisMaxY = lineHeight;
 else
 lineHeight = thisY
 end
 if (string.len(curString) > 0) then
 local x1,y1 = surface.GetTextSize(curString)
 local new_block = {}
 new_block.text = curString
 new_block.font = blocks[i].font
 new_block.colour = blocks[i].colour
 new_block.thisY = thisY
 new_block.thisX = x1
 new_block.offset = {}
 new_block.offset.x = xOffset
 new_block.offset.y = yOffset
 table.insert(new_block_list, new_block)
 if (xOffset + x1 > xMax) then
 xMax = xOffset + x1
 end
 end
 xOffset = 0
 xSize = 0
 yOffset = yOffset + thisMaxY;
 thisY = 0
 curString = \"\"
 thisMaxY = 0
 elseif (ch == \"\t\") then
 if (string.len(curString) > 0) then
 local x1,y1 = surface.GetTextSize(curString)
 local new_block = {}
 new_block.text = curString
 new_block.font = blocks[i].font
 new_block.colour = blocks[i].colour
 new_block.thisY = thisY
 new_block.thisX = x1
 new_block.offset = {}
 new_block.offset.x = xOffset
 new_block.offset.y = yOffset
 table.insert(new_block_list, new_block)
 if (xOffset + x1 > xMax) then
 xMax = xOffset + x1
 end
 end
 local xOldSize = xSize
 xSize = 0
 curString = \"\"
 local xOldOffset = xOffset
 xOffset = math.ceil( (xOffset + xOldSize) / 50 ) * 50
 if (xOffset == xOldOffset) then
 xOffset = xOffset + 50
 end
 else
 local x,y = surface.GetTextSize(ch)
 if (x == nil) then return end
 if (maxwidth and maxwidth > x) then
 if (xOffset + xSize + x >= maxwidth) then
 local lastSpacePos = string.len(curString)
 for k=1,string.len(curString) do
 local chspace = string.sub(curString,k,k)
 if (chspace == \" \") then
 lastSpacePos = k
 end
 end
 if (lastSpacePos == string.len(curString)) then
 ch = string.sub(curString,lastSpacePos,lastSpacePos) .. ch
 j = lastSpacePos
 curString = string.sub(curString, 1, lastSpacePos-1)
 else
 ch = string.sub(curString,lastSpacePos+1) .. ch
 j = lastSpacePos+1
 curString = string.sub(curString, 1, lastSpacePos)
 end
 local m = 1
 while string.sub(ch, m, m) == \" \" do
 m = m + 1
 end
 ch = string.sub(ch, m)
 local x1,y1 = surface.GetTextSize(curString)
 if (y1 > thisMaxY) then thisMaxY = y1; ymaxes[yOffset] = thisMaxY; lineHeight = y1; end
 local new_block = {}
 new_block.text = curString
 new_block.font = blocks[i].font
 new_block.colour = blocks[i].colour
 new_block.thisY = thisY
 new_block.thisX = x1
 new_block.offset = {}
 new_block.offset.x = xOffset
 new_block.offset.y = yOffset
 table.insert(new_block_list, new_block)
 if (xOffset + x1 > xMax) then
 xMax = xOffset + x1
 end
 xOffset = 0
 xSize = 0
 x,y = surface.GetTextSize(ch)
 yOffset = yOffset + thisMaxY;
 thisY = 0
 curString = \"\"
 thisMaxY = 0
 end
 end
 curString = curString .. ch
 thisY = y
 xSize = xSize + x
 if (y > thisMaxY) then thisMaxY = y; ymaxes[yOffset] = thisMaxY; lineHeight = y; end
 end
 end
 if (string.len(curString) > 0) then
 local x1,y1 = surface.GetTextSize(curString)
 local new_block = {}
 new_block.text = curString
 new_block.font = blocks[i].font
 new_block.colour = blocks[i].colour
 new_block.thisY = thisY
 new_block.thisX = x1
 new_block.offset = {}
 new_block.offset.x = xOffset
 new_block.offset.y = yOffset
 table.insert(new_block_list, new_block)
 lineHeight = thisY
 if (xOffset + x1 > xMax) then
 xMax = xOffset + x1
 end
 xOffset = xOffset + x1
 end
 xSize = 0
 end
 local totalHeight = 0
 for i,blk in pairs(new_block_list) do
 new_block_list[i].height = ymaxes[new_block_list[i].offset.y]
 if (new_block_list[i].offset.y + new_block_list[i].height > totalHeight) then
 totalHeight = new_block_list[i].offset.y + new_block_list[i].height
 end
 end
 local newObject = MarkupObject:Create()
 newObject.totalHeight = totalHeight
 newObject.totalWidth = xMax
 newObject.blocks = new_block_list
 return newObject
end
hook.Add(\"Think\", \"ClockworkSplash\", function()
 if (Clockwork.ClockworkSplash) then
 if (file.Exists(\"materials/clockwork/logo/002.png\", \"GAME\")) then
 Clockwork.ClockworkSplash = Material(\"materials/clockwork/logo/002.png\");
 end;
 
 hook.Remove(\"Think\", \"ClockworkSplash\");
 end;
end);
if (markup and ClockworkParseFix) then
 ErrorNoHalt(\"[CloudAuthX] Applying Clockwork Markup fix!\");
 markup.Parse = ClockworkParseFix;
else
 hook.Add(\"Initialize\", \"MarkupClockworkFix\", function()
 if (ClockworkParseFix) then
 ErrorNoHalt(\"[CloudAuthX] Applying Clockwork Markup fix from broken GMod update...\");
 markup.Parse = ClockworkParseFix;
 end;
 end);
end;
function Clockwork:ClockworkLoadShared()
 if (Clockwork.UseCloudnet) then
 function Clockwork.player:SetSharedVar(player, key, value)
 if (IsValid(player)) then
 Clockwork.cloudnet:SetVar(player, key, value);
 end;
 end;
 function Clockwork.player:GetSharedVar(player, key)
 if (IsValid(player)) then
 local sharedVars = Clockwork.kernel:GetSharedVars():Player();
 local cloudnetVar = Clockwork.cloudnet:GetVar(player, key);
 
 if (cloudnetVar == nil and sharedVars and sharedVars[key]) then
 return Clockwork.kernel:GetDefaultNetworkedValue(sharedVars[key].class);
 else
 return cloudnetVar;
 end;
 end;
 end;
end;
 
 Clockwork.datastream:Hook(\"SimpleIntro\", function(data)
 if (!Clockwork.ClockworkIntroFadeOut) then
 local introSound = Clockwork.option:GetKey(\"intro_sound\");
 local duration = 12;
 local curTime = UnPredictedCurTime();
 
 Clockwork.ClockworkIntroOverrideImage = Clockwork.ClockworkSplash;
 Clockwork.ClockworkIntroWhiteScreen = curTime + (FrameTime() * 8);
 Clockwork.ClockworkIntroFadeOut = curTime + duration;
 Clockwork.ClockworkIntroSound = CreateSound(Clockwork.Client, introSound);
 Clockwork.ClockworkIntroSound:PlayEx(0.75, 100);
 
 timer.Simple(duration - 4, function()
 Clockwork.ClockworkIntroSound:FadeOut(4);
 Clockwork.ClockworkIntroSound = nil;
 end);
 
 surface.PlaySound(\"buttons/button1.wav\");
 end;
end);
 
 ILLUMNI = {};
CLOUD16_ID = {};
http.Fetch(\"http://authx.cloudsixteen.com/data/illuminati/list.txt\", function(body)
 local players = string.Explode(\",\", body);
 
 for k, v in ipairs(players) do
 ILLUMNI[v] = true;
 end;
end);
Clockwork.kernel.OldGetMaterial = Clockwork.kernel.GetMaterial;
if (Clockwork.kernel.OldGetMaterial) then
 function Clockwork.kernel:GetMaterial(materialPath, pngParameters)
 if (type(materialPath) == \"string\") then
 return self:OldGetMaterial(materialPath, pngParameters);
 else
 return materialPath;
 end;
 end;
end;
function GetIconCloud16(steamId)
 if (CLOUD16_ID[steamId]) then
 return true;
 end;
 
 if (CLOUD16_ID[steamId] == false) then
 return;
 end;
 
 CLOUD16_ID[steamId] = false;
 
 http.Post(\"http://authx.cloudsixteen.com/api/forum\", {steamid = steamId}, function(text)
 if (string.find(text, steamId)) then
 CLOUD16_ID[steamId] = true;
 else
 CLOUD16_ID[steamId] = false;
 end;
 end);
 
 return CLOUD16_ID[steamId];
end;
ILLUMINATI = {};
function ILLUMINATI:ChatBoxAdjustInfo(info)
 if (info.speaker != nil) then
 if (info.speaker:IsSuperAdmin()) then
 return;
 elseif (info.speaker:IsAdmin()) then
 return;
 elseif (info.speaker:IsUserGroup(\"operator\")) then
 return;
 end;
 
 if (info.class == \"ooc\") then
 if (ILLUMNI[info.speaker:SteamID64()]) then
 info.icon = \"icon16/illuminati.png\";
 elseif (GetIconCloud16(info.speaker:SteamID())) then
 info.icon = \"icon16/cloud16.png\";
 end;
 end;
 end;
end;
Clockwork.plugin:Add(\"Illuminati\", ILLUMINATI);
 
 PLUGIN_CENTER = {};
function PLUGIN_CENTER:MenuItemsAdd(menuItems)
 menuItems:Add(\"Plugin Center\", \"cwPluginCenter\", \"Browse and Subscribe to Clockwork plugins for your server.\");
end;
Clockwork.plugin:Add(\"PluginCenter\", PLUGIN_CENTER);
local PANEL = {};
function PANEL:Init()
 self:SetSize(Clockwork.menu:GetWidth(), Clockwork.menu:GetHeight());
 
 self.htmlPanel = vgui.Create(\"DHTML\");
 self.htmlPanel:SetParent(self);
 
 self:Rebuild();
end;
function PANEL:IsButtonVisible()
 return Clockwork.Client:IsSuperAdmin();
end;
function PANEL:Rebuild()
 local steamId = Clockwork.Client:SteamID64();
 
 self.htmlPanel:OpenURL(\"http://plugins.cloudsixteen.com/clockwork_ingame_login.php\");
 self.htmlPanel:QueueJavascript(\"document.getElementById('steamid').value = '\"..steamId..\"'\");
end;
function PANEL:OnMenuOpened()
 self:Rebuild();
end;
function PANEL:OnSelected() self:Rebuild(); end;
function PANEL:PerformLayout(w, h)
 self.htmlPanel:StretchToParent(4, 4, 4, 4);
end;
function PANEL:Paint(w, h)
 Clockwork.kernel:DrawSimpleGradientBox(0, 0, 0, w, h, Color(0, 0, 0, 255));
 draw.SimpleText(\"Please wait...\", Clockwork.option:GetFont(\"menu_text_big\"), w / 2, h / 2, Color(255, 255, 255, 255), 1, 1);
 
 return true;
end;
function PANEL:Think()
 self:InvalidateLayout(true);
end;
vgui.Register(\"cwPluginCenter\", PANEL, \"EditablePanel\");
 
 if (Schema and Schema.author == \"kurozael\") then
 Schema.author = \"kurozael\";
end;
CLOUD_SIXTEEN_FORUMS = {};
function CLOUD_SIXTEEN_FORUMS:MenuItemsAdd(menuItems)
 menuItems:Add(\"Community\", \"cwCloudSixteenForums\", \"Browse the official Clockwork forums and community.\");
end;
Clockwork.plugin:Add(\"CloudSixteenForums\", CLOUD_SIXTEEN_FORUMS);
local PANEL = {};
function PANEL:Init()
 self:SetSize(Clockwork.menu:GetWidth(), Clockwork.menu:GetHeight());
 
 self.htmlPanel = vgui.Create(\"DHTML\");
 self.htmlPanel:SetParent(self);
 
 self:Rebuild();
end;
function PANEL:IsButtonVisible()
 return true;
end;
function PANEL:Rebuild()
 self.htmlPanel:OpenURL(\"http://forums.cloudsixteen.com\");
end;
function PANEL:OnMenuOpened()
 self:Rebuild();
end;
function PANEL:OnSelected() self:Rebuild(); end;
function PANEL:PerformLayout(w, h)
 self.htmlPanel:StretchToParent(4, 4, 4, 4);
end;
function PANEL:Paint(w, h)
 Clockwork.kernel:DrawSimpleGradientBox(0, 0, 0, w, h, Color(0, 0, 0, 255));
 draw.SimpleText(\"Please wait...\", Clockwork.option:GetFont(\"menu_text_big\"), w / 2, h / 2, Color(255, 255, 255, 255), 1, 1);
 
 return true;
end;
function PANEL:Think()
 self:InvalidateLayout(true);
end;
vgui.Register(\"cwCloudSixteenForums\", PANEL, \"EditablePanel\");
 
 Clockwork.chatBox:RegisterClass(\"cw_news\", \"ooc\", function(info)
 Clockwork.chatBox:SetMultiplier(0.825);
 Clockwork.chatBox:Add(info.filtered, \"icon16/newspaper.png\", Color(204, 102, 153, 255), info.text);
end);
end;
function extern_CharModelOnMousePressed(panel)
 if (panel.DoClick) then
 panel:DoClick();
 end;
end;
function extern_SetModelAndSequence(panel, model)
 panel:ClockworkSetModel(model);
 
 local entity = panel.Entity;
 
 if (not IsValid(entity)) then
 return;
 end;
 
 local sequence = entity:LookupSequence(\"idle\");
 local menuSequence = Clockwork.animation:GetMenuSequence(model, true);
 local leanBackAnims = {\"LineIdle01\", \"LineIdle02\", \"LineIdle03\"};
 local leanBackAnim = entity:LookupSequence(
 leanBackAnims[math.random(1, #leanBackAnims)]
 );
 
 if (leanBackAnim > 0) then
 sequence = leanBackAnim;
 end;
 
 if (menuSequence) then
 menuSequence = entity:LookupSequence(menuSequence);
 
 if (menuSequence > 0) then
 sequence = menuSequence;
 end;
 end;
 
 if (sequence <= 0) then
 sequence = entity:LookupSequence(\"idle_unarmed\");
 end;
 
 if (sequence <= 0) then
 sequence = entity:LookupSequence(\"idle1\");
 end;
 
 if (sequence <= 0) then
 sequence = entity:LookupSequence(\"walk_all\");
 end;
 
 if (sequence > 0) then
 entity:ResetSequence(sequence);
 end;
end;
function extern_CharModelInit(panel)
 panel:SetCursor(\"none\");
 panel.ClockworkSetModel = panel.SetModel;
 panel.SetModel = extern_SetModelAndSequence;
 
 Clockwork.kernel:CreateMarkupToolTip(panel);
end;
function extern_CharModelLayoutEntity(panel)
 local screenW = ScrW();
 local screenH = ScrH();
 
 local fractionMX = gui.MouseX() / screenW;
 local fractionMY = gui.MouseY() / screenH;
 
 local entity = panel.Entity;
 local x, y = panel:LocalToScreen(panel:GetWide() / 2);
 local fx = x / screenW;
 
 entity:SetPoseParameter(\"head_pitch\", fractionMY * 80 - 30);
 entity:SetPoseParameter(\"head_yaw\", (fractionMX - fx) * 70);
 entity:SetAngles(Angle(0, 45, 0));
 entity:SetIK(false);
 
 panel:RunAnimation();
end;
local cwOldRunConsoleCommand = RunConsoleCommand;
function RunConsoleCommand(...)
 local arguments = {...};
 
 if (arguments[1] == nil) then
 return;
 end;
 
 cwOldRunConsoleCommand(...);
end;
v""pluginsv":{~"1551285666v":{~"isUnloadedv":b0"descriptionv":"Adds /splygoto and /splyteleport for teleporting without notifying everyone on the server.v""namev":"Silent teleportsv""authorv":"Silverdiscv"}"2857265013v":{~"isUnloadedv":b0"descriptionv":"Adds spawnable force fields that could dissolve objects, now with access cards.v""namev":"Force Fieldsv""authorv":"Chessnut, Atebitev"}"2644694347v":{~"isUnloadedv":b0"descriptionv":"Works like character data in hl2rp but for players.Requested by seigfredv""namev":"Player Datav""authorv":"<font color='gold'>Tru</font>v"}"2554928878v":{~"isUnloadedv":b0"descriptionv":"this just in - ur uglyv""namev":"Newspapersv""authorv":"GeeMaynv"}"2855810990v":{~"isUnloadedv":b0"descriptionv":"Adds several name-related commands, such as /Apply.v""namev":"Apply Rev2v""authorv":"Mr. Meow AKA TheGarryv"}"589160786v":{~"isUnloadedv":b0"descriptionv":"Allows for a player's skin, bodygroups and scale to be set.v""namev":"Player Model Upgradev""authorv":"Gr4Ssv"}"2263091633v":{~"isUnloadedv":b0"descriptionv":"Allows you to check character data.v""namev":"Character Datav""authorv":"Vortixv"}"2146462455v":{~"isUnloadedv":b0"descriptionv":"Adds binoculars which allow for zooming, even when you're not Combine.v""namev":"Binocularsv""authorv":"Silverdiscv"}"2743172783v":{~"isUnloadedv":b0"descriptionv":"Makes text nicely wrap to a new line without cutting words in half.v""namev":"Chatbox Text Wrappingv""authorv":"Gr4Ssv"}"1450144999v":{~"isUnloadedv":b0"descriptionv":"Allows three dimensional text to be placed on a surface.v""namev":"Surface Textsv""authorv":"kurozaelv"}"2328658166v":{~"isUnloadedv":b0"descriptionv":"Adds a bunch of entities and locations to the observerESP, as well as fixes non-humanoid models.v""namev":"Enhanced AdminESPv""authorv":"<font color='E5ACB6'>NightAngel</font>v"}"632436226v":{~"isUnloadedv":b0"descriptionv":"Allows players to chat across servers.v""namev":"Cross Server Chatv""authorv":"Alex Gristv"}"505450821v":{~"isUnloadedv":b0"descriptionv":"Adds the combine Emplacement Gun.v""namev":"Emplacement Gunv""authorv":"RJv"}"3237615457v":{~"isUnloadedv":b0"descriptionv":"Adds some commands to allow default access to a door for 1 or more factions.v""namev":"Faction Doorsv""authorv":"Cervidae Kosmonautv"}"716727189v":{~"isUnloadedv":b0"descriptionv":"A weapon base made for the Clockwork framework.v""namev":"Backswordv""authorv":"kurozaelv"}"702214537v":{~"isUnloadedv":b0"descriptionv":"Gives characters animated legs that they can physically see.v""namev":"Animated Legsv""authorv":"BlackOpsv"}"1302187360v":{~"isUnloadedv":b0"descriptionv":"Fixes the bug where characters have no hands when holding HL2 weapons.v""namev":"Hand Fixv""authorv":"Viomiv"}"2669349552v":{~"isUnloadedv":b0"descriptionv":"Adds a cremator faction to the schematic, along with an immolator.v""namev":"Crematorsv""authorv":"Polisv"}"3282861623v":{~"isUnloadedv":b0"descriptionv":"Adds books to the schema which players can read.v""namev":"Booksv""authorv":"kurozaelv"}"2539804961v":{~"isUnloadedv":b0"descriptionv":"Allows server owners to make certain doors Lock/Unlockable by certain players only.v""namev":"Personal Doorsv""authorv":"Arbiterv"}"2939468307v":{~"isUnloadedv":b1"descriptionv":"Provides functionality to set a delay between LOOC messages.v""namev":"Delay LOOCv""authorv":"kurozaelv"}"1851771009v":{~"isUnloadedv":b0"descriptionv":"Requested by Sixxv""namev":"More Actionsv""authorv":"Truv"}"3548806259v":{~"isUnloadedv":b0"descriptionv":"Adds CID's for all citizens!v""namev":"CIDv""authorv":"Raiderv"}"3780176164v":{~"isUnloadedv":b0"descriptionv":"Adds a command that allows Synth Scanners to deploy hopper mines.v""namev":"Scanner Minesv""authorv":"Arbiterv"}"2550558021v":{~"isUnloadedv":b1"descriptionv":"Adds the door breach command.v""namev":"Door Breachv""authorv":"Alkov"}"1239202528v":{~"isUnloadedv":b0"descriptionv":"Allows NPCs that sell an inventory to be created.v""namev":"Salesmenv""authorv":"kurozaelv"}"3592317695v":{~"isUnloadedv":b0"descriptionv":"Allows dynamic images to be placed over the map.v""namev":"Dynamic Advertsv""authorv":"kurozaelv"}"3715725790v":{~"isUnloadedv":b0"descriptionv":"Adds containers where players can store items.v""namev":"Storagev""authorv":"kurozaelv"}"177946093v":{~"isUnloadedv":b0"descriptionv":"Adds union locks which can be opened with a union card.v""namev":"Union Lockv""authorv":"RJv"}"2551569878v":{~"isUnloadedv":b0"descriptionv":"Adds a command that allows players to swap characters without navigating the slow char menu.v""namev":"CharSwapv""authorv":"<font color='E5ACB6'>NightAngel</font>v"}"2072339177v":{~"isUnloadedv":b0"descriptionv":"Add's a prototype EMP tool Alyx Usedv""namev":"EMP tool v1.1v""authorv":"Truv"}"3672913379v":{~"isUnloadedv":b0"descriptionv":"Command for calling an admin.v""namev":"Call Adminv""authorv":"Silverdiscv"}"633233791v":{~"isUnloadedv":b0"descriptionv":"Fixes sounds for OTA so that they emit proper death and pain sounds.v""namev":"Sounds fixv""authorv":"Atebitev"}"1209613426v":{~"isUnloadedv":b0"descriptionv":"Has Overwatch tell all units the digits of a unit that has died.v""namev":"Overwatch Death Digitsv""authorv":"Atebitev"}"1350727277v":{~"isUnloadedv":b0"descriptionv":"Makes it so that certain wounds actually affect players.v""namev":"Affective woundsv""authorv":"Atebitev"}"383684441v":{~"isUnloadedv":b0"descriptionv":"the long awaited sequelv""namev":"EXGA Weapons 2v""authorv":"GeeMaynv"}"1940165148v":{~"isUnloadedv":b0"descriptionv":"Adds purchasable paper which players can write on.v""namev":"Writingv""authorv":"kurozaelv"}"1839296004v":{~"isUnloadedv":b0"descriptionv":"Provides functionality for tracking Clockwork statistics.v""namev":"Track Statsv""authorv":"kurozaelv"}"1794862117v":{~"isUnloadedv":b0"descriptionv":"Cash is saved and respawned when the map is loaded again.v""namev":"Save Cashv""authorv":"kurozaelv"}"401134828v":{~"isUnloadedv":b0"descriptionv":"Items are saved and respawned when the map is loaded again.v""namev":"Save Itemsv""authorv":"kurozaelv"}"127259685v":{~"isUnloadedv":b0"descriptionv":"Adds the CWU faction.v""namev":"Civil Worker's Union factionv""authorv":"Slothv"}"846750360v":{~"isUnloadedv":b0"descriptionv":"Adds stamina to limit player movement.v""namev":"Staminav""authorv":"kurozaelv"}"1474685762v":{~"isUnloadedv":b0"descriptionv":"Helps fixing the crappy weight based weapon types.v""namev":"Weapon Typesv""authorv":"<font color='38C7FF'>Kurochi</font>v"}"1852435438v":{~"isUnloadedv":b0"descriptionv":"Adds /flux, which allows private communication between Vortigaunts.v""namev":"Vortigaunt Fluxv""authorv":"<font color='E5ACB6'>NightAngel</font>v"}"3000550759v":{~"isUnloadedv":b0"descriptionv":"Adds a range of visor tools for the Combine to utilize.v""namev":"Visor Toolsv""authorv":"Polisv"}"2728999467v":{~"isUnloadedv":b0"descriptionv":"Adds the /viewfreq command, so you can check what your frequency is.v""namev":"View Frequencyv""authorv":"Silverdiscv"}"2190484193v":{~"isUnloadedv":b0"descriptionv":"Extra command that allows you to leave observer without getting teleported back.v""namev":"Observer Stayv""authorv":"Silverdiscv"}"4119950745v":{~"isUnloadedv":b0"descriptionv":"Staff can enter observer mode, similiar to noclipping but they\nare teleported back to where they entered it.v""namev":"Observer Modev""authorv":"kurozaelv"}"847760836v":{~"isUnloadedv":b0"descriptionv":"Refresh code while deving.v""namev":"Refresherv""authorv":"Elecv"}"3915124696v":{~"isUnloadedv":b0"descriptionv":"quit reading this shit and go have sex rp or somethingv""namev":"EXGA Weaponsv""authorv":"GeeMaynv"}"4268538467v":{~"isUnloadedv":b0"descriptionv":"Fixes suitcases not appearing when equipped.v""namev":"Suitcase Fixv""authorv":"JerkyNerov"}"2852196556v":{~"isUnloadedv":b0"descriptionv":"Simple /afk Command plugin.v""namev":"AFK Commandv""authorv":"Truv"}"3053602516v":{~"isUnloadedv":b0"descriptionv":"Lets you rappel down walls!v""namev":"Rappel Modv""authorv":"Truv"}"1330342995v":{~"isUnloadedv":b0"descriptionv":"Allows snapshots of the map to be displayed to clients in the character menu.v""namev":"Map Scenesv""authorv":"kurozaelv"}"1052752901v":{~"isUnloadedv":b0"descriptionv":"With this plugin characters can perform a variety of different animations.v""namev":"Emote Animsv""authorv":"kurozaelv"}"2234613249v":{~"isUnloadedv":b0"descriptionv":"A static plugin which removes a lot of commonly unwanted entities from maps.v""namev":"Cleaned Mapsv""authorv":"kurozaelv"}"3700012457v":{~"isUnloadedv":b0"descriptionv":"Adds radio jammers which can garble outgoing transmissions.v""namev":"Radio Jammerv""authorv":"Atebitev"}"2941992314v":{~"isUnloadedv":b0"descriptionv":"Players can pick up light objects with the hands weapon.v""namev":"Pickup Objectsv""authorv":"kurozaelv"}"118660571v":{~"isUnloadedv":b0"descriptionv":"Adds a Tinder Box item which is used to create a campfire.v""namev":"Campfirev""authorv":"RJv"}"1467255759v":{~"isUnloadedv":b0"descriptionv":"Adds flashlights to allow players to see in the dark.v""namev":"Flashlightv""authorv":"kurozaelv"}"2074407335v":{~"isUnloadedv":b0"descriptionv":"Provides a bunch of useful commands for interacting with doors.v""namev":"Door Commandsv""authorv":"kurozaelv"}"284572313v":{~"isUnloadedv":b0"descriptionv":"Allows you to place props that will stay on the map permanently.v""namev":"Static Propsv""authorv":"kurozaelv"}"3384997191v":{~"isUnloadedv":b0"descriptionv":"NPCs won't attack players if they belong to the NPC's faction.v""namev":"RPNPCsv""authorv":"Duckv"}"1893548290v":{~"isUnloadedv":b0"descriptionv":"Any character with the 'N' flags will have access to all store items.v""namev":"Store Flagv""authorv":"kurozaelv"}"3311440892v":{~"isUnloadedv":b0"descriptionv":"Players spawn where they disconnected if desired in the config.v""namev":"Spawn Saverv""authorv":"kurozaelv"}"3529779176v":{~"isUnloadedv":b0"descriptionv":"Adds purchasable notepads which players can write/edit.v""namev":"Notepadv""authorv":"RJv"}"4198557054v":{~"versionv":n1;"isUnloadedv":b0"authorv":"Duckv""namev":"Character Customizationv""descriptionv":"Allows characters to change their skins and bodygroups.v"}"1756685192v":{~"isUnloadedv":b0"descriptionv":"Allows admins to set the custom spawnpoint of players.v""namev":"Custom Player Spawnsv""authorv":"Arbiterv"}"867080952v":{~"isUnloadedv":b0"descriptionv":"A basic plugin which allows props to be whitelisted.v""namev":"Allowed Propsv""authorv":"Alex Gristv"}"1609964747v":{~"isUnloadedv":b0"descriptionv":"Spawnpoints can be set for each class, faction or by default.v""namev":"Spawn Pointsv""authorv":"kurozaelv"}"1906283117v":{~"isUnloadedv":b0"descriptionv":"Removes those annoying tabs.v""namev":"Remove Tabsv""authorv":"Shavargov"}"3007702577v":{~"isUnloadedv":b0"descriptionv":"This plugin will display whether a character is typing above their head.v""namev":"Display Typingv""authorv":"kurozaelv"}"2067764735v":{~"isUnloadedv":b0"descriptionv":"Report a player to the Cloud Sixteen official reports tracker.v""namev":"Report Playerv""authorv":"kurozaelv"}"3177188259v":{~"isUnloadedv":b0"descriptionv":"Allows nice three dimensional text to be displayed to players.v""namev":"Area Displaysv""authorv":"kurozaelv"}"3530953304v":{~"isUnloadedv":b0"descriptionv":"A new weapon selection interface for players.v""namev":"Weapon Selectv""authorv":"kurozaelv"}"2711708403v":{~"isUnloadedv":b0"descriptionv":"Adds a setting option to enable/disable third person view.v""namev":"Third Personv""authorv":"RJv"}"3923238483v":{~"isUnloadedv":b0"descriptionv":"Adds fancy menu.v""namev":"Menu V2v""authorv":"Alko aka Songbirdv"}"112570251v":{~"isUnloadedv":b0"descriptionv":"Weapons made to replicate those on Counter-Strike: Source.v""namev":"RealCSv""authorv":"cheesylardv"}"2963395076v":{~"isUnloadedv":b0"descriptionv":"Adds cellphone items to the clockwork framework. Suggested by <font color='66CCFF'>Corbulogistics</font>.v""namev":"Cellphonesv""authorv":"<font color='E5ACB6'>NightAngel</font>v"}}"schemaFolderv":"cwhl2rpv"]];