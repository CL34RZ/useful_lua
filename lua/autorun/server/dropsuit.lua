hook.Add("PlayerSay", "armorDropToFloor", function(ply, txt)
	if !ply:IsPlayer() then return end
	if string.lower(txt) == "!droparmor" && ply.armorSuit then
		local data = Armor:Get(ply.armorSuit)
		local ent = ents.Create(data.Entitie)
		ent:SetPos(ply:GetPos() + (ply:GetForward() * 50) + Vector(0,0,50))
		ent:Spawn()
		ply:removeArmorSuit()
	end
end)