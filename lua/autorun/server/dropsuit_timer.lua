local cfg = {
    msg = "!dropsuit", -- Message the player needs to type
    dropTime = 5 -- Time to wait before dropping suit (seconds)
}

hook.Add("PlayerSay", "armorDropToFloor", function(ply, txt)
	if !ply || !ply:IsPlayer() then return end
	if string.lower(txt) == cfg.msg:lower() then
        DarkRP.notify(ply, 0, cfg.dropTime, "Dropping suit in " .. cfg.dropTime .. " seconds")
        timer.Simple(cfg.dropTime, function()
            if !ply || !ply:IsValid() then return end -- player likely left
            if !ply:Alive() || !ply.armorSuit || ply.armorSuit == "" then
                DarkRP.notify(ply, 1, 4, "Unable to drop suit")
                return
            end
            local data = Armor:Get(ply.armorSuit)
            local ent = ents.Create(data.Entitie)
            ent:SetPos(ply:GetPos() + (ply:GetForward() * 50) + Vector(0,0,50))
            ent:Spawn()
            ply:removeArmorSuit()
        end)
		return ""
	end
end)