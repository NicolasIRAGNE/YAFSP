local frame = CreateFrame("FRAME", "YAFSPFrame");
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");


local playerGUID = UnitGUID("player")

local function eventHandler(self, event, ...)
    if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
        if (subevent == "SPELL_AURA_APPLIED" and destGUID == playerGUID) then
            local spellId, spellName = select(12, CombatLogGetCurrentEventInfo()) -- i hate lua
            -- Check if aura applied is Runic Affinity
            if (spellId == 354964)
                then
                    file = "Interface/AddOns/YAFSP/media/good_music.mp3"
                    PlaySoundFile(file, "SFX") -- Play in SFX channel so it still plays even if music is muted
                end
            end
        end
    end
end

frame:SetScript("OnEvent", eventHandler);
