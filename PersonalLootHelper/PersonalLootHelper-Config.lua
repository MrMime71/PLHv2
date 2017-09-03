function PLH_CreateOptionsPanel()

	local VERTICAL_SPACE_BETWEEN_ELEMENTS = 15

	--[[ Main Panel ]]--
	local PLHConfigFrame = CreateFrame('Frame', 'PLHConfigFrame', InterfaceOptionsFramePanelContainer)
	PLHConfigFrame:Hide()
	PLHConfigFrame.name = PLH_LONG_ADDON_NAME
	InterfaceOptions_AddCategory(PLHConfigFrame)

	--[[ Title ]]--
	local TitleLabel = PLHConfigFrame:CreateFontString(nil, 'ARTWORK', 'GameFontNormalLarge')
	TitleLabel:SetPoint('TOPLEFT', PLHConfigFrame, 'TOPLEFT', 16, -16)
	TitleLabel:SetText(PLH_LONG_ADDON_NAME)

	-- [[ Version ]] --
	local AddonVersion = GetAddOnMetadata("PersonalLootHelper", "Version")
	local VersionLabel = PLHConfigFrame:CreateFontString(nil, 'ARTWORK', 'GameFontNormalSmall')
	VersionLabel:SetPoint('BOTTOMLEFT', TitleLabel, 'BOTTOMRIGHT', 8, 0)
	VersionLabel:SetText('v' .. AddonVersion)

	--[[ Author ]]--
	local AuthorLabel = PLHConfigFrame:CreateFontString(nil, 'ARTWORK', 'GameFontNormalSmall')
	AuthorLabel:SetPoint('TOPRIGHT', PLHConfigFrame, 'TOPRIGHT', -16, -24)
	AuthorLabel:SetText('Author: ' .. PLH_AUTHOR_NAME)
--tiny	
		--[[PLH_WHISPER_UPGRADE]]--
	PLH_WhisperUpgradeCheckbox = CreateFrame('CheckButton', 'PLHWhisperUpgrade', PLHConfigFrame, 'InterfaceOptionsCheckButtonTemplate')
	PLH_WhisperUpgradeCheckbox:SetPoint('TOPLEFT', TitleLabel, 'BOTTOMLEFT', 0, -VERTICAL_SPACE_BETWEEN_ELEMENTS)
	PLH_WhisperUpgradeCheckbox:SetChecked(PLH_WHISPER_UPGRADE)
	

	local WhisperUpgradeLabel = PLH_WhisperUpgradeCheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	WhisperUpgradeLabel:SetPoint('LEFT', PLH_WhisperUpgradeCheckbox, 'RIGHT', 0, 0)
	WhisperUpgradeLabel:SetText('Whisper Looter Automaticly that you need the item. Be aware: no stat evaluation!')
	
	
			--[[PLH_WHISPER_TEXT]]--
-- tiny start
		if PLH_WHISPER_TEXT == nil or PLH_WHISPER_TEXT == "" then
		   PLH_WHISPER_TEXT = "Hi. You need that? its an upgrade for me :-D"
		end   
