-- HUD.LUA
-- Base code by Tedvin11
-- Improved and developed further by LeonardoTheMutant
--
-- This script takes care of HUD elements
-- Good luck reading all of this

--Constants
local HudInfoSize = {0,0,0}
local maxHudIfnfoSize = 0
local cv_cryptic = CV_FindVar("mm_cryptic")
local wepcfgCVARs = {CV_FindVar("mm_wepcfg_murd"), CV_FindVar("mm_wepcfg_sheri"), CV_FindVar("mm_wepcfg_civil"), CV_FindVar("mm_wepcfg_hero")}
local scorePatchName, plrsAlive, rival

local function wep2rw(wep) --convert WEP_* constant to RW_* constant
	return 2^(wep - 1)
end

local function V_GetSHREMDiconID(dist)
	if (dist < 256) return 6
	elseif (dist < 512) return 5
	elseif (dist < 1024) return 4
	elseif (dist < 2048) return 3
	elseif (dist < 4096) return 2
	else return 1 end
end

--
-- Main game HUD
--
hud.add(function(v, p)
	if (gametype != GT_LTMMURDERMYSTERY) --in case if switched from MM to another gametype
		hud.enable("lives")
		hud.enable("textspectator")
		hud.enable("score")
		hud.enable("time")
		hud.enable("rings")
		hud.enable("weaponrings")
		return
	end

	--Calculate important canvas values which are going to be used in the entire UI of the add-on
	MM.hud.canvas.width = v.width()/v.dupx()
	MM.hud.canvas.height = v.height()/v.dupy()
	MM.hud.canvas.font.scale = FU
	MM.hud.canvas.font.charwidth = FixedMul(HIDEO.charwidth, MM.hud.canvas.font.scale)
	MM.hud.canvas.font.charheight = FixedMul(HIDEO.charheight, MM.hud.canvas.font.scale)

	--Canvas values for small font
	if (v.width() < 640) then MM.hud.canvas.font.small.scale = MM.hud.canvas.font.scale
	else MM.hud.canvas.font.small.scale = 32768 end --MM.hud.canvas.font.scale/2
	MM.hud.canvas.font.small.charwidth = FixedMul(HIDEO.charwidth, MM.hud.canvas.font.small.scale)
	MM.hud.canvas.font.small.charheight = FixedMul(HIDEO.charheight, MM.hud.canvas.font.small.scale)

	--Patch Graphics loading
	if (not MM.graphics)
		MM.DebugPrint("Loading graphics")
		HIDEO.LoadUnicodeFont(v) --Initialize Unicode renderer

		--Colon for time counter
		MM.LoadPatch(v, "STTCOLON")

		--Emerald icon
		MM.LoadPatch(v, "CHAOS3")

		--Radar icons
		for i = 1, 6 do
			if v.patchExists("IDEYAR"..i) then MM.LoadPatch(v, "IDEYAR"..i) end
		end

		--Weapon icons
		for i = -2, 6 do MM.LoadPatch(v, MM.weapons[i][1]) end
		MM.LoadPatch(v, "CURWEAP") --weapon selector

		--Past/Future Warp Signs
		MM.LoadPatch(v, "TWS_FUTR")
		MM.LoadPatch(v, "TWS_PAST")

		--MMHELP scrolling background
		MM.LoadPatch(v, "NTSATKT2")
		MM.LoadPatch(v, "NTSATKB1")

		--Sonic Run
		--Running frames
		for i = 1, 2 do
			if v.patchExists("SNC_RUN"..i) then MM.LoadPatch(v, "SNC_RUN"..i) end
		end
		--Spinning frames
		for i = 1, 3 do
			if v.patchExists("SNC_SPN"..i) then MM.LoadPatch(v, "SNC_SPN"..i) end
		end
		--Idle/standing frame
		if v.patchExists("SNC_STND") then MM.LoadPatch(v, "SNC_STND") end
		--Countdown numbers
		for i = 1, 3 do MM.LoadPatch(v, "RACE"..i) end
		MM.LoadPatch(v, "RACEGO")

		--Intermission background
		for i = 0, 2 do
			if v.patchExists("INTRMBG"..i) then MM.LoadPatch(v, "INTRMBG"..i) end
		end
	end

	--Do not render the main HUD if it was disabled by another (MM) script
	if (not MM.hud.game.active) or ((MM.twopgame and MM.minigame and p.mm.minigame) or (not MM.twopgame and p.mm.minigame) or (p.spectator and p.mm.minigame)) return end

	hud.disable("lives")
	hud.disable("textspectator")
	hud.disable("score")
	hud.disable("time")
	hud.disable("rings")
	hud.disable("weaponrings")


	--HIDEO.DrawStrUnicode(v, 0, 100, HIDEO.WordWrap(0, 320, V_MONOSPACE, FU, "\nDiscord: ^4https://www.discord.com/invite/UgG8h2djFE^0"), V_MONOSPACE)
	
	
	--HIDEO.DrawStrUnicode(v, 0, 100, HIDEO.WordWrap(0, 320, V_MONOSPACE, FU, "\nDiscord: ^4https://www.discord.com/invite/UgG8h2djFE^0"), V_MONOSPACE)
	
	--
	-- SUSPECTS - TIME - RINGS
	--

	--precalculate the expected sizes of these elements to make the HUD look SonicCD-style
	--SUSPECTS/VICTIMS (replaces SCORES)
	if ((p.mm.role == ROLE_MURDERER) or (p.mm.finished)) then scorePatchName = "BMP_VICTIMS"
	else scorePatchName = "BMP_SUSPECTS" end

	if (MM.text[MM.lang][scorePatchName]) then HudInfoSize[1] = HIDEO.GetTextPatchWidth(MM.text[MM.lang][scorePatchName]) + 40
	else HudInfoSize[1] = 96 end

	--TIME
	if (MM.text[MM.lang]["BMP_TIME"]) then HudInfoSize[2] = HIDEO.GetTextPatchWidth(MM.text[MM.lang]["BMP_TIME"]) + 64
	else HudInfoSize[2] = 96 end

	--RINGS
	if (MM.text[MM.lang]["BMP_RINGS"]) then HudInfoSize[3] = HIDEO.GetTextPatchWidth(MM.text[MM.lang]["BMP_RINGS"]) + 52
	else HudInfoSize[3] = 92 end

	--find the longest element
	maxHudIfnfoSize = HudInfoSize[1]
	for element = 2, 3 do if (HudInfoSize[element] > maxHudIfnfoSize) then maxHudIfnfoSize = HudInfoSize[element] end end

	--now we can draw

	--SUSPECTS/VICTIMS
	--Draw the Text Label
	if (MM.text[MM.lang][scorePatchName])
		HIDEO.DrawTextPatch(v, hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, MM.text[MM.lang][scorePatchName], hudinfo[HUD_SCORE].f|V_PERPLAYER|v.localTransFlag())
	else --in case Text Patch was not found
		switch(scorePatchName, {
			["BMP_VICTIMS"] = do v.drawString(hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, "VICTIMS", hudinfo[HUD_SCORE].f|V_PERPLAYER|V_YELLOWMAP|v.localTransFlag()) end,
			["BMP_SUSPECTS"] = do v.drawString(hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, "SUSPECTS", hudinfo[HUD_SCORE].f|V_PERPLAYER|V_YELLOWMAP|v.localTransFlag()) end
		})
	end
	--Calculate the number of suspects/victims
	switch(p.mm.role, {
		[ROLE_MURDERER] = do plrsAlive = MM.PlayersAlive() - MM.PlayerCount(ROLE_MURDERER) end,
		[ROLE_SHERIFF] = do plrsAlive = MM.PlayersAlive() - MM.PlayerCount(ROLE_SHERIFF) - MM.PlayerCount(ROLE_HERO) end,
		[ROLE_HERO] = do plrsAlive = MM.PlayersAlive() - MM.PlayerCount(ROLE_SHERIFF) - MM.PlayerCount(ROLE_HERO) end,
		['default'] = do plrsAlive = MM.PlayersAlive() - 1 end --Civilian and Dead
	})
	--Draw the number
	v.drawNum(((hudinfo[HUD_SCORE].x + maxHudIfnfoSize) - 16), hudinfo[HUD_SCORE].y, max(plrsAlive, 0), hudinfo[HUD_SCORE].f|V_PERPLAYER|v.localTransFlag())

	--TIME
	--timer calculation
	local timertime = (MM.timelimit * 2100) - leveltime

	if (timertime < 0) timertime = 0 end
	if (MM.text[MM.lang]["BMP_TIME"])
		--Draw the Text Label
		if ((not G_TicsToMinutes(timertime)) and (leveltime & 4))
			--Swap the colors in the label for flashing effect
			--0x49 in SRB2's palette is Yellow, 0x25 is Red
			HIDEO.DrawTextPatch(v, hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, HIDEO.TextPatch_SwapColor(MM.text[MM.lang]["BMP_TIME"], 0x49, 0x25), hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag())
		else
			HIDEO.DrawTextPatch(v, hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, MM.text[MM.lang]["BMP_TIME"], hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag())
		end
	else --in case Text Patch was not found
		if ((not G_TicsToMinutes(timertime)) and (leveltime & 4))
			v.drawString(hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, "TIME", hudinfo[HUD_TIME].f|V_PERPLAYER|V_REDMAP|v.localTransFlag())
		else
			v.drawString(hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, "TIME", hudinfo[HUD_TIME].f|V_PERPLAYER|V_YELLOWMAP|v.localTransFlag())
		end
	end
	--Draw the time
	v.drawPaddedNum(((hudinfo[HUD_TIME].x + maxHudIfnfoSize) - 16), hudinfo[HUD_TIME].y, G_TicsToSeconds(timertime), 2, hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag()) --seconds
	v.draw(((hudinfo[HUD_TIME].x + maxHudIfnfoSize) - 40), hudinfo[HUD_TIME].y, MM.graphics["STTCOLON"], hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag()) --colon
	v.drawNum(((hudinfo[HUD_TIME].x + maxHudIfnfoSize) - 40), hudinfo[HUD_TIME].y, G_TicsToMinutes(timertime), hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag()) --minutes

	--RINGS
	if (not p.spectator)
		if (MM.text[MM.lang]["BMP_RINGS"])
			if (not p.rings) and (leveltime & 4)
				HIDEO.DrawTextPatch(v, hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, HIDEO.TextPatch_SwapColor(MM.text[MM.lang]["BMP_RINGS"], 0x49, 0x25), hudinfo[HUD_RINGS].f|V_PERPLAYER|v.localTransFlag())
			else
				HIDEO.DrawTextPatch(v, hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, MM.text[MM.lang]["BMP_RINGS"], hudinfo[HUD_RINGS].f|V_PERPLAYER|v.localTransFlag())
			end
		else --in case Text Patch was not found or the game is splitscreen
			if (not p.rings) and (leveltime & 4)
				v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, "RINGS", hudinfo[HUD_RINGS].f|V_PERPLAYER|V_REDMAP|v.localTransFlag())
			else
				v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, "RINGS", hudinfo[HUD_RINGS].f|V_PERPLAYER|V_YELLOWMAP|v.localTransFlag())
			end
		end
		v.drawNum(((hudinfo[HUD_RINGS].x + maxHudIfnfoSize) - 16), hudinfo[HUD_RINGS].y, p.rings, hudinfo[HUD_RINGS].f|V_PERPLAYER|v.localTransFlag())
	end
	
	--Time Warp Sign ("Warp ticket")
	if (p.mm.timetravel) and (p.mm.timetravel.timesign) and (not p.spectator) and ((p.mm.timetravel.warptimer < 70) or ((p.mm.timetravel.warptimer >= 70) and (not (p.mm.timetravel.warptimer % 2))))
		switch(p.mm.timetravel.timesign, {
			--Past
			[1] = do v.draw(hudinfo[HUD_LIVES].x, (hudinfo[HUD_LIVES].y - 18), MM.graphics["TWS_PAST"], hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag()) end,
			--Future
			[2] = do v.draw(hudinfo[HUD_LIVES].x, (hudinfo[HUD_LIVES].y - 18), MM.graphics["TWS_FUTR"], hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag()) end
		})
	end

	--Life icon, player name and role
	v.drawScaled((hudinfo[HUD_LIVES].x * FU), (hudinfo[HUD_LIVES].y * FU), 32768, v.getSprite2Patch(p.skin, SPR2_XTRA), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag(), v.getColormap(p.skin, p.skincolor)) --FU/2
	v.drawString((hudinfo[HUD_LIVES].x + 18), hudinfo[HUD_LIVES].y, p.name, hudinfo[HUD_LIVES].f|V_ALLOWLOWERCASE|V_PERPLAYER|v.localTransFlag())

	--Show your role
	if ((p.mm.role) and  (p.mm.role > ROLE_NONE) and (MM.hud.game.roleflicker % 2) == 0)
		HIDEO.DrawStrUnicode(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), MM.RoleColorHUD[p.mm.role]..MM.GetText("HUD_ROLES", p.mm.role), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.scale)
	end
	
	--Print the name of the current timezone you're in (exclusive for MAPKD ("East City"))
	if (p.mm.timetravel and p.mm.timetravel.timezone) and (not p.spectator)
		if (p.mm.timetravel.timezone == TIMEZONE_PAST) --Past
			HIDEO.DrawStrUnicode(v, (hudinfo[HUD_LIVES].x), (hudinfo[HUD_LIVES].y + 16), "^6"..MM.GetText("HUD_PAST"), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.scale)
		elseif (p.mm.timetravel.timezone > TIMEZONE_PRESENT) --One of the Futures
			HIDEO.DrawStrUnicode(v, (hudinfo[HUD_LIVES].x), (hudinfo[HUD_LIVES].y + 16), "^6"..MM.GetText("HUD_FUTURE"), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.scale)
		end
	end

	--DEAD player exclusive HUD
	if (p.mm.finished)
		--DEAD role label
		HIDEO.DrawStrUnicode(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), MM.RoleColorHUD[5]..MM.GetText("HUD_ROLES", 5), hudinfo[HUD_LIVES].f|v.localTransFlag(), MM.hud.canvas.font.scale)
		HIDEO.DrawStrUnicode_Center(v, 160, 120, HIDEO.WordWrap(0, MM.hud.canvas.width, 0, MM.hud.canvas.font.scale, MM.GetText("HUD_DEAD")), v.localTransFlag(), MM.hud.canvas.font.scale)

		--"You joined mid-game"
		if (p.mm.role == nil)
			HIDEO.DrawStrUnicode_Center(v, 160, 156, HIDEO.WordWrap(0, MM.hud.canvas.width, 0, MM.hud.canvas.font.small.scale, MM.GetText("HUD_MIDJOIN")), v.localTransFlag(), MM.hud.canvas.font.small.scale)
		end

		--"Killed by"
		if (p.mm.killreason)
			switch(p.mm.killreason, {
				[KILLBY_PLR] = do
					if (p.mm.killername) then HIDEO.DrawStrUnicode(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y), "^5"..MM.GetText("HUD_KILLEDBY", 1).."^0 "..p.mm.killername, hudinfo[HUD_RINGS].f) end
				end,
				['default'] = do
					HIDEO.DrawStrUnicode(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y), "^5"..MM.GetText("HUD_KILLEDBY", 1).."^0 "..MM.GetText("HUD_KILLEDBY", p.mm.killreason), V_SNAPTOTOP|V_SNAPTOLEFT)
				end
			})
		end

		if ((not p.mm.minigame) and (not MM.minigame))
			HIDEO.DrawStrUnicode_Right(v, 320, 0, MM.GetText("HUD_MINIGAME", "BORED"), V_SNAPTOTOP|V_SNAPTORIGHT|v.localTransFlag(), MM.hud.canvas.font.scale)
			HIDEO.DrawStrUnicode_Right(v, 320, MM.hud.canvas.font.small.charheight, MM.GetText("HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|v.localTransFlag(), MM.hud.canvas.font.small.scale)
			HIDEO.DrawStrUnicode_Right(v, 320, 2*MM.hud.canvas.font.small.charheight, MM.GetText("HUD_MINIGAME", "START"), V_SNAPTOTOP|V_SNAPTORIGHT|v.localTransFlag(), MM.hud.canvas.font.small.scale)
		end
	end

	--Show the PONG-related text & invitations
	if (not p.spectator) and (MM.twopgame) and (MM.duelplrs)
		local rival
		if (valid(MM.duelplrs[1]) and (MM.duelplrs[1] == p))
			rival = MM.duelplrs[2]
		elseif (valid(MM.duelplrs[2]) and (MM.duelplrs[2] == p))
			rival = MM.duelplrs[1]
		end

		if (valid(rival))
			if ((not p.mm.minigame) and (not rival.mm.minigame))
				HIDEO.DrawStrUnicode_Right(v, 320, 0, MM.GetText("HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
				HIDEO.DrawStrUnicode_Right(v, 320, MM.hud.canvas.font.small.charheight, MM.GetText("HUD_MINIGAME", "REQUEST"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
			elseif ((p.mm.minigame) and (not rival.mm.minigame))
				HIDEO.DrawStrUnicode_Right(v, 320, 0, MM.GetText("HUD_MINIGAME", "WAIT"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
				if (not p.mm.minigame.timeout)
					HIDEO.DrawStrUnicode_Right(v, 320, MM.hud.canvas.font.small.charheight, (MM.GetText("HUD_MINIGAME", "PRESS").." "..MM.GetText("HUD_MINIGAME", "CANCEL")), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
				end
			elseif ((not p.mm.minigame) and (rival.mm.minigame) and (leveltime % 2))
				HIDEO.DrawStrUnicode_Right(v, 320, 0, MM.GetText("HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
				HIDEO.DrawStrUnicode_Right(v, 320, MM.hud.canvas.font.small.charheight, MM.GetText("HUD_MINIGAME", "ACCEPT"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
			end
		end
	end

	--WEAPON RINGS

	--Weapon selector frame Y position calculation
	--ported from the SRB2's Source Code
	local q = p.mm.weapondelay
	local del = 0
	local pv = 16
	while (q)
		if (q > pv)
			del = $ + pv
			q = $ - pv
			q = $ / 2
			if (pv > 1) pv = $ / 2 end
		else
			del = $ + q
			break
		end
	end

	--Weapon logic
	if ((p.mm.role == ROLE_MURDERER) or (p.mm.role == ROLE_SHERIFF) or (p.mm.role == ROLE_HERO))
		local wepPatchFlags={
			0, --automatic
			0, --bounce
			0, --scatter
			0, --grenade
			0, --explosion
			0, --rail
		}
		wepPatchFlags[0] = 0 --infinity
		local wepTextFlags={
			0, --automatic
			0, --bounce
			0, --scatter
			0, --grenade
			0, --explosion
			0, --rail
		}
		wepTextFlags[0] = 0 --infinity

		if (MM.GetWepCfgFlags(p.mm.role) & WEPCFG_REDONLY)

			--REDONLY|DISABLERED (Knife-only)
			if (MM.GetWepCfgFlags(p.mm.role) & WEPCFG_DISABLERED)
				if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
				v.draw((MM.hud.game.pos.ringWepOnly.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-2][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER) --Knife icon

			--REDONLY
			else
				if (p.powers[pw_infinityring])
					if (p.powers[pw_infinityring] >= MM.weapons[0][5]) then wepTextFlags[0] = wepTextFlags[0] | V_YELLOWMAP end
					v.draw((MM.hud.game.pos.ringWepOnly.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[0][1]], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Infinite Ring icon
					v.drawString(MM.hud.game.pos.ringWepOnly.x + 24, (MM.hud.game.pos.ringWep.y + 8), p.powers[pw_infinityring], wepTextFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER, "thin-right") --Infinite Ring ammo counter
				else
					if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
					v.draw((MM.hud.game.pos.ringWepOnly.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-1][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER) --Red Ring icon
				end
			end

			--Selector
			v.draw((MM.hud.game.pos.ringWepOnly.x + 6), (MM.hud.game.pos.ringWep.y - 2 - (del / 2)), MM.graphics["CURWEAP"], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag())

		--Draw all weapons
		else
			--DISABLERED
			if (MM.GetWepCfgFlags(p.mm.role) & WEPCFG_DISABLERED)
				--Knife weapon
				if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
				v.draw((MM.hud.game.pos.ringWep.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-2][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER) --Knife icon
			
			--Draw Red/Infinite rings like normal
			else
				--Red/Infinity rings
				if (p.powers[pw_infinityring])
					if (p.powers[pw_infinityring] >= MM.weapons[0][5]) then wepTextFlags[0] = wepTextFlags[0] | V_YELLOWMAP end
					v.draw((MM.hud.game.pos.ringWep.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[0][1]], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Infinite Ring icon
					v.drawString((MM.hud.game.pos.ringWep.x + 24), (MM.hud.game.pos.ringWep.y + 8), p.powers[pw_infinityring], wepTextFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag(), "thin-right") --Infinite Ring ammo counter
				else
					if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
					v.draw((MM.hud.game.pos.ringWep.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-1][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Red Ring icon
				end
			end

			--Draw other weapons
			for weapon = 1, 6 do
				if (p.powers[weapon + 14])
					if (p.powers[weapon + 14] >= MM.weapons[weapon][5]) then wepTextFlags[weapon] = wepTextFlags[weapon] | V_YELLOWMAP end

					if (p.ringweapons & wep2rw(weapon))
					else
						wepPatchFlags[weapon] = V_80TRANS
						wepTextFlags[weapon] = wepTextFlags[weapon] | V_TRANSLUCENT
					end
					v.draw((MM.hud.game.pos.ringWep.x + 8 + weapon*20), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[weapon][1]], wepPatchFlags[weapon]|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Ring weapon icon
					if (MM.weapons[weapon][2] == MT_THROWNAUTOMATIC) and (MM.weapons[weapon][6][2] > 0)
						--Draw overheat indicator
						v.drawFill((MM.hud.game.pos.ringWep.x + 8 + weapon*20), (MM.hud.game.pos.ringWep.y), 16, 16, 35|max(10 - MM.weapons[weapon][6][2], 0)*FU|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag())
					end
					v.drawString((MM.hud.game.pos.ringWep.x + 24 + weapon*20), (MM.hud.game.pos.ringWep.y + 8), p.powers[weapon + 14], wepTextFlags[weapon]|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag(), "thin-right") --Ammo counter
				elseif (p.ringweapons & wep2rw(weapon))
					v.draw((MM.hud.game.pos.ringWep.x + 8 + weapon*20), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[weapon][1]], V_TRANSLUCENT|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag())
				end
			end
			if ((p.ammoremovaltimer) and ((leveltime % 7) < 4))
				v.drawString((MM.hud.game.pos.ringWep.x + 8 + (p.ammoremovalweapon*20)), (MM.hud.game.pos.ringWep.y), "-"..p.ammoremoval, V_REDMAP|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Ammo removal penalty
			end

			--Selector
			v.draw((MM.hud.game.pos.ringWep.x + 6 + p.currentweapon*20), (MM.hud.game.pos.ringWep.y - 2 - (del / 2)), MM.graphics["CURWEAP"], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag())
		end
	
	--Civilian weapon logic
	elseif (p.mm.role == ROLE_CIVILIAN) and ((((p.skin == 1) or (p.skin == 3)) and (p.rings > 49)) or (((p.skin != 1) and (p.skin != 3)) and (p.rings > 99))) and (wepcfgCVARs[ROLE_CIVILIAN].value)
		--Knife-only
		if (wepcfgCVARs[ROLE_CIVILIAN].value == 2)
			v.draw((MM.hud.game.pos.ringWepOnly.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-2][1]], V_SNAPTOBOTTOM) --Knife icon
		else
			v.draw((MM.hud.game.pos.ringWepOnly.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-1][1]], V_SNAPTOBOTTOM) --Red Ring icon
		end

		--Ammo counter
		if (p.skin == 1) or (p.skin == 3) --Player is Tails or Amy
			v.drawString((MM.hud.game.pos.ringWepOnly.x + 24), (MM.hud.game.pos.ringWep.y + 8), (p.rings / 50), V_SNAPTOBOTTOM|v.localTransFlag(), "thin-right")
		else
			v.drawString((MM.hud.game.pos.ringWepOnly.x + 24), (MM.hud.game.pos.ringWep.y + 8), (p.rings / 100), V_SNAPTOBOTTOM|v.localTransFlag(), "thin-right")
		end
		
		--Selector
		v.draw((MM.hud.game.pos.ringWepOnly.x + 6), (MM.hud.game.pos.ringWep.y - 2 - (del / 2)), MM.graphics["CURWEAP"], V_SNAPTOBOTTOM|v.localTransFlag())
	end

	--Sheriff Emerald Radar for Innocents
	if (p.mm.role == ROLE_CIVILIAN) and (#MM.shremds) and (MM.shremdDist) and (not SOC_IsTrue(mapheaderinfo[gamemap].mm_disableemeraldradar))
		v.drawScaled(9961472, 8912896, 32768, MM.graphics["IDEYAR"..V_GetSHREMDiconID(fixint(MM.shremdDist))], V_SNAPTOBOTTOM|v.localTransFlag()) --152*FU, 136*FU, FU/2
	end

	--Are you alone?
	if (MM.PlayerCount() == 1)
		HIDEO.DrawStrUnicode_Center(v, 160, 136, HIDEO.WordWrap(0, canvasWidth, 0, MM.hud.canvas.font.scale, MM.GetText("HUD_ALONE")), v.localTransFlag(), MM.hud.canvas.font.scale)
	end

	--suggest a minigame
	if (MM.PlayerCount() == 1) or ((p.spectator) and (not MM.minigame) and (not p.mm.minigame) and (not MM.twopgame))
		HIDEO.DrawStrUnicode_Right(v, 320, 0, MM.GetText("HUD_MINIGAME", "BORED"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
		HIDEO.DrawStrUnicode_Right(v, 320, MM.hud.canvas.font.small.charheight, MM.GetText("HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
		HIDEO.DrawStrUnicode_Right(v, 320, 2*MM.hud.canvas.font.small.charheight, MM.GetText("HUD_MINIGAME", "START"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
	end

	--"Showdown duel!"
	if ((not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.twopgame) and (MM.PlayerCount() > 1))
		HIDEO.DrawStrUnicode_Center(v, 160, (MM.hud.canvas.height - MM.hud.canvas.font.charheight), "^8"..MM.GetText("HUD_SHOWDOWN"), V_SNAPTOBOTTOM, MM.hud.canvas.font.scale)
	end

	--Sneaking
	if ((p.mm.sneak) and valid(p.mo) and P_IsObjectOnGround(p.mo))
		HIDEO.DrawStrUnicode(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y + 24), MM.GetText("HUD_SNEAKING"), V_SNAPTOTOP|V_SNAPTOLEFT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
	end
	
	--HUD frontend for the flash/spark effects
	if (MM.hud.game.flash.translucency) then v.fadeScreen(MM.hud.game.flash.color, MM.hud.game.flash.translucency) end
end, "game")

--
-- SCORES TAB
--
hud.add(function(v)
	if (gametype != GT_LTMMURDERMYSTERY)
		hud.enable("rankings")
		return
	end

	if (not MM.hud.scores.active) then return end

	hud.disable("rankings")

	HIDEO.DrawStrUnicode_Center(v, 160, 8, "^7"..MM.GetText("HUD_MM"), v.localTransFlag(), MM.hud.canvas.font.scale)

	--Player list
	if ((cv_cryptic.value) or (MM.PlayerCount() == 1))
		HIDEO.DrawStrUnicode(v, 16, 24, HIDEO.WordWrap(16, 304, 0, MM.hud.canvas.font.scale, MM.GetText("HUD_SCORESTAB")), v.localTransFlag(), MM.hud.canvas.font.scale)
	else
		--Draw the player list
		--Suspects/Victims label
		if (consoleplayer.mm.role and (consoleplayer.mm.role == ROLE_MURDERER))
			HIDEO.DrawStrUnicode(v, MM.hud.scores.pos.playerInfo.x, (MM.hud.scores.pos.playerInfo.y - 4), "^2"..MM.GetText("HUD_VICTIMS")..":", v.localTransFlag(), MM.hud.canvas.font.scale)
		else
			HIDEO.DrawStrUnicode(v, MM.hud.scores.pos.playerInfo.x, (MM.hud.scores.pos.playerInfo.y - 4), "^2"..MM.GetText("HUD_SUSPECTS")..":", v.localTransFlag(), MM.hud.canvas.font.scale)
		end

		--The list itself
		local shift = {x=0, y=0}
		local plrs = {}
		for p in players.iterate do
			if ((not p.spectator) and (not MM.AreTeammates(consoleplayer, p)) and (consoleplayer != p) and (not p.quittime)) then table.insert(plrs, p) end
		end
		for i = 1, #plrs do
			if (MM.PlayerCount() <= 20) --Regular ("Double column") mode
				if (i > 10) then shift = {x=140, y=80} end
				HIDEO.DrawStrUnicode(v, (MM.hud.scores.pos.playerInfo.x + shift.x), (MM.hud.scores.pos.playerInfo.y - shift.y + (i * MM.hud.canvas.font.charheight)), "\xC2B7 "..string.sub(plrs[i].name, 1, 15), v.localTransFlag(), MM.hud.canvas.font.scale)
			else --Compact ("Tripple column") mode
				if (i > 11) then shift = {x=94, y=88}
				elseif (i > 22) then shift = {x=188, y=88} end
				HIDEO.DrawStrUnicode(v, (MM.hud.scores.pos.playerInfo.x + shift.x), (MM.hud.scores.pos.playerInfo.y - shift.y + (i * MM.hud.canvas.font.charheight)), "\xC2B7 "..string.sub(plrs[i].name, 1, 16), v.localTransFlag(), MM.hud.canvas.font.scale)
			end
		end

		--Teammates tracker
		if (MM.TeammatesCount(consoleplayer))
			local teammateNo = 0
			HIDEO.DrawStrUnicode(v, MM.hud.scores.pos.teammateInfo.x, (MM.hud.scores.pos.teammateInfo.y - 12), "^A"..MM.GetText("HUD_TEAMMATES")..":", v.localTransFlag(), MM.hud.canvas.font.scale)
			for p in players.iterate
				if (MM.AreTeammates(consoleplayer, p) and (consoleplayer != p))
					--character icon
					v.drawScaled((MM.hud.scores.pos.teammateInfo.x + (136 * (teammateNo / 2)))*FU, (MM.hud.scores.pos.teammateInfo.y + ((teammateNo % 2) * 16))*FU, 32768, v.getSprite2Patch(p.skin, SPR2_XTRA), v.localTransFlag(), v.getColormap(p.skin, p.skincolor)) --FU/2
					--player name (colored as role)
					v.drawString((MM.hud.scores.pos.teammateInfo.x + 18 + (136 * (teammateNo / 2))), (MM.hud.scores.pos.teammateInfo.y + ((teammateNo % 2) * 16)), MM.RoleColor[p.mm.role]..p.name, V_ALLOWLOWERCASE|v.localTransFlag())
					--icon of the currently held weapon
					v.drawScaled((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + (136 * (teammateNo / 2)))*FU, (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo % 2) * 16))*FU, 32768, MM.graphics[MM.weapons[p.currentweapon][1]], v.localTransFlag()) --FU/2
					--amount of currently held weapon ammo
					v.drawString((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + 18 + (136 * (teammateNo / 2))), (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo % 2) * 16)), p.powers[pw_infinityring + p.currentweapon], v.localTransFlag(), "thin")
					--red ring icon
					v.drawScaled((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + MM.hud.scores.pos.teammateInfoOffset2.x + (136 * (teammateNo / 2)))*FU, (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo % 2) * 16))*FU, 32768, MM.graphics[MM.weapons[-1][1]], v.localTransFlag()) --FU/2
					--amount of [red] rings
					v.drawString((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + MM.hud.scores.pos.teammateInfoOffset2.x + 18 + (136 * (teammateNo / 2))), (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo % 2) * 16)), p.rings, v.localTransFlag(), "thin")
					teammateNo = $ + 1
				end
			end
		end
	end

	v.drawFill(0, 172, 320, 2, v.localTransFlag()) --horizontal line

	--Roles counter
	if (not cv_cryptic.value)
		--Murderer
		HIDEO.DrawStrUnicode(v, 16, (MM.hud.canvas.height - 3*MM.hud.canvas.font.charheight), MM.RoleColorHUD[ROLE_MURDERER]..MM.GetText("HUD_ROLESALIVE", ROLE_MURDERER)..": "..MM.PlayerCount(ROLE_MURDERER), v.localTransFlag(), MM.hud.canvas.font.scale)
		--Sheriff (and Hero)
		if (MM.PlayerCount(ROLE_HERO))
			HIDEO.DrawStrUnicode(v, 16, (MM.hud.canvas.height - 2*MM.hud.canvas.font.charheight), (MM.RoleColorHUD[ROLE_SHERIFF]..MM.GetText("HUD_ROLESALIVE", ROLE_SHERIFF)..": "..MM.PlayerCount(ROLE_SHERIFF)..MM.RoleColorHUD[ROLE_HERO].." + "..MM.PlayerCount(ROLE_HERO)), v.localTransFlag(), MM.hud.canvas.font.scale)
		else
			HIDEO.DrawStrUnicode(v, 16, (MM.hud.canvas.height - 2*MM.hud.canvas.font.charheight), (MM.RoleColorHUD[ROLE_SHERIFF]..MM.GetText("HUD_ROLESALIVE", ROLE_SHERIFF)..": "..MM.PlayerCount(ROLE_SHERIFF)), v.localTransFlag(), MM.hud.canvas.font.scale)
		end
		--Civilian
		if (MM.PlayerCount(ROLE_CIVILIAN)) HIDEO.DrawStrUnicode(v, 16, (MM.hud.canvas.height - MM.hud.canvas.font.charheight), (MM.RoleColorHUD[ROLE_CIVILIAN]..MM.GetText("HUD_ROLESALIVE", ROLE_CIVILIAN)..": "..MM.PlayerCount(ROLE_CIVILIAN)), v.localTransFlag(), MM.hud.canvas.font.scale) end

		--"Sheriff's Emerald is available!"
		if ((#MM.shremds) and (leveltime % 2))
			v.drawScaled(262144, 12058440, 32768, MM.graphics["CHAOS3"], v.localTransFlag()) --4*FU, 184*FU, FU/2
		end
	end

	--Online
	v.drawString(160, 176, "ONLINE: "..MM.PlayerCount(), v.localTransFlag())

	--Role target
	if (consoleplayer.mm.role)
		HIDEO.DrawStrUnicode(v, 160, (176 + MM.hud.canvas.font.charheight), MM.RoleColorHUD[consoleplayer.mm.role]..HIDEO.WordWrap(160, 304, 0, MM.hud.canvas.font.small.scale, MM.GetText("HUD_ROLETARGET", consoleplayer.mm.role)), v.localTransFlag(), MM.hud.canvas.font.small.scale)
	end

	--HUD frontend for the flash/spark effects
	if (MM.hud.game.flash.translucency) then v.fadeScreen(MM.hud.game.flash.color, MM.hud.game.flash.translucency) end

	-- Prerelease/Debug
	if (MM.debug) v.drawString(160, 160, "\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOBOTTOM|v.localTransFlag(), "center") end
end, "scores")

--
-- Custom intermission HUD
--
hud.add(function(v)
	if (gametype != GT_LTMMURDERMYSTERY)
		hud.enable("intermissiontally")
		return
	end

	--Do not render the Intermission when MapVote is working or when other script specifically disables it
	if ((MapVote) or (MapVoteNet and (MapVoteNet.state > 0)) or (not MM.hud.intermission.active)) return end

	--Background
	local BGpatch = MM.graphics["INTRMBG"..MM.winner]
	for x = 0, v.width(), BGpatch.width * v.dupx() do
		for y = 0, v.height(), BGpatch.height * v.dupy() do
			v.draw(x, y, BGpatch, V_NOSCALESTART)
		end
	end

	hud.disable("intermissiontally")

	local plrs = {}
	local shift = {x=0, y=0}

	--Map name drawer
	if (mapheaderinfo[gamemap].actnum == 0)
		v.drawString(160, 16, "* "..mapheaderinfo[gamemap].lvlttl.." *", 0, "center")
	else
		v.drawString(160, 16, "* "..mapheaderinfo[gamemap].lvlttl.." "..mapheaderinfo[gamemap].actnum.." *", 0, "center")
	end

	v.drawFill(0, 40, 320, 2, 0) --horizontal line

	--player list
	for p in players.iterate do table.insert(plrs, p) end
	--sort players by kills count
	table.sort(plrs, function(a, b)
		return a.mm.kills > b.mm.kills
	end)

	-- Column names

	--vertical line and everything common for >8 player screen
	if (MM.PlayerCount() > 8)
		v.drawFill(160, 40, 2, 144, 0)
		v.drawString(MM.hud.intermission.pos.kills2.x, MM.hud.intermission.pos.players.y, "\x82KILLS", 0, "thin")
		v.drawString((MM.hud.intermission.pos.kills2.x + 160), MM.hud.intermission.pos.players.y, "\x82KILLS", 0, "thin")
	end
	--everything else which is uncommon
	if (MM.PlayerCount() <= 8)
		v.drawString(MM.hud.intermission.pos.name.x, MM.hud.intermission.pos.players.y, "\x82NAME", 0)
		v.drawString(MM.hud.intermission.pos.kills.x, MM.hud.intermission.pos.players.y, "\x82KILLS", 0)
	elseif (MM.PlayerCount() > 8) and (MM.PlayerCount() <= 16)
		--players 1-8
		v.drawString(MM.hud.intermission.pos.name.x, MM.hud.intermission.pos.players.y, "\x82NAME", 0, "thin")
		--players 9-16
		v.drawString((MM.hud.intermission.pos.name.x + 160), MM.hud.intermission.pos.players.y, "\x82NAME", 0, "thin")
	else
		--players 1-16
		v.drawString(MM.hud.intermission.pos.name2.x, MM.hud.intermission.pos.players.y, "\x82NAME", 0, "thin")
		--players 17-32
		v.drawString((MM.hud.intermission.pos.name2.x + 160), MM.hud.intermission.pos.players.y, "\x82NAME", 0, "thin")
	end

	-- Player stats

	for i = 1, #plrs
		if (MM.PlayerCount() <= 8) --Regular mode
			--Character icon
			v.drawScaled((MM.hud.intermission.pos.name.x - 20)*FU, ((MM.hud.intermission.pos.players.y - 4) + (i * 16))*FU, 32768, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/2
			--Player name (colored by role)
			if ((plrs[i].mm.role) and (plrs[i].mm.role > ROLE_NONE))
				v.drawString((MM.hud.intermission.pos.name.x), (MM.hud.intermission.pos.players.y + (i * 16)), MM.RoleColor[plrs[i].mm.role]..plrs[i].name, V_ALLOWLOWERCASE)
			else
				--DEAD
				v.drawString((MM.hud.intermission.pos.name.x), (MM.hud.intermission.pos.players.y + (i * 16)), MM.RoleColor[5]..plrs[i].name, V_ALLOWLOWERCASE)
			end
			--Kills counter
			v.drawString((MM.hud.intermission.pos.kills.x), (MM.hud.intermission.pos.players.y + (i * 16)), plrs[i].mm.kills)
		elseif ((MM.PlayerCount() > 8) and (MM.PlayerCount() <= 16)) --"Double column" mode
			if (i > 8) shift = {x=160, y=128} end --players 9-16 are drawn on the second column

			--Character icon
			v.drawScaled((MM.hud.intermission.pos.name.x + shift.x - 20)*FU, ((MM.hud.intermission.pos.players.y - 4) + (i * 16) - shift.y)*FU, 32768, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/2
			--Player name (colored by role)
			if ((plrs[i].mm.role) and (plrs[i].mm.role > ROLE_NONE))
				v.drawString((MM.hud.intermission.pos.name.x + shift.x), (MM.hud.intermission.pos.players.y + (i * 16) - shift.y), MM.RoleColor[plrs[i].mm.role]..string.sub(plrs[i].name, 1, 13), V_ALLOWLOWERCASE)
			else
				--DEAD
				v.drawString((MM.hud.intermission.pos.name.x + shift.x), (MM.hud.intermission.pos.players.y + (i * 16) - shift.y), MM.RoleColor[5]..string.sub(plrs[i].name, 1, 13), V_ALLOWLOWERCASE)
			end
			--Kills counter
			v.drawString((MM.hud.intermission.pos.kills2.x + shift.x), (MM.hud.intermission.pos.players.y + (i * 16) - shift.y), plrs[i].mm.kills)
		else --"Double column compact" mode
			if (i > 16) then shift = {x=160, y=128} end --players 17-32 are drawn on the second column

			--back to the rows
			--Character icon
			v.drawScaled((MM.hud.intermission.pos.name2.x + shift.x - 10)*FU, ((MM.hud.intermission.pos.players2.y - 1) + (i * 8) - shift.y)*FU, 16384, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/4
			--Player name (colored by role)
			if ((plrs[i].mm.role) and (plrs[i].mm.role > ROLE_NONE))
				v.drawString((MM.hud.intermission.pos.name2.x + shift.x), (MM.hud.intermission.pos.players2.y + (i * 8) - shift.y), MM.RoleColor[plrs[i].mm.role]..plrs[i].name, V_ALLOWLOWERCASE, "thin")
			else
				--DEAD
				v.drawString((MM.hud.intermission.pos.name2.x + shift.x), (MM.hud.intermission.pos.players2.y + (i * 8) - shift.y), MM.RoleColor[5]..plrs[i].name, V_ALLOWLOWERCASE, "thin")
			end
			--Kills counter
			v.drawString((MM.hud.intermission.pos.kills2.x + shift.x), (MM.hud.intermission.pos.players2.y + (i * 8) - shift.y), plrs[i].mm.kills, 0, "thin")
		end
	end

	-- Winner text
	if (MM.winner == 0) --tie
		HIDEO.DrawStrUnicode_Center(v, 160, 176, MM.GetText("HUD_WIN", 1))
	else
		HIDEO.DrawStrUnicode_Center(v, 160, 176, MM.GetText("HUD_WINNERS").." "..MM.GetText("HUD_WIN", (MM.winner + 1)))
	end

	--Prerelease/Debug
	if (MM.debug) v.drawString(160, 160, "\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOBOTTOM, "center") end
end, "intermission")
