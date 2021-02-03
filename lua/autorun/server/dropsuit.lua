local msg = "!dropsuit" -- Message the player needs to type

hook.Add("PlayerSay", "armorDropToFloor", function(ply, txt)
	if !ply || !ply:IsPlayer() then return end
	if string.lower(txt) == msg:lower() && ply.armorSuit && ply.armorSuit ~= "" then
		local data = Armor:Get(ply.armorSuit)
		local ent = ents.Create(data.Entitie)
		ent:SetPos(ply:GetPos() + (ply:GetForward() * 50) + Vector(0,0,50))
		ent:Spawn()
		ply:removeArmorSuit()
		return ""
	end
end)