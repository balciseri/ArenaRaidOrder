--Unchek keep group togher and select sort group

local function ArenaRaidOrder_OnEvent(self,event)
    if event == "PLAYER_ENTERING_WORLD" then
		LoadAddOn("Blizzard_CompactRaidFrames")
		
		CRFSort_Group = function(t1, t2)
			if UnitIsUnit(t1,"player") then
				return false
			elseif UnitIsUnit(t2,"player") then
				return true
			else
				return t1 < t2
			end
		end 
		
		CompactRaidFrameContainer.flowSortFunc=CRFSort_Group;
        print("Arena Raid Order enabled")
    end
end

--make the raid frames even more resizable
local n,w,h="CompactUnitFrameProfilesGeneralOptionsFrame"
	h=_G[n.."HeightSlider"]
	w=_G[n.."WidthSlider"] 
	h:SetMinMaxValues(1,150) 
	w:SetMinMaxValues(1,150)

local arenaRaidOrder = CreateFrame("Frame")

arenaRaidOrder:SetScript("OnEvent",ArenaRaidOrder_OnEvent)
arenaRaidOrder:RegisterEvent("PLAYER_ENTERING_WORLD")