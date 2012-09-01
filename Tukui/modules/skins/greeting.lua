local T, C, L, G = unpack(select(2, ...))

local function LoadSkin()
	QuestFrameGreetingPanel:HookScript("OnShow", function()
		QuestFrameGreetingPanel:StripTextures()
		QuestGreetingScrollFrame:StripTextures()
		QuestFrameGreetingGoodbyeButton:SkinButton(true)
		GreetingText:SetTextColor(1, 1, 1)
		CurrentQuestsText:SetTextColor(1, 1, 0)
		QuestGreetingFrameHorizontalBreak:Kill()
		AvailableQuestsText:SetTextColor(1, 1, 0)
		
		for i=1, MAX_NUM_QUESTS do
			local button = _G["QuestTitleButton"..i]
			if button:GetFontString() then
				if button:GetFontString():GetText() and button:GetFontString():GetText():find("|cff000000") then
					button:GetFontString():SetText(string.gsub(button:GetFontString():GetText(), "|cff000000", "|cffFFFF00"))
				end
			end
		end
	end)
end

tinsert(T.SkinFuncs["Tukui"], LoadSkin)