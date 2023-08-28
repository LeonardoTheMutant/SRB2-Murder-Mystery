-- GAME.LUA
-- Includes Interactions.lua, Roles.lua, SETUP.lua and DisableTeamSwitch.lua from 4.1-beta
-- Original base code by Tedvin11
-- Improved and developed further by LeonardoTheMutant
-- With additional help of Jesus.B
--
-- The core spcript of Murder Mystery, controls each player Join/Quit, each Hit Detection and sets certain parameters for each player

-- Constants
local R_MURDERER=1
local R_SHERIFF=2
local R_INNO=3
local dthsfx={sfx__mmdth, sfx_mmdth2, sfx_emj08}
local MM=MurderMystery
local mmtext=MM.text
local afkCVAR=CV_FindVar("mmafkdelay")
	/*["FR"] = { -- French by Piksqu (adandoned)
		["RM_get"]="Tu est \x85l'assassin\x80!\x85 Elimine tous le monde.",
		["RS_get"]="Tu est le \x84Sheriff\x80!\x84 Elimine l'assassin. \x80Si tu tue un Inocent, tu perd.",
		["RI_get"]="Tu est un \x83Inocent\x80! Cache toi et aide le Sheriff a trouver le meurtrier",
		["NewMurderer"]="\x87La vie a fait de toi un\x85 Assassin\x87,\x85 ellimine tous le monde.",
		["NewSheriff"]="\x87L'univers a fait de toi le \x84Sheriff\x87! C'est ton devoir d'\x84 eliminer tous les Assassins\x87!",
		["HitMTeammate_atacker"]="\x85".."Dit donc, ce type est ton coequipier, ne le tue pas.",
		["HitMTeammate_victim"]="\x85Ton coequipier t'a blesser, ne te met pas en colere contre lui.",
		["MurdersWin"]="Tous les Sheriffs sont mort, \x85Les Assassin\x80 sont victorieux!",
		["MurdererKilled_str"]="\x85".."Assassin\x87 ",
		["MurdererKilled_end"]="\x80 a ete eliminer!",
		["HitSTeammate_atacker"]="\x84".."Dit donc, ce type est ton coequipier, ne le tue pas.",
		["HitSTeammate_victim"]="\x85Ton coequipier t'a blesser, ne te met pas en colere contre lui.",
		["SheriffsWin"]="Tous les assassins sont mort, Les\x84 Sheriffs\x80 et tous les \x83Innocents\x80 sont victorieux!",
		["SheriffKilled_str"]="\x84Sheriff\x87 ",
		["SheriffKilledNoDrop_end"]="\x80 a ete assassiner!",
		["SheriffKillInnoPM"]="Vous avez tuer un \x83Innocent\x80! \x87Vous n'etes plus \x84Sheriff\x87!",
		["SheriffKillInno"]="\x84Sheriff\x80 a tuer un Innocent! Un \x83Innocents\x80 doit finir le travail!",
		["MurdersWinNoInnos"]="Les\x85 Assassins\x80 gagnent car le \x84Sheriff\x80 a tuer le dernier \83Innocent\80!",
		["LastMurdLeft"]="Le dernier\x85 Assassin\x80 a quitter la partie!",
		["MurdLeftReplace"]="L'\x85".."Assassin\x80 a quitter la partie! Un \x83Innocent\x80 a pris sa place!",
		["OneMurdLeft"]="Un \x85Murderers\x80 a quitter la partie!",
		["LastSheriffLeft"]="Le dernier \x84Sheriff\x80 a quitter la partie!",
		["SheriffLeftReplace"]="Le \x84Sheriff\x80 a quitter la partie!  Un \x83Innocent\x80 a pris sa place!",
		["OneSheriffLeft"]="Un \x84Sheriffs\x80 a quitter la partie!",
		["TeamSwitch"]="You can't just become\x8F dead\x80 to spectate!"*/
		
addHook("TeamSwitch", function(p)
	if gametype==GT_MURDERMYSTERY
		if not p.spectator chatprintf(p, mmtext[p.mmlang]["TeamSwitch"]) end
		return false
	else return true end
end)
local function assignRole(rle, howMany)
	while howMany!=0
		for p in players.iterate
			if p.role==0 and not p.spectator and P_RandomKey(4)==0 and howMany!=0 then
				p.role=rle
				howMany=howMany-1
			end
		end
	end
end

-- RoleAssigner v4
-- Give roles at the beginning of each new round
-- F to LeoTM - he got insane while coding this 256 times
local function assignRoles()
	if gametype!=GT_MURDERMYSTERY or MM.playerCount()<2 return
	elseif gametype==GT_MURDERMYSTERY and splitscreen
		COM_BufInsertText(server, "MAP JADE VALLEY -GAMETYPE MATCH")
		print("\x85Hold on!\x80\nMurder Mystery (I'll call it MM from now on) is not designed for splitscreen mode! The game switched to the MATCH cuz it's as same as playing 1v1 in MM.\nDon't like it? Maybe you would like to type \x83MAP Abandoned Shelter -GAMETYPE MATCH -FORCE\x80 in this console to play MATCH inside MM maps?\nSorry but I won't make MM for splitscreen - it has no sence.\nSincerely, \x87LeonardoTheMutant")
		return
	end
	local roleMultiplier=0
	if MM.playerCount()<7 roleMultiplier=1
	elseif MM.playerCount()>=7 and MM.playerCount()<=10 roleMultiplier=2
	elseif MM.playerCount()>=11 and MM.playerCount()<=14 roleMultiplier=3
	elseif MM.playerCount()>14 roleMultiplier=4 end --EVEN THIS NUMBER WAS REACHED!!!
	assignRole(R_MURDERER, roleMultiplier)
	assignRole(R_SHERIFF, roleMultiplier)
	if MurderMystery.devbuild!=nil print("\x82".."assignRoles() results:\x80") end
	for p in players.iterate --print who they are to everyone personally
		if p.role==0 p.role = R_INNO end
		chatprintf(p, mmtext[p.mmlang]["R"..p.role.."_GET"])
		if MurderMystery.devbuild!=nil print(p.name..": "..tostring(p.role)) end
	end
end
addHook("MapChange", do
	if gametype!=GT_MURDERMYSTERY return end
	for p in players.iterate --prepare players & server for the new round
		p.role=0
		p.spectator=false
		p.kills=0
		p.killedby=nil
	end
end)
addHook("MapLoad", do
	if gametype!=GT_MURDERMYSTERY return end
	for p in players.iterate --prepare players & server for the new round (2nd try)
		p.role=0
		p.spectator=false
		p.kills=0
		p.killedby=nil
	end
	server.winner=0
	assignRoles()
end)
local function chatprintGlobal(msg, plr)
	if plr==nil plr=nil end -- genious
	for p in players.iterate
		if msg=="MurdererKilled" chatprintf(p, mmtext[p.mmlang]["MurdererKilled_str"]..plr.name..mmtext[p.mmlang]["MurdererKilled_end"])
		elseif msg=="SheriffKilled" chatprintf(p, mmtext[p.mmlang]["SheriffKilled_str"]..plr.name..mmtext[p.mmlang]["SheriffKilled_end"])
		elseif msg=="SheriffKilledNoDrop" chatprintf(p, mmtext[p.mmlang]["SheriffKilled_str"]..plr.name..mmtext[p.mmlang]["SheriffKilledNoDrop_end"])
		elseif msg!=nil chatprintf(p, mmtext[p.mmlang][msg]) end
	end
end
addHook("PlayerSpawn", function(p)
	if gametype!=GT_MURDERMYSTERY return end
	--Language apply logic
	if p.mmlang==nil p.mmlang="EN" end
	--	local f=io.openlocal("client/MM.DAT", 'r')
	--	if f
	--		local l=f:read()
	--		if mmtext[l]~=nil p.mmlang=l
	--		else p.mmlang="EN" end
	--	else p.mmlang='EN' end
	--	f:close()
	--end
	if p.kills==nil p.kills=0 end --how many players the player killed
	p.afk=0 --Anti-AFK init
	--Player num and state check
	if MM.playerCount()==2 and p.role==nil --When Player 2 spawns/joins notify Player 1 (who's probably AFK) about the new 'rival' with Sound
		for p in players.iterate p.role=0 end
		assignRoles()
		S_StartSound(p.mo, 93)
	elseif MM.playerCount()>2 and p.role==nil p.spectator=true end --if player joins mid-round of MM game, make him spectate (by assigning DEAD)
end)
addHook("HurtMsg", do --disable Ringslier hurt messages
	if gametype==GT_MURDERMYSTERY return true end
end)
local function setRandomInnoAs(role)
	while true
		for p in players.iterate
			if P_RandomKey(4)==0 and p.role==R_INNO and not p.spectator then
				p.role=role
				if role==R_SHERIFF chatprintf(p, mmtext[p.mmlang]["NewSheriff"])
				elseif role==R_MURDERER chatprintf(p, mmtext[p.mmlang]["NewMurderer"]) end
				return
			end
		end
	end
end
local function KillPlayer(p, k) --player, killer (both MOBJ_T)
	p.player.spectator=true
	p.player.role=0
	p.player.killedby=k.player.name
	k.player.kills=$+1
	if p.skin=="tails" P_SpawnMobj(p.x, p.y, p.z, MT_TDEADPLR).color=p.color
	elseif p.skin=="knuckles" P_SpawnMobj(p.x, p.y, p.z, MT_KDEADPLR).color=p.color
	elseif p.skin=="amy" P_SpawnMobj(p.x, p.y, p.z, MT_ADEADPLR).color=p.color
	elseif p.skin=="fang" P_SpawnMobj(p.x, p.y, p.z, MT_FDEADPLR).color=p.color
	elseif p.skin=="metalsonic" P_SpawnMobj(p.x, p.y, p.z, MT_MDEADPLR).color=p.color
	else P_SpawnMobj(p.x, p.y, p.z, MT_SDEADPLR).color=p.color end
	S_StartSound(p, dthsfx[P_RandomKey(3)+1], p.player) --play random death sound personally
end
local function endRound(w, endtext)
	server.winner=w
	G_ExitLevel()
	chatprintGlobal(endtext)
	for p in players.iterate p.spectator=false end
	if isdedicatedserver CONS_Printf(server, "- "..endtext) end
end
--entity = the victim object
--inflictor = the thing that helped the atacker to do damage (usually bullet, in MM's case player ring)
--source = the object that atacked
addHook("MobjDamage", function(entity, inflictor, source)
	if gametype!=GT_MURDERMYSTERY or not source return end
	if source.player -- check if both the atacker and victim are players
		if entity.player.role==R_MURDERER
			if source.player.role==R_MURDERER
				chatprintf(source.player, "\x85"..mmtext[source.player.mmlang]["HitTeammate_atacker"])
				chatprintf(entity.player, "\x85"..mmtext[entity.player.mmlang]["HitTeammate_victim"])
				return
			end
			KillPlayer(entity, source)
			-- Murderer died, end the game if every Murd is dead
			if MM.howMuchPlayersWithRole(R_MURDERER)==0 endRound(R_SHERIFF, "SheriffsWin")
			else
				chatprintGlobal("MurdererKilled", entity.player)
				if isdedicatedserver CONS_Printf(server, "- "..entity.player.name.." (Murd) died") end
			end
		elseif entity.player.role==R_SHERIFF
			if source.player.role==R_SHERIFF
				chatprintf(source.player, "\x84"..mmtext[source.player.mmlang]["HitTeammate_atacker"])
				chatprintf(entity.player, "\x84"..mmtext[entity.player.mmlang]["HitTeammate_victim"])
				return
			end
			KillPlayer(entity, source)
			-- Sheriff died, drop his emerald (weapon), if he's not last
			if MM.howMuchPlayersWithRole(R_INNO)!=0
				P_SpawnMobj(entity.x, entity.y, entity.z, MT_SHREML)
				chatprintGlobal("SheriffKilled", entity.player)
				if isdedicatedserver CONS_Printf(server, "- "..entity.player.name.." (Sheriff) killed, dropped his emerald") end
			elseif MM.howMuchPlayersWithRole(R_INNO)==0 and MM.howMuchPlayersWithRole(R_SHERIFF)!=0
				chatprintGlobal("SheriffKilledNoDrop", entity.player)
				if isdedicatedserver CONS_Printf(server, "- "..entity.player.name.." (Sheriff) killed") end
			end
		elseif entity.player.role==R_INNO
			KillPlayer(entity, source)
			if source.player.role==R_SHERIFF then
				-- Sheriff killed an innocent, remove role "Sheriff" from the player if there are more of Innos,
				-- otherwise Murderers win
				if MM.howMuchPlayersWithRole(R_INNO)>0
					chatprintf(source.player, mmtext[source.player.mmlang]["SheriffKillInnoPM"])
					chatprintGlobal("SheriffKillInno")
					setRandomInnoAs(R_SHERIFF)
					source.player.role=R_INNO
				else endRound(R_MURDERER, "MurdersWinNoInnos") end
			end
		end
		if MM.howMuchPlayersWithRole(R_INNO)==0 and MM.howMuchPlayersWithRole(R_SHERIFF)==0 and MM.howMuchPlayersWithRole(R_MURDERER)!=0 endRound(R_MURDERER, "MurdersWin")
		elseif MM.howMuchPlayersWithRole(R_INNO)==0 and MM.howMuchPlayersWithRole(R_MURDERER)!=0 and MM.howMuchPlayersWithRole(R_SHERIFF)!=0 S_ChangeMusic("SHWDWN", true) end
	end
end, MT_PLAYER)

--Sheriff Emerald pickup logic
local function mobjInRange(mo, mo2)
	if abs(mo.x-mo2.x)/FU < 32 and abs(mo.y-mo2.y)/FU < 32 and abs(mo.z-mo2.z)/FU < 46 return true
	else return false end
end
addHook("MobjThinker", function(mo)
	if gametype==GT_MURDERMYSTERY
		for p in players.iterate
			if p.role==3 and mobjInRange(mo, p.mo)
				P_RemoveMobj(mo)
				S_StartSound(p.mo, 97, p)
				p.role=2
				chatprintGlobal("SheriffDropPicked")
				if MM.howMuchPlayersWithRole(R_INNO)==0 and MM.howMuchPlayersWithRole(R_MURDERER)!=0 and MM.howMuchPlayersWithRole(R_SHERIFF)!=0 S_ChangeMusic("SHWDWN", true) end
				return
			end
		end
	end		
end, MT_SHREML)
addHook("PlayerThink", function(p)
	if gametype!=GT_MURDERMYSTERY return end
	if p.role==1 --remove weapons from Murderer
		p.ringweapons=0
		for i=15,20 p.powers[i]=0 end
	elseif p.role==3 p.weapondelay=1 end --Make innocents not shoot
	if p.cmd.forwardmove==0 and p.cmd.sidemove==0 and p.cmd.buttons==0 and not p.spectator and MM.playerCount()!=1 and afkCVAR.value~=0 p.afk=p.afk+1 --anti-afk code
	else p.afk=0 end
	if p.afk>afkCVAR.value
		if p==server
			print("\x82HOST PLAYER IS AFK FOR 2 MINUTES, CLOSING THE SERVER...")
			COM_BufInsertText(server, "QUIT")
		else COM_BufInsertText(server, "kick "..#p.." AFK") end --kick player who didn't input any button for 2 minutes
	end
end)
addHook("IntermissionThinker", do
	for p in players.iterate if p.spectator p.spectator=false end end
end)
-- end game when important players leave and no Innocents are alive to reassign that role to them
addHook("PlayerQuit", function(p)
	if gametype!=GT_MURDERMYSTERY return end
	if p.role==R_MURDERER
		p.role=0
		if MM.howMuchPlayersWithRole(R_INNO)==0 and MM.howMuchPlayersWithRole(R_MURDERER)==0
			endRound(0, "LastMurdLeft")
		elseif MM.howMuchPlayersWithRole(1)==0
			if gamestate==GS_LEVEL
				chatprintGlobal("MurdLeftReplace")
				setRandomInnoAs(1)
				if isdedicatedserver CONS_Printf(server, "- Murderer replaced") end
			else
				chatprintGlobal("OneMurdLeft")
				if isdedicatedserver CONS_Printf(server,"- Murd left") end
			end
		else
			chatprintGlobal("OneMurdLeft")
			if isdedicatedserver CONS_Printf(server, "- Murd left") end
		end
	elseif p.role==R_SHERIFF
		p.role=0
		if MM.howMuchPlayersWithRole(R_INNO)==0 and MM.howMuchPlayersWithRole(R_SHERIFF)==0
			endRound(0, "LastSheriffLeft")
		elseif MM.howMuchPlayersWithRole(2)==0
			if gamestate==GS_LEVEL
				chatprintGlobal("SheriffLeftReplace")
				setRandomInnoAs(2)
				if isdedicatedserver CONS_Printf(server,"- Sheriff replaced") end
			else
				chatprintGlobal("OneSheriffLeft")
				if isdedicatedserver CONS_Printf(server,"- Sheri left") end
			end
		else
			chatprintGlobal("OneSheriffLeft")
			if isdedicatedserver CONS_Printf(server,"- Sheri left") end
		end
	elseif p.role==R_INNO
		p.role=0
		if MM.howMuchPlayersWithRole(R_INNO)==0 and MM.howMuchPlayersWithRole(R_SHERIFF)==0 endRound(0, "LastInnoLeft")
		elseif MM.howMuchPlayersWithRole(R_INNO)==0 and MM.howMuchPlayersWithRole(R_SHERIFF)!=0 and MM.howMuchPlayersWithRole(R_MURDERER)!=0 S_ChangeMusic("SHWDWN", true) end
	end
	if p.name!=p.oldname
		chatprint("\x82*"..p.oldname.." didn't read \x87MMHELP BAD\x82 carefuly, what a stupid")
		p.oldname=p.name
	end
end)
if MurderMystery.devbuild
	COM_AddCommand("mmplayer", function(p, pnum, prole, pdead, killby)
		if pnum==nil or prole==nil or pdead==nil
			CONS_Printf(p, "\x87MMPLAYER\x80 [playernum] [role] [dead (0/1)] [killedby (optional)]")
			return
		end
		if prole=="nil" players[tonumber(pnum)].role=nil
		else players[tonumber(pnum)].role=tonumber(prole) end
		if pdead=="1" players[tonumber(pnum)].spectator=true
		else players[tonumber(pnum)].spectator=false end
		if killby!=nil players[tonumber(pnum)].killedby=killby end
	end)
	COM_AddCommand("mmnodes", do
		for p in players.iterate print(p.name..": "..tostring(p.role)..", "..tostring(p.spectator)) end
	end)
end