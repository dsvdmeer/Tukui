local T, C, L = select(2, ...):unpack()

local Miscellaneous = T["Miscellaneous"]
local UIWidgets = CreateFrame("Frame")

function UIWidgets:Enable()
	local MinimapWidget = UIWidgetBelowMinimapContainerFrame

	-- Hack to avoid UIWidgetBelowMinimapContainerFrame to move in UIParent.lua (L2987)
	MinimapWidget.GetNumWidgetsShowing = function() return 0 end

	-- This is now the frame that contain capture bar and other shit like that.
	MinimapWidget:ClearAllPoints()
	MinimapWidget:SetPoint("TOP", 3, -96)
	MinimapWidget:SetSize(220, 20)
	
	T.Movers:RegisterFrame(MinimapWidget, "UI Widgets")
end

Miscellaneous.UIWidgets = UIWidgets

