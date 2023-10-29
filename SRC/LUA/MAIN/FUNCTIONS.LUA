-- FUNCTIONS.LUA
-- Code by LeonardoTheMutant, Jisk and Tedvin11
--
-- Function declarations

--
--CONSTANTS
--
local mmtxt=MM.text
local dthsfx={sfx_mmdth1, sfx_mmdth2, sfx_mmdth3, sfx_nggyu, sfx_emj08, sfx_emj14} --SFXs that are used as Death Sounds

--
--GAME.LUA
--

-- how many players with same role should exist?
rawset(_G, "MM_GetRoleMultiplier", function()
	if (PlayerCount()<7) return 1
	elseif (PlayerCount()>=7) and (PlayerCount()<=10) return 2
	elseif (PlayerCount()>=11) and (PlayerCount()<=14) return 3
	elseif (PlayerCount()>14) return 4 end --EVEN THIS NUMBER WAS REACHED!!!
end)

-- RoleAssigner v5
-- Give roles at the beginning of each new round
-- F to LeoTM - he got insane while coding this 256 times
rawset(_G, "MM_AssignRoles", function()
	if (gametype!=GT_MURDERMYSTERY) or (PlayerCount()<2) return
	elseif (gametype==GT_MURDERMYSTERY) and (splitscreen)
		COM_BufInsertText(server, "MAP JADE VALLEY -GAMETYPE MATCH")
		print("\x85Hold on!\x80\nMurder Mystery is not designed for splitscreen mode! Your game switched to MATCH becase it's as same as playing 1v1 in MM.\nSo don't try to load Murder Mystery in splitscreen again. It will have no sense.")
		return
	end

	local plrs={}
	for p in players.iterate --prepare players and get their player nodes
		p.role=ROLE_NONE
		table.insert(plrs, #p)
	end
    for r = ROLE_MURDERER, ROLE_SHERIFF --assign Murderers and Sheriffs
        for i=1, MM_GetRoleMultiplier()
            local randPlr=P_RandomKey(#plrs)+1 --select random player
            players[plrs[randPlr]].role=r --assign the role to that player
            table.remove(plrs, randPlr) --and finally forget about it
        end
    end
	--tell each player its role personally
	for p in players.iterate
		if (p.role==ROLE_NONE) p.role=ROLE_INNOCENT end --we previously didn't make Innos so make them now
		chatprintf(p, mmtxt[p.mmlang]["ROLE_GET"][p.role])
		p.roleflicker=105 --timer for role name flickering on HUD
	end
	if (MM.devbuild)
		print("\x82".."MM_AssignRoles() results:")
		for p in players.iterate print(p.name..": "..p.role) end
	end
end)

--Function to display global messages in chat
--Works as regular chatprint but sends the global message personally to everyone in their (player.mmlang) language
--var argument is mostly used as an INTEGER for win reasons or player role that left. For some messages it's STRING
rawset(_G, "MM_ChatprintGlobal", function(msg, var)
	for p in players.iterate
		if ((msg=="MURD_KILLED") or (msg=="SHERI_KILLED") or (msg=="HERO_KILLED")) chatprintf(p, mmtxt[p.mmlang][msg][1].." "..var.." "..mmtxt[p.mmlang][msg][2])
		elseif (msg=="SHERI_KILLED_NODROP") chatprintf(p, mmtxt[p.mmlang]["SHERI_KILLED"][1].." "..var.." "..mmtxt[p.mmlang]["SHERI_KILLED"][3])
		elseif (msg=="LAST_LEFT") or (msg=="ONE_LEFT") or (msg=="REPLACE_LEFT")
			if (var!=ROLE_HERO) chatprintf(p, mmtxt[p.mmlang][msg][var]) --for Murd and Sheri
			else chatprintf(p, mmtxt[p.mmlang][msg][3]) end --for Hero
		elseif (msg=="WIN") chatprintf(p, mmtxt[p.mmlang]["ENDROUND"][var])
		elseif (msg=="INNO_HURT") chatprintf(p, mmtxt[p.mmlang]["INNO_HURT"][var])
		elseif msg
			if (mmtxt[p.mmlang][msg]) chatprintf(p, mmtxt[p.mmlang][msg])
			else chatprintf(p, msg.."; "..var) end --no text exists in the database
		end
	end
end)

rawset(_G, "MM_KillPlayer", function(p, k) --player, killer (both MOBJ_T)
	if (not p) or (not p.player) error("MM_KillPlayer() argument #1: player's mobj_t expected") end
	local plr = p.player
	plr.spectator=true
	plr.role=ROLE_NONE
	plr.flashscrn=1
	if (k) and (k.player)
		plr.killedby=k.player.name
		k.player.kills=$+1
	else plr.killedby="your stupidity" end

	local body = P_SpawnMobjFromMobj(p,0,0,0,MT_DEADPLR)
	if (p.skin=="tails") body.state=S_TMMDEAD
	elseif (p.skin=="knuckles") body.state=S_KMMDEAD
	elseif (p.skin=="amy") body.state=S_AMMDEAD
	elseif (p.skin=="fang") body.state=S_FMMDEAD
	elseif (p.skin=="metalsonic") body.state=S_MMMDEAD
	else body.state=S_SMMDEAD end --Sonic, also fallback for custom chars (I really should ban them)
	body.color=p.color

	S_StartSound(p, dthsfx[P_RandomKey(#dthsfx)+1], plr) --play random death sound personally
end)

--Function to end the round, arguments here:
--w is the role that won the game, the possible values are 0-None (Tie), 1-Murderer, 2-Civilians (Sheriff, Innocent, Hero)
--endtext is the text to display in the chat
--reason is used differently for each message but usualy it is a win reason
rawset(_G, "MM_EndRound", function(w, endtext, reason)
	MM.winner=w
	if (endtext=="WIN") MM.winreason=reason end
	G_ExitLevel()
	if (endtext) MM_ChatprintGlobal(endtext, reason) end
	for p in players.iterate p.spectator=false end
	if isdedicatedserver --console log for dedicated host
		if (endtext=="WIN") CONS_Printf(server, "- "..mmtxt["EN"]["ENDROUND"][reason])
		else CONS_Printf(server, "- "..mmtxt["EN"][endtext][reason]) end
	end
end)

rawset(_G, "MM_CheckPlayers", function()
	if (PlayerCount(ROLE_MURDERER)!=0) and (PlayerCount(ROLE_SHERIFF)==0) and (PlayerCount(ROLE_HERO)==0) and (PlayerCount(ROLE_INNOCENT)==0) MM_EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
	elseif (PlayerCount(ROLE_MURDERER)!=0) and ((PlayerCount(ROLE_SHERIFF)!=0) or (PlayerCount(ROLE_HERO)!=0)) and (PlayerCount(ROLE_INNOCENT)==0) S_ChangeMusic("SHWDWN", true) end
end)

rawset(_G, "MM_SetRandomInnoAs", function(role)
	local plrs={}
	for plr in players.iterate
		if (not plr.spectator) and (plr.role==ROLE_INNOCENT) table.insert(plrs, #plr) end
	end
    local p = players[plrs[P_RandomKey(#plrs)+1]]
	p.role=role
	p.roleflicker=70
	if (role!=ROLE_HERO) chatprintf(p, MM.text[p.mmlang]["NEWROLE_GET"][p.role]) --for Murd/Sheriff
	else chatprintf(p, MM.text[p.mmlang]["NEWROLE_GET"][3]) end --for Hero
	return
end)

--
--HUD.LUA
--
rawset(_G, "V_DrawStrRelCentered", function(v,x,y,str,flags,font)
	v.drawString(x-v.stringWidth(str,flags,font)>>1, y, str, flags, font)
end)
rawset(_G, "V_DrawStrCentered", function(v,y,str,flags,font)
	V_DrawStrRelCentered(v,160,y,str,flags,font)
end)
rawset(_G, "V_DrawStrRight", function(v,y,str,flags,font)
	v.drawString(320-v.stringWidth(str,flags,font), y, str, flags, font)
end)

--very cool function, you'll like it when I'll finish the whole thing
rawset(_G, "V_DrawStrASCII", function(v,x,y,lang,str,flags,fontsize)
	if (not v) error("V_DrawStrASCII() argument #1: drawer variable expected")
	elseif (not str) error("V_DrawStrASCII() argument #5: string expected")
	elseif (not fontsize) fontsize=FU end

	local x = x or 0
	local y = y or 0
	local flg = flags or 0

	--set the characer encoding for the given language
	local charset
	if (not lang) or (lang=="EN") charset="STCFN"
	elseif (lang=="PL") charset="1250C"
	elseif (lang=="RU" or lang=="UA") charset="1251C"
	elseif (lang=="GR") charset="1253C" end

	--set the width and the scale of symbols
	local width=fontsize>>13 --fontsize/8192
	local scale=fontsize

	--set the space width
	local spacesize=4
	/* I hope to fix all of this
	if (flg&V_MONOSPACE)
		print("Monospace")
		spacesize=8
	elseif (flg&V_6WIDTHSPACE)
		print("6 width space")
		spacesize=6
	elseif (flg&V_OLDSPACING)
		print("Oldspacing")
		spacesize=4
	end
	*/

	local color=v.getStringColormap(0) --default to white color

	local X0 = x-width --real X position to start drawing from
	local symShift = 0
	local spaceShift = 0
	
	--draw the string
	for i=1,#str
		local chr=string.byte(str:sub(i,i)) --numeric value of the single character
		
		local strchar --the string version of the char number
		if (chr<100) strchar="0"..chr --make the number to be 3 digit
		else strchar=chr end

		local symX=(i*width) --character's X

		if (chr<16) --characters from 0x00 to 0x0f set the color
			color=v.getStringColormap(chr*4096) --set color
			symShift=$+1 --that symbol was never supposed to be drawen
		end

		if (chr==32) spaceShift=$+1 end --space has a different character width

		--print the character
		if (chr>=128) --extended ASCII
			if (v.patchExists(charset..strchar))
				v.drawScaled(FU*(X0+symX-symShift*width-spaceShift*spacesize), FU*y, scale, v.cachePatch(charset..strchar), flg, color)
			else --unknown symbol, print "?"
				v.drawScaled(FU*(X0+symX-symShift*width-spaceShift*spacesize), FU*y, scale, v.cachePatch("STCFN063"), flg, color)
			end
		elseif (chr>=16) and (chr<128) --standart ASCII
			if (v.patchExists("STCFN"..strchar))
				v.drawScaled(FU*(X0+symX-symShift*width-spaceShift*spacesize), FU*y, scale, v.cachePatch("STCFN"..strchar), flg, color)
			else --unknown symbol, print "?" unless it's a space symbol
				if (chr!=32) v.drawScaled(FU*((x-width)+(i*width)), FU*y, scale, v.cachePatch("STCFN063"), flg, color) end
			end 
		end
	end
end)
rawset(_G, "V_StrWidthASCII", function(str,flags,fontsize)
	if (not str) or (str=="") return 0 end
	if (not fontsize) fontsize=FU end
	local flg = flags or 0
	local strlen=0
	local width=fontsize>>13 --fontsize/8192
	local spaceShift=0
	local spacesize=4
	/* currently doesn't work
	if (flg&V_OLDSPACING) spacesize=4
	elseif (flg&V_6WIDTHSPACE) spacesize=6
	elseif (flg&V_MONOSPACE) spacesize=8 end
	*/
	for i=1,#str
		local char=string.byte(str:sub(i,i)) --character number
		if (char>16)
			if (char==32) spaceShift=$+1 end
			strlen=$+1
		end
	end
	return ((strlen*width) - (spaceShift*spacesize))
end)
rawset(_G, "wep2rw", function(wep) --convert WEP_* constant to RW_* constant
	if (wep==1) return 1
	elseif (wep==2) return 2
	elseif (wep==3) return 4
	elseif (wep==4) return 8
	elseif (wep==5) return 16
	elseif (wep==6) return 32
	end
end)

--
--CHAT.LUA
--
rawset(_G, "MM_ChatPlaySFX", function(sfx)
	for p in players.iterate S_StartSound(p.mo, sfx, p) end
end)

--
--CCMD.LUA
--
rawset(_G, "MM_PrintContents", function(p,l)
	CONS_Printf(p,"")
	for i, str in pairs(MM.text[l]["MMHELP_CMD"]["CONTENTS"]) CONS_Printf(p, str) end
end)

--
--WEAPONS.LUA
--

-- A port of P_DrainWeaponAmmo() from C source code with MM modifications
rawset(_G, "P_DrainWeaponAmmo", function(p, weapon)
	p.powers[weapon]=$-1

	if (p.rings < 1)
		p.ammoremovalweapon = p.currentweapon;
		p.ammoremovaltimer  = ammoremovaltics;

		if (p.powers[weapon] > 0) -- can't take a ring that doesn't exist
			p.powers[weapon]=$-1
			p.ammoremoval = 2
		else
			p.ammoremoval = 1
		end
	else
		P_GivePlayerRings(p, -1)
	end
end)

-- A port of P_SetWeaponDelay() from C source code
rawset(_G, "P_SetWeaponDelay", function(p, delay)
	p.mmweapondelay = delay;

	if (p.skin == 2) -- Knuckles
		-- Multiply before dividing.
		-- Loss of precision can make a surprisingly large difference.
		p.mmweapondelay = ($*2)/3
	end
end)

--
--TTT.LUA
--
rawset(_G, "TTT_HudPos", function(value)
	if (value==1) return {108, 48}
	elseif (value==2) return {144, 48}
	elseif (value==3) return {180, 48}
	elseif (value==4) return {108, 84}
	elseif (value==5) return {144, 84}
	elseif (value==6) return {180, 84}
	elseif (value==7) return {108, 120}
	elseif (value==8) return {144, 120}
	elseif (value==9) return {180, 120}
	end
end)
rawset(_G, "TTT_ResetBoard", function()
	MM.ttt.board={0,0,0,0,0,0,0,0,0}
end)

--
--GLOBAL
--
rawset(_G, "PlayerCount", function(role)
	local plrc = 0
	if (role) for p in players.iterate if (p.role==role) plrc=$+1 end end
	else for p in players.iterate plrc=$+1 end end
	return plrc
end)
rawset(_G, "PlayersAlive", function()
	local plrs=0
	for p in players.iterate if (not p.spectator) plrs=$+1 end end
	return plrs
end)
rawset(_G, "MM_Get2Players", function()
	if (PlayerCount()!=2) return false end
	local plrs={}
	for p in players.iterate
		plrs[#plrs+1]=p
		if (#plrs==2) break end
	end
	return plrs
end)