-- tiny end		


	--[[ PLH_INCLUDE_BOE ]]--
	PLH_IncludeBOECheckbox = CreateFrame('CheckButton', 'PLHIncludeBOE', PLHConfigFrame, 'InterfaceOptionsCheckButtonTemplate')
	PLH_IncludeBOECheckbox:SetPoint('TOPLEFT', TitleLabel, 'BOTTOMLEFT', 0, -VERTICAL_SPACE_BETWEEN_ELEMENTS)
	PLH_IncludeBOECheckbox:SetChecked(PLH_INCLUDE_BOE)

	local IncludeBOELabel = PLH_IncludeBOECheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	IncludeBOELabel:SetPoint('LEFT', PLH_IncludeBOECheckbox, 'RIGHT', 0, 0)
	IncludeBOELabel:SetText('Include Bind on Equip items')

	--[[ PLH_CURRENT_SPEC_ONLY ]]--
	PLH_CurrentSpecOnlyCheckbox = CreateFrame('CheckButton', 'PLHCurrentSpecOnly', PLHConfigFrame, 'InterfaceOptionsCheckButtonTemplate')
	PLH_CurrentSpecOnlyCheckbox:SetPoint('TOPLEFT', PLH_IncludeBOECheckbox, 'BOTTOMLEFT', 0, -VERTICAL_SPACE_BETWEEN_ELEMENTS)
	PLH_CurrentSpecOnlyCheckbox:SetChecked(PLH_CURRENT_SPEC_ONLY)

	local CurrentSpecOnlyLabel = PLH_CurrentSpecOnlyCheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	CurrentSpecOnlyLabel:SetPoint('LEFT', PLH_CurrentSpecOnlyCheckbox, 'RIGHT', 0, 0)
	CurrentSpecOnlyLabel:SetText('Evaluate based on current spec only')

	--[[ PLH_NOTIFY_GROUP ]]--
	PLH_NotifyGroupCheckbox = CreateFrame('CheckButton', 'PLHNotifyGroup', PLHConfigFrame, 'InterfaceOptionsCheckButtonTemplate')
	PLH_NotifyGroupCheckbox:SetPoint('TOPLEFT', PLH_CurrentSpecOnlyCheckbox, 'BOTTOMLEFT', 0, -VERTICAL_SPACE_BETWEEN_ELEMENTS)
	PLH_NotifyGroupCheckbox:SetChecked(PLH_NOTIFY_GROUP)

	local NotifyGroupLabel = PLH_NotifyGroupCheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	NotifyGroupLabel:SetPoint('LEFT', PLH_NotifyGroupCheckbox, 'RIGHT', 0, 0)
	NotifyGroupLabel:SetText('Notify group (automatically disabled in LFR)')

	--[[ PLH_COORDINATE_ROLLS ]]--
	PLH_CoordinateRollsCheckbox = CreateFrame('CheckButton', 'PLHCoordinateRolls', PLHConfigFrame, 'InterfaceOptionsCheckButtonTemplate')
	PLH_CoordinateRollsCheckbox:SetPoint('TOPLEFT', PLH_NotifyGroupCheckbox, 'BOTTOMLEFT', 0, -VERTICAL_SPACE_BETWEEN_ELEMENTS)
	PLH_CoordinateRollsCheckbox:SetChecked(PLH_COORDINATE_ROLLS)

	PLH_CoordinateRollsLabel1 = PLH_CoordinateRollsCheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	PLH_CoordinateRollsLabel1:SetPoint('LEFT', PLH_CoordinateRollsCheckbox, 'RIGHT', 0, 0)
	PLH_CoordinateRollsLabel1:SetText('Coordinate rolls (group leaders or assistants only)')

	PLH_CoordinateRollsLabel2 = PLH_CoordinateRollsCheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	PLH_CoordinateRollsLabel2:SetPoint('TOPLEFT', PLH_CoordinateRollsLabel1, 'BOTTOMLEFT', 20, -10)
	PLH_CoordinateRollsLabel2:SetText('Manage loot rolls. Players can whisper the roll coordinator with "trade" or "trade [item]" to initiate rolls.')
	PLH_CoordinateRollsLabel2:SetWordWrap(true)
	PLH_CoordinateRollsLabel2:SetJustifyH('LEFT')
	PLH_CoordinateRollsLabel2:SetWidth(450)

	--[[ PLH_CHECK_CHARACTER_LEVEL ]]--
	PLH_CheckCharacterLevelCheckbox = CreateFrame('CheckButton', 'PLHCheckCharacterLevel', PLHConfigFrame, 'InterfaceOptionsCheckButtonTemplate')
	PLH_CheckCharacterLevelCheckbox:SetPoint('TOPLEFT', PLH_CoordinateRollsCheckbox, 'BOTTOMLEFT', 0, -VERTICAL_SPACE_BETWEEN_ELEMENTS*2)
	PLH_CheckCharacterLevelCheckbox:SetChecked(PLH_CHECK_CHARACTER_LEVEL)

	local CheckCharacterLevelLabel = PLH_CheckCharacterLevelCheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	CheckCharacterLevelLabel:SetPoint('LEFT', PLH_CheckCharacterLevelCheckbox, 'RIGHT', 0, 0)
	CheckCharacterLevelLabel:SetText('Exclude notifications if character is too low level to equip item')

	--[[ PLH_HIGHLIGHT_RAID_FRAMES ]]--
	PLH_HighlightRaidFramesCheckbox = CreateFrame('CheckButton', 'PLHHighlightRaidFrames', PLHConfigFrame, 'InterfaceOptionsCheckButtonTemplate')
	PLH_HighlightRaidFramesCheckbox:SetPoint('TOPLEFT', PLH_CheckCharacterLevelCheckbox, 'BOTTOMLEFT', 0, -VERTICAL_SPACE_BETWEEN_ELEMENTS)
	PLH_HighlightRaidFramesCheckbox:SetChecked(PLH_HIGHLIGHT_RAID_FRAMES)

	local HighlightRaidFramesLabel = PLH_HighlightRaidFramesCheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	HighlightRaidFramesLabel:SetPoint('LEFT', PLH_HighlightRaidFramesCheckbox, 'RIGHT', 0, 0)
	HighlightRaidFramesLabel:SetText('Show tradeable items in raid frames')

	--[[ PLH_HIGHLIGHT_SIZE ]]--
	PLH_HighlightSizeSlider = CreateFrame("Slider", "PLHHighlightSize", PLHConfigFrame, "OptionsSliderTemplate")
	PLHConfigFrame.ScalingSlider = slider
	PLH_HighlightSizeSlider:SetOrientation("HORIZONTAL")
	PLH_HighlightSizeSlider:SetMinMaxValues(10, 30)
	PLH_HighlightSizeSlider:SetValueStep(1)
	PLH_HighlightSizeSlider:SetObeyStepOnDrag(true)
	PLH_HighlightSizeSlider:SetWidth(180)
	PLH_HighlightSizeSlider:SetHeight(16)
	PLH_HighlightSizeSlider:SetPoint("LEFT", HighlightRaidFramesLabel, "RIGHT", 20, 0)
	_G[PLH_HighlightSizeSlider:GetName().."High"]:SetText("large")
	_G[PLH_HighlightSizeSlider:GetName().."Low"]:SetText("small")
	_G[PLH_HighlightSizeSlider:GetName().."Text"]:SetText("icon size")
	PLH_HighlightSizeSlider:SetValue(PLH_HIGHLIGHT_SIZE)
	
	--tiny start
	--[[PLH_WHISPER_TEXT]]--
	PLH_WhisperInput = CreateFrame('EditBox', 'PLHWhisperInput', PLHConfigFrame, 'InputBoxTemplate')
	PLH_WhisperInput:SetPoint('TOPLEFT', PLH_HighlightRaidFramesCheckbox, 'BOTTOMLEFT', 0, -VERTICAL_SPACE_BETWEEN_ELEMENTS)
	PLH_WhisperInput:SetText(PLH_WHISPER_TEXT);
	PLH_WhisperInput:SetHeight(40);
    PLH_WhisperInput:SetWidth(530);
	

	local WhisperInputLabel = PLH_WhisperInput:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	WhisperInputLabel:SetPoint('LEFT', PLH_HighlightRaidFramesCheckbox, 'LEFT', 0, -29)
	WhisperInputLabel:SetText('Whisper DISABLED, Targert player and do a whisper')
