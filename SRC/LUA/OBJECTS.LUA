-- OBJECTS.LUA
-- Code by LeonardoTheMutant
--
-- Logic script for various objects and mapthings

local killtrailCVAR = CV_FindVar("mm_killtrails")

-- Dead player body MapThing spawner (Map thing type 2023)
addHook("MapThingSpawn", function(mo, mapthing)
	if (mapthing.stringargs[0] and skins[mapthing.stringargs[0]])
		mo.skin = mapthing.stringargs[0]
		if (P_IsValidSprite2(mo, SPR2_SHIT)) then mo.state = S_MMPLRDEAD
		else mo.state = S_MMSKELT end
	else
		mo.state = S_MMSKELT
	end
	mo.color = mapthing.args[0]
	return true
end, MT_DEADPLR)

-- Sheriff's Emerald pickup logic
addHook("TouchSpecial", function(s, t) --special, toucher
	if (gametype != GT_LTMMURDERMYSTERY) return end

	if valid(t) and valid(t.player) and (t.player.mm.role == ROLE_CIVILIAN)
		for emeraldID = 1, #MM.shremds do
			if ((MM.shremds[emeraldID].x == s.x) and (MM.shremds[emeraldID].y == s.y) and (MM.shremds[emeraldID].z == s.z))
				table.remove(MM.shremds, emeraldID)
				P_RemoveMobj(s)
				break
			end
		end
		S_StartSound(t.player.mo, sfx_cgot, t.player)
		t.player.mm.role = ROLE_HERO
		t.player.mm.hud.roleflicker = 70 --2 secs
		MM.ChatprintGlobal("CHAT_SHREMDPICKUP")
		MM.StartShowdownMusic()
	end

	return true
end, MT_SHREMD)

-- Dead Player Body blood trail activator
addHook("TouchSpecial", function(s, t) --special, toucher
	if (t.player.mm and killtrailCVAR.value)
		t.player.mm.killtrailsteps = 30
		return true
	end
end, MT_DEADPLR)


--
-- EVIL KNUCKLES PLUSH
--

-- Spawner
addHook("MapLoad", do
	local s = {} --spawnpoints
	for t in mapthings.iterate do --find all spawnpoints
		if (t.type == 2025) then table.insert(s, (#s + 1), t) end
	end
	if (#s) --if there are spawnpoints available, spawn the plushie at a random spawn
		local i = P_RandomKey(#s) + 1
		P_SpawnMobj((s[i].x << FRACBITS), (s[i].y << FRACBITS), (s[i].z << FRACBITS), MT_EVILKNUX)
		MM.DebugPrint(string.format("Spawned Evil Knux Plush at %d, %d, %d out of %d possible spawnpoint choices", s[i].x, s[i].y, s[i].z, #s))
	end
end)

-- Collision trigger
addHook("TouchSpecial", function(s, t) --special, toucher
	if (s.alpha == FU)
		S_StartSound(nil, sfx_squeak)
		s.alpha = $ - 1024
		t.player.rings = $ + 500 
		t.player.powers[pw_infinityring] = $ + (MM.weapons[0][5] >> 3)
		t.player.powers[pw_automaticring] = $ + (MM.weapons[1][5] >> 1)
		t.player.powers[pw_bouncering] = $ + (MM.weapons[2][5] >> 1)
		t.player.powers[pw_scatterring] = $ + (MM.weapons[3][5] >> 1)
		t.player.powers[pw_grenadering] = $ + (MM.weapons[4][5] >> 1)
		t.player.powers[pw_explosionring] = $ + (MM.weapons[5][5] >> 1)
		t.player.powers[pw_railring] = $ + (MM.weapons[6][5] >> 1)
		MM.DebugPrint(string.format("\x8A%s\x80 touched the Evil Knux Plush", t.player.name))
	end
	return true
end, MT_EVILKNUX)

-- Despawner
addHook("MobjThinker", function(m)
	if (m.alpha) then if (m.alpha != FU) then m.alpha = $ - 1024 end
	else P_RemoveMobj(m) end
end, MT_EVILKNUX)
