local T, C, L = unpack((select(2, ...)))

local DataText = T["DataTexts"]
local format = format
local ToggleAllBags = ToggleAllBags
local GetContainerNumSlots = ContainerFrame_GetContainerNumSlots or GetContainerNumSlots
local GetContainerNumFreeSlots = C_Container and C_Container.GetContainerNumFreeSlots or GetContainerNumFreeSlots

local Update = function(self)
	local Free, Total, Used = 0, 0, 0

	for i = 0, NUM_BAG_SLOTS do
		Free, Total = Free + GetContainerNumFreeSlots(i), Total + GetContainerNumSlots(i)
	end

	Used = Total - Free

	self.Text:SetFormattedText("%s %s/%s", DataText.NameColor .. L.DataText.Bags .. "|r", DataText.ValueColor .. Used, Total .. "|r")
end

local OnMouseUp = function(self)
	ToggleAllBags()
end

local Enable = function(self)
	self:RegisterEvent("BAG_UPDATE")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:SetScript("OnEvent", Update)
	self:SetScript("OnMouseUp", OnMouseUp)
	self:Update()
end

local Disable = function(self)
	self.Text:SetText("")
	self:UnregisterAllEvents()
	self:SetScript("OnEvent", nil)
	self:SetScript("OnMouseUp", nil)
end

DataText:Register("Bags Slots", Enable, Disable, Update)