-- tiny
	
	--[[ Thank you message ]] --
	local ThankYouLabel = PLHConfigFrame:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
	ThankYouLabel:SetPoint('BOTTOM', PLHConfigFrame, 'BOTTOM', 0, 48)
	ThankYouLabel:SetText('Thank you to all of the players who trade loot to others who can use it! Your generosity is part of what makes the WoW community great.\nYou rock!!!')
	ThankYouLabel:SetWidth(300)
	ThankYouLabel:SetWordWrap(true)

	--[[ OnShow Event]]
	PLHConfigFrame:SetScript('OnShow', function(frame)
		PLH_IncludeBOECheckbox:SetChecked(PLH_INCLUDE_BOE)
		PLH_CurrentSpecOnlyCheckbox:SetChecked(PLH_CURRENT_SPEC_ONLY)
		PLH_CheckCharacterLevelCheckbox:SetChecked(PLH_CHECK_CHARACTER_LEVEL)
		PLH_HighlightRaidFramesCheckbox:SetChecked(PLH_HIGHLIGHT_RAID_FRAMES)
		PLH_NotifyGroupCheckbox:SetChecked(PLH_NOTIFY_GROUP)
		PLH_CoordinateRollsCheckbox:SetChecked(PLH_COORDINATE_ROLLS)
		PLH_HighlightSizeSlider:SetValue(PLH_HIGHLIGHT_SIZE)
-- tiny start
--HIDE THE AUTOWHISPER STUFF.. ITS ANNOYING
			PLH_WhisperUpgradeCheckbox:Hide()
			WhisperUpgradeLabel:Hide()
-- end hide it			
			
		PLH_WhisperUpgradeCheckbox:SetChecked(PLH_WHISPER_UPGRADE)
		PLH_WhisperInput:SetText(PLH_WHISPER_TEXT)
-- tiny end
	end)

	--[[ Okay Action ]]--
	function PLHConfigFrame.okay(arg1, arg2, arg3, ...)
	-- tiny start
		PLH_WHISPER_UPGRADE = PLH_WhisperUpgradeCheckbox:GetChecked()
		PLH_WHISPER_TEXT = PLH_WhisperInput:GetText()
	-- tiny end	
	-- tiny start
		if PLH_WHISPER_TEXT == nil or PLH_WHISPER_TEXT == "" then
		   PLH_WHISPER_TEXT = 'im using PLH frames, and been too lazy to change default whisper'
		end   
	-- tiny end
		PLH_INCLUDE_BOE = PLH_IncludeBOECheckbox:GetChecked()
		PLH_CURRENT_SPEC_ONLY = PLH_CurrentSpecOnlyCheckbox:GetChecked()
		PLH_CHECK_CHARACTER_LEVEL = PLH_CheckCharacterLevelCheckbox:GetChecked()
		PLH_HIGHLIGHT_RAID_FRAMES = PLH_HighlightRaidFramesCheckbox:GetChecked()
		PLH_NOTIFY_GROUP = PLH_NotifyGroupCheckbox:GetChecked()
		PLH_COORDINATE_ROLLS = PLH_CoordinateRollsCheckbox:GetChecked()
		PLH_HIGHLIGHT_SIZE = PLH_HighlightSizeSlider:GetValue()
		PLH_ResizeHighlights()
	end

end

-- tiny start
-- tiny:arg1 is Padding space for frames, arg2 is text for frame gotten from optionmenu
--      arg3 is chat message from options, arg4 is charactername with realm
--  arg5 is targetunit 


function PLH_CreateLootFrame(arg1, arg2, arg3, arg4, arg5)
local frame  = CreateFrame("Frame", "PLHLootFrame", UIParent)
frame.width  = 500
frame.height = 110
frame:SetFrameStrata("FULLSCREEN_DIALOG")
frame:SetSize(frame.width, frame.height)
frame:SetPoint("CENTER", UIParent, "CENTER", 0, arg1)
frame:SetBackdrop({
	bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	tile     = true,
	tileSize = 32,
	edgeSize = 32,
	insets   = { left = 8, right = 8, top = 8, bottom = 8 }
})
frame:SetBackdropColor(0, 0, 0, 1)
frame:EnableMouse(true)
frame:EnableMouseWheel(true)

-- Make movable/resizable
frame:SetMovable(true)
frame:SetResizable(enable)
frame:SetMinResize(100, 100)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

tinsert(UISpecialFrames, "PLHLootFrame")

-- Close button
local closeButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
closeButton:SetPoint("BOTTOM", -60, 10)
closeButton:SetHeight(25)
closeButton:SetWidth(50)
closeButton:SetText("CLOSE")
closeButton:SetScript("OnClick", function(self)	self:GetParent():Hide() end)
frame.closeButton = closeButton

-- Whisper button
--[[Removed
local whisperButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
whisperButton:SetPoint("BOTTOM", 60, 10)
whisperButton:SetHeight(25)
whisperButton:SetWidth(50)
whisperButton:SetText("WHISPER")
whisperButton:SetScript("OnClick", function(self) SendChatMessage(arg3, "WHISPER", nil, arg4)  end)
frame.whisperButton = whisperButton
]]--
-- Target button
    local HSframe = CreateFrame("BUTTON","homeButton", frame, "SecureActionButtonTemplate")
    HSframe:SetPoint("BOTTOM", 0, 15)
    HSframe:SetSize(42, 16)
    HSframe:EnableMouse(true)
    HSframe:RegisterForClicks("AnyUp")
    HSframe:SetAttribute("type", "macro")
    HSframe:SetAttribute("macrotext", "/tar " .. arg5)
     
    HSframe.icon = HSframe:CreateTexture(nil,"OVERLAY",nil,7)
    HSframe.icon:SetSize(42, 16)
    HSframe.icon:SetPoint("LEFT")
   -- HSframe.icon:SetTexture(1,1,0)
     
    HSframe.text = HSframe:CreateFontString(nil, "OVERLAY")
    HSframe.text:SetFont(STANDARD_TEXT_FONT, 16, "THINOUTLINE")
    HSframe.text:SetPoint("LEFT")
    HSframe.text:SetText("Target")


-- ScrollingMessageFrame
local messageFrame = CreateFrame("ScrollingMessageFrame", nil, frame)
messageFrame:SetPoint("CENTER", 15, 20)
messageFrame:SetSize(frame.width, frame.height - 50)
messageFrame:SetFontObject(GameFontNormalLarge)
messageFrame:SetTextColor(1, 1, 1, 1) -- default color
messageFrame:SetJustifyH("LEFT")
messageFrame:SetHyperlinksEnabled(true)
messageFrame:SetFading(false)
messageFrame:SetMaxLines(300)
frame.messageFrame = messageFrame

messageFrame:AddMessage(arg2)


-- tiny Just using 1 line so no need for scrollbars
--[[
-------------------------------------------------------------------------------
-- Scroll bar
-------------------------------------------------------------------------------
local scrollBar = CreateFrame("Slider", nil, frame, "UIPanelScrollBarTemplate")
scrollBar:SetPoint("RIGHT", frame, "RIGHT", -10, 10)
scrollBar:SetSize(30, frame.height - 90)
scrollBar:SetMinMaxValues(0, 9)
scrollBar:SetValueStep(1)
scrollBar.scrollStep = 1
frame.scrollBar = scrollBar

scrollBar:SetScript("OnValueChanged", function(self, value)
	messageFrame:SetScrollOffset(select(2, scrollBar:GetMinMaxValues()) - value)
end)

scrollBar:SetValue(select(2, scrollBar:GetMinMaxValues()))

frame:SetScript("OnMouseWheel", function(self, delta)
	print(messageFrame:GetNumMessages(), messageFrame:GetNumLinesDisplayed())

	local cur_val = scrollBar:GetValue()
	local min_val, max_val = scrollBar:GetMinMaxValues()

	if delta < 0 and cur_val < max_val then
		cur_val = math.min(max_val, cur_val + 1)
		scrollBar:SetValue(cur_val)
	elseif delta > 0 and cur_val > min_val then
		cur_val = math.max(min_val, cur_val - 1)
		scrollBar:SetValue(cur_val)
	end
end)
]]

messageFrame:SetScript("OnHyperlinkClick", function(self, link, text)
 -- thanx to https://www.reddit.com/r/wowaddons/comments/59iecy/devhelp_spell_hyperlink_in_custom_frame_text/
  SetItemRef(link, text)
	  end)

end

-- tiny end

--tiny 
-- trade frame
-- dont need arg 5 that is the playername
-- arg 4 is "announce roll is over " TRADEMETEXT = TRADEMETEXT .. item from core.lua
function PLH_CreateTradeFrame(arg1, arg2, arg3, arg4)
local _, typeOfInstancetosendchat, difficultychat, _, _, _, _, _, _ = GetInstanceInfo()
local frame  = CreateFrame("Frame", "PLHLootFrame", UIParent)

frame.width  = 500
frame.height = 110
frame:SetFrameStrata("FULLSCREEN_DIALOG")
frame:SetSize(frame.width, frame.height)
frame:SetPoint("CENTER", UIParent, "RIGHT", -300, arg1)
frame:SetBackdrop({
	bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	tile     = true,
	tileSize = 32,
	edgeSize = 32,
	insets   = { left = 8, right = 8, top = 8, bottom = 8 }
})
frame:SetBackdropColor(0, 0, 0, 1)
frame:EnableMouse(true)
frame:EnableMouseWheel(true)

-- Make movable/resizable
frame:SetMovable(true)
frame:SetResizable(enable)
frame:SetMinResize(100, 100)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

tinsert(UISpecialFrames, "PLHTradeFrame")

-- Close button
local closeButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
closeButton:SetPoint("BOTTOM", -150, 10)
closeButton:SetHeight(25)
closeButton:SetWidth(50)
closeButton:SetText("CLOSE")
closeButton:SetScript("OnClick", function(self) self:GetParent():Hide() end)
frame.closeButton = closeButton

--trademe button

local trademeButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")

trademeButton:SetPoint("BOTTOM", 0, 10)
trademeButton:SetHeight(25)
trademeButton:SetWidth(210)
trademeButton:SetText("EndRoll-Target is announced winner")
local vinner = GetUnitName("PLAYERTARGET", showServerName)

if typeOfInstancetosendchat == "none" then
	trademeButton:SetScript("OnClick", function(self)
	vinner = GetUnitName("PLAYERTARGET", showServerName)
		if vinner then -- check if player accually have targeted a unit
			arg4 = arg4 .. " " .. vinner .. " won the roll"
		end
	SendChatMessage(arg4, "say", nil )  
	end)	--GetUnitName("PLAYERTARGET")
else
-- Raid finder difficulty is 7 and 17
		if (difficultychat == 7) or (difficultychat == 17) then
	trademeButton:SetScript("OnClick", function(self) 
	vinner = GetUnitName("PLAYERTARGET", showServerName)
		if vinner then -- check if player accually have targeted a unit
			arg4 = arg4 .. ".  " .. vinner .. " won the roll"
		end	  
	SendChatMessage(arg4, "INSTANCE_CHAT" )  
	end)
		else
	trademeButton:SetScript("OnClick", function(self)
	vinner = GetUnitName("PLAYERTARGET", showServerName)
		if vinner then -- check if player accually have targeted a unit
			arg4 = arg4 .. " " .. vinner .. " won the roll"
		end		
		SendChatMessage(arg4, typeOfInstancetosendchat, nil )
	end) 
		end
end
	frame.trademeButton = trademeButton





-- Announce button
local whisperButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")

whisperButton:SetPoint("BOTTOM", 140, 10)
whisperButton:SetHeight(25)
whisperButton:SetWidth(50)
whisperButton:SetText("Announce")
if typeOfInstancetosendchat == "none" then
	whisperButton:SetScript("OnClick", function(self) SendChatMessage(arg3, "say", nil )  end)	
else
-- Raid finder difficulty is 7 and 17
		if (difficultychat == 7) or (difficultychat == 17) then
	
	      whisperButton:SetScript("OnClick", function(self) SendChatMessage(arg3, "INSTANCE_CHAT" )  end)
		else
		  whisperButton:SetScript("OnClick", function(self) SendChatMessage(arg3, typeOfInstancetosendchat, nil )  end) 
		end
end
	frame.whisperButton = whisperButton

-- ScrollingMessageFrame
local message1 = "|cFF00FF00If no target is made, name is not added to Endroll|r"
local messageFrame = CreateFrame("ScrollingMessageFrame", nil, frame)
messageFrame:SetPoint("CENTER", 15, 20)
messageFrame:SetSize(frame.width, frame.height - 50)
messageFrame:SetFontObject(GameFontNormalLarge)
messageFrame:SetTextColor(1, 1, 1, 1) -- default color
messageFrame:SetJustifyH("LEFT")
messageFrame:SetHyperlinksEnabled(true)
messageFrame:SetFading(false)
messageFrame:SetMaxLines(300)
frame.messageFrame = messageFrame

messageFrame:AddMessage(arg2)
messageFrame:AddMessage(message1)


messageFrame:SetScript("OnHyperlinkClick", function(self, link, text)
 -- thanx to https://www.reddit.com/r/wowaddons/comments/59iecy/devhelp_spell_hyperlink_in_custom_frame_text/
  SetItemRef(link, text)
	  end)

end