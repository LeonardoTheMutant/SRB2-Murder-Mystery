-- HUD.LUA
-- Former name: RolesSettings.lua
-- Base code by Tedvin11
-- Improved and developed further by LeonardoTheMutant
--
-- This script controlls HUD elements

-- Constants
local R_MURDERER=1
local R_SHERIFF=2
local R_INNO=3
local MM=MurderMystery
local mmtext=MM.text

	/*["FR"]={ --Piksqu's French (abandoned)
		["RM_HUD"]="ASSASSIN",
		["RS_HUD"]="SHERIFF",
		["RI_HUD"]="INOCENT",
		["DD_HUD"]="MORT",
		["TeamLeft_HUD"]="Coequipiers vivants: "*/

local function roleHUD(v, p) --the HUD that appears in on screen during game
	if gametype != GT_MURDERMYSTERY --in case if switched from MM to other gametype
		hud.enable("lives")
		hud.enable("textspectator")
		hud.enable("score")
		hud.enable("weaponrings")
		return
	end
	hud.disable("score")
	hud.disable("lives")
	hud.disable("textspectator")
	hud.disable("weaponrings")
	--Draw "People alive" in HUD
	v.draw(hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, v.cachePatch("HUD_PPLE"), V_SNAPTOTOP|V_SNAPTOLEFT)
	v.draw(hudinfo[HUD_SCORE].x+56, hudinfo[HUD_SCORE].y, v.cachePatch("HUD_ALVE"), V_SNAPTOTOP|V_SNAPTOLEFT)
	if MM.howMuchPlayersAlive()>9 v.draw(hudinfo[HUD_SCORE].x+104, hudinfo[HUD_SCORE].y, v.cachePatch("STTNUM1"), V_SNAPTOTOP|V_SNAPTOLEFT)
	elseif MM.howMuchPlayersAlive()>19 v.draw(hudinfo[HUD_SCORE].x+104, hudinfo[HUD_SCORE].y, v.cachePatch("STTNUM2"), V_SNAPTOTOP|V_SNAPTOLEFT) --did someone see 20 players in ringslier?
	elseif MM.howMuchPlayersAlive()>29 v.draw(hudinfo[HUD_SCORE].x+104, hudinfo[HUD_SCORE].y, v.cachePatch("STTNUM3"), V_SNAPTOTOP|V_SNAPTOLEFT) end --will this number be even reached?!?!?
	v.draw(hudinfo[HUD_SCORE].x+112, hudinfo[HUD_SCORE].y, v.cachePatch("STTNUM"..MM.howMuchPlayersAlive()%10), V_SNAPTOTOP|V_SNAPTOLEFT)
	--Show your role in HUD (and translate it)
	if p.role == R_MURDERER
		v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+16, "\x85"..mmtext[p.mmlang]["RM_HUD"], V_SNAPTOTOP|V_SNAPTOLEFT)
		if MM.howMuchPlayersWithRole(R_MURDERER)>1 v.drawString(0, 192, "\x85"..mmtext[p.mmlang]["TeamLeft_HUD"]..MM.howMuchPlayersWithRole(R_MURDERER), V_SNAPTOBOTTOM|V_SNAPTOLEFT) end
		hud.enable("weaponrings")
	elseif p.role == R_SHERIFF
		v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+16, "\x84"..mmtext[p.mmlang]["RS_HUD"], V_SNAPTOTOP|V_SNAPTOLEFT)
		if MM.howMuchPlayersWithRole(R_SHERIFF)>1 v.drawString(0, 192, "\x84"..mmtext[p.mmlang]["TeamLeft_HUD"]..MM.howMuchPlayersWithRole(R_SHERIFF), V_SNAPTOBOTTOM|V_SNAPTOLEFT) end
		hud.enable("weaponrings")
	elseif p.role == R_INNO v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y + 16, "\x83"..mmtext[p.mmlang]["RI_HUD"], V_SNAPTOTOP|V_SNAPTOLEFT)
	elseif p.spectator
		v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+16, "\x8F"..mmtext[p.mmlang]["DD_HUD"], V_SNAPTOTOP|V_SNAPTOLEFT)
		if p.mmlang=="ES"
			v.drawString(114, 144, "Estas\x8F muerto", 8388608)
			v.drawString(2, 152, "No puedes reaparecer o hablarle a los vivos", 8388608)
			if p.role==nil v.drawString(4, 168, "Te uniste en \x84la mitad de la partida\x80, espera para jugar una nueva ronda", 8388608, "thin") end
		elseif p.mmlang=="FR"
			v.drawString(118, 144, "You are\x8F dead", 8388608)
			v.drawString(32, 152, "You can't respawn or talk to alives", 8388608)
			if p.role==nil v.drawString(48, 168, "You joined \x84mid-round\x80, wait for the new round to play", 8388608, "thin") end
		elseif p.mmlang=="PL"
			v.drawString(112, 144, "Jestes\x8F martwy", 8388608)
			v.drawString(60, 152, "Nie mozesz powrocic do zycia", 8388608)
			v.drawString(88, 160, "albo gadac do zywych", 8388608)
			if p.role==nil v.drawString(8, 176, "Dolaczyles/as w \x84srodku rundy\x80, poczekaj na nastepna runde zeby grac", 8388608, "thin") end
		elseif p.mmlang=="PT"
			v.drawString(104, 144, "Voce esta\x8F morto", 8388608)
			v.drawString(16, 152, "Voce nao pode reviver ou falar com vivos", 8388608)
			if p.role==nil 
				v.drawString(32, 168, "Voce entrou em uma \x84rodada intermediaria\x80, aguarde a nova", 8388608, "thin")
				v.drawString(118, 176, "rodada para jogar", 8388608, "thin")
			end
		elseif p.mmlang=="UA"
			v.drawString(118, 144, "Ty\x8F mertwyj", 8388608)
			v.drawString(54, 152, "Ne mozhesh widrodzhuwatysia", 8388608)
			v.drawString(78, 160, "abo goworyty do zhywyh", 8388608)
			if p.role==nil v.drawString(4, 176, "Ty pryjednawsia \x84posered raundu\x80, pochekaj nowogo raundu shob zagraty", 8388608, "thin") end
		else
			v.drawString(114, 144, "You are\x8F dead", 8388608)
			v.drawString(32, 152, "You can't respawn or talk to alives", 8388608)
			if p.role==nil v.drawString(42, 168, "You joined \x84mid-round\x80, wait for the new round to play", 8388608, "thin") end
		end
		if p.killedby!=nil v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+24, "\x85"..mmtext[p.mmlang]["KILLBY_HUD"].."\x80"..p.killedby, V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE) end
	elseif MM.howMuchPlayersAlive()==1
		if p.mmlang=="ES"
			v.drawString(10, 144, "\x84".."2 jugadores\x80 son requeridos para el juego,", 8388608)
			v.drawString(0, 152, "porfavor espera \x84un jugador mas\x80 para empezar", 8388608)
		elseif p.mmlang=="FR"
			v.drawString(24, 144, "\x84".."2 jouers\x80 sonts necesaire pour le jeu,", 8388608)
			v.drawString(36, 152, "attender que d'autre joueur joine", 8388608)
		elseif p.mmlang=="PL"
			v.drawString(72, 144, "Potrzeba\x84 2 graczy\x80 do gry", 8388608)
			v.drawString(8, 152, "Zaczekaj prosze na \x84jeszcze jednego\x80 gracza", 8388608)
		elseif p.mmlang=="PT"
			v.drawString(48, 144, "\x80Precisa-se de\x84 2 jogadores \x80para", 8388608)
			v.drawString(104, 152, "o jogo comecar,", 8388608)
			v.drawString(26, 160, "aguarde \x84mais um\x80 jogador para iniciar", 8388608)
		elseif p.mmlang=="UA"
			v.drawString(64, 144, "Potribno \x84".."2 grawcia\x80 dla gry,", 8388608)
			v.drawString(4, 152, "zachekaj na \x84she odnogo\x80 grawcia aby pochaty", 8388608)
		else
			v.drawString(28, 144, "\x84".."2 players\x80 are requiered for the game,", 8388608)
			v.drawString(16, 152, "please wait for \x84one more\x80 player to start", 8388608)
		end
	end
	if server.duelmode and p.mmlang
		hud.enable("weaponrings")
		v.drawString(0, 192, "\x81"..mmtext[p.mmlang]["MATCH_HUD"], V_SNAPTOBOTTOM|V_SNAPTOLEFT)
	end
	if MM.howMuchPlayersWithRole(R_INNO)==0 and MM.howMuchPlayersWithRole(R_MURDERER)!=0 and MM.howMuchPlayersWithRole(R_SHERIFF)!=0 v.drawString(108, 160, "\x88Showdown duel!", V_ALLOWLOWERCASE) end
	if CV_FindVar("mmsprint").value v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+32, "\x82Sprint (hold):\x80 CUSTOM1", V_SNAPTOTOP|V_SNAPTOLEFT, "thin")
	elseif p.sneak v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+32, "Sneaking...", V_SNAPTOTOP|V_SNAPTOLEFT, "thin") end
	if MM.devbuild
		v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+96, "\x87"..MM.version.."-"..MM.devbuild, V_SNAPTOTOP|V_SNAPTOLEFT, "thin")
		v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+104, "\x82".."AFK: \x80"..p.afk, V_SNAPTOTOP|V_SNAPTOLEFT, "thin")
	end
end
local function scoresHUD(v) -- the HUD that appears on SCORES TAB
	if gametype!=GT_MURDERMYSTERY then
		hud.enable("rankings")
		return
	end
	local p=consoleplayer --for shortage
	hud.disable("rankings")
	if p.mmlang=="ES"
		v.drawString(84, 20, "Misterio De Asesinato", V_SNAPTOTOP|V_ALLOWLOWERCASE)
		v.drawString(20, 40, "No hay puntaje aqui! Los contadores\ndebajo pueden ayudarte", V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE|V_RETURN8)
		v.drawString(20, 64, "Si eres nuevo al tipo de juego\nusa \x87MMHELP\x80 en la Consola", V_SNAPTOTOP|V_SNAPTOLEFT|V_RETURN8|V_ALLOWLOWERCASE)
		if server.duelmode v.drawString(20, 88, "\x81No hay jugadores suficientes para\nempezar la partida de MM,\n(almenos 3 son requeridos)\nen vez de eso jugaran El Modo Duelo", V_SNAPTOTOP|V_SNAPTOLEFT|V_RETURN8|V_ALLOWLOWERCASE) end
		v.drawString(20, 128, "\x82".."Diviertete ;)", V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE)
		v.drawString(20, 176, "\x85".."Asesinos vivos: "..MM.howMuchPlayersWithRole(R_MURDERER), V_SNAPTOTOP|V_SNAPTOLEFT)
		v.drawString(20, 184, "\x84".."Comisarios vivos: "..MM.howMuchPlayersWithRole(R_SHERIFF), V_SNAPTOTOP|V_SNAPTOLEFT)
		if howMuchPlayersWithRole(R_INNO)!=0 v.drawString(20, 192, "\x83Inocentes vivos: "..MM.howMuchPlayersWithRole(R_INNO), V_SNAPTOTOP|V_SNAPTOLEFT) end
	elseif p.mmlang=="PL"
		v.drawString(88, 20, "Tajemnica Mordercy", V_SNAPTOTOP|V_ALLOWLOWERCASE)
		v.drawString(20, 40, "Tutaj nie ma punktow! Liczniki na dole\nmoga pomoc", V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE|V_RETURN8)
		v.drawString(20, 64, "Jesli jestes nowy w tym trybie\nuzyj \x87MMHELP\x80 w Konsoli", V_SNAPTOTOP|V_SNAPTOLEFT|V_RETURN8|V_ALLOWLOWERCASE)
		if server.duelmode v.drawString(20, 88, "\x81Za malo graczy zeby zaczac runde MM\n(potrzeba 3), zmiana na Tryb Duel Match", V_SNAPTOTOP|V_SNAPTOLEFT|V_RETURN8|V_ALLOWLOWERCASE) end
		v.drawString(20, 128, "\x82".."Baw sie dobrze ;)", V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE)
		v.drawString(20, 176, "\x85Zywi Mordercy: "..MM.howMuchPlayersWithRole(R_MURDERER), V_SNAPTOTOP|V_SNAPTOLEFT)
		v.drawString(20, 184, "\x84Zywi Szeryfi: "..MM.howMuchPlayersWithRole(R_SHERIFF), V_SNAPTOTOP|V_SNAPTOLEFT)
		if howMuchPlayersWithRole(R_INNO)!=0 v.drawString(20, 192, "\x83Zywi Niewinni: "..MM.howMuchPlayersWithRole(R_INNO), V_SNAPTOTOP|V_SNAPTOLEFT) end
	elseif p.mmlang=="PT"
		v.drawString(108, 20, "Murder Mystery", V_SNAPTOTOP|V_ALLOWLOWERCASE)
		v.drawString(20, 40, "Nenhuma pontuacao aqui! Os contadores\nabaixo podem ajudar", V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE|V_RETURN8)
		v.drawString(20, 64, "Se voce e novo nesse tipo de jogo escreva\n\x87MMHELP\x80 no Console", V_SNAPTOTOP|V_SNAPTOLEFT|V_RETURN8|V_ALLOWLOWERCASE)
		if server.duelmode v.drawString(20, 88, "\x81Nao ha jogadores suficientes para\niniciar o jogo MM, (pelo menos 3\nnecessarios) jogando no\nModo de duelo de partida", V_SNAPTOTOP|V_SNAPTOLEFT|V_RETURN8|V_ALLOWLOWERCASE) end
		v.drawString(20, 128, "\x82".."Divirta-se ;)", V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE)
		v.drawString(20, 176, "\x85".."Assasinos vivos: "..MM.howMuchPlayersWithRole(R_MURDERER), V_SNAPTOTOP|V_SNAPTOLEFT)
		v.drawString(20, 184, "\x84Xerifes vivos: "..MM.howMuchPlayersWithRole(R_SHERIFF), V_SNAPTOTOP|V_SNAPTOLEFT)
		if howMuchPlayersWithRole(R_INNO)!=0 v.drawString(20, 192, "\x83Inocentes vivos: "..MM.howMuchPlayersWithRole(R_INNO), V_SNAPTOTOP|V_SNAPTOLEFT) end
	elseif p.mmlang=="UA"
		v.drawString(88, 20, "Tajemnycia Wbywstwa", V_SNAPTOTOP|V_ALLOWLOWERCASE)
		v.drawString(20, 40, "Tablyci ochok tut nema, ale lichylnyki\nunyzu mozhut dopomogty", V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE|V_RETURN8)
		v.drawString(20, 64, "Jaksho ty nowachok u cij gri\nwykorystaj \x87MMHELP\x80 w Konsoli", V_SNAPTOTOP|V_SNAPTOLEFT|V_RETURN8|V_ALLOWLOWERCASE)
		if server.duelmode v.drawString(20, 88, "\x81Nedostatnio grawciw aby rozpochaty\ngru TW, (potribno shonajmenshe 3).\nGra wwimknena jak Rezhym Match", V_SNAPTOTOP|V_SNAPTOLEFT|V_RETURN8|V_ALLOWLOWERCASE) end
		v.drawString(20, 128, "\x82Udachi ;)", V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE)
		v.drawString(20, 144, "P.S. Jaksho ty mozhesh prochytaty cej\nukrain'skij teskt ty klasnyj grawec'!", V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE|V_RETURN8)
		v.drawString(20, 176, "\x85Wbywc w zhywych: "..MM.howMuchPlayersWithRole(R_MURDERER), V_SNAPTOTOP|V_SNAPTOLEFT)
		v.drawString(20, 184, "\x84Sheryfiw w zhywych: "..MM.howMuchPlayersWithRole(R_SHERIFF), V_SNAPTOTOP|V_SNAPTOLEFT)
		if howMuchPlayersWithRole(R_INNO)!=0 v.drawString(20, 192, "\x83Newynnych w zhywych: "..MM.howMuchPlayersWithRole(R_INNO), V_SNAPTOTOP|V_SNAPTOLEFT) end
	else
		v.drawString(108, 20, "Murder Mystery", V_SNAPTOTOP|V_ALLOWLOWERCASE)
		v.drawString(20, 40, "No scores here! Counters below may help", V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE)
		v.drawString(20, 64, "If you're new to the gametype\nuse \x87MMHELP\x80 in the Console", V_SNAPTOTOP|V_SNAPTOLEFT|V_RETURN8|V_ALLOWLOWERCASE)
		if server.duelmode v.drawString(20, 88, "\x81Not enough players to start MM game,\n(at least 3 requiered) playing in\nMatch Duel Mode instead", V_SNAPTOTOP|V_SNAPTOLEFT|V_RETURN8|V_ALLOWLOWERCASE) end
		v.drawString(20, 128, "\x82Have Fun ;)", V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE)
		v.drawString(20, 176, "\x85Murderers alive: "..MM.howMuchPlayersWithRole(R_MURDERER), V_SNAPTOTOP|V_SNAPTOLEFT)
		v.drawString(20, 184, "\x84Sheriffs alive: "..MM.howMuchPlayersWithRole(R_SHERIFF), V_SNAPTOTOP|V_SNAPTOLEFT)
		if MM.howMuchPlayersWithRole(R_INNO)!=0 v.drawString(20, 192, "\x83Innocents alive: "..MM.howMuchPlayersWithRole(R_INNO), V_SNAPTOTOP|V_SNAPTOLEFT) end
	end
	v.drawString(192, 176, "ONLINE: "..MM.playerCount(), V_SNAPTOTOP|V_SNAPTOLEFT)
	v.drawString(2, 0, "WORK IN PROGRESS GAMETYPE, VERSION "..MM.version, V_SNAPTOTOP)
	if MM.devbuild v.drawString(0,160,"\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOBOTTOM|V_SNAPTOLEFT) end
end
local function interHUD(v)
	if gametype!=GT_MURDERMYSTERY return end
	local p=consoleplayer
	if server.winner==0 and not server.duelmode
		if p.mmlang=="ES" or p.mmlang=="PT" v.drawString(136,176,"EMPATE!")
		elseif p.mmlang=="PL" v.drawString(140,176,"REMIS!")
		elseif p.mmlang=="UA" v.drawString(132,176,"NICHYJA!")
		else v.drawString(146,176,"TIE!") end
	elseif server.winner==1
		if p.mmlang=="ES" v.drawString(88,176,"Ganadores:\x85 ASESINOS")
		elseif p.mmlang=="PL" v.drawString(96,176,"Wygrali: \x85MORDERCY")
		elseif p.mmlang=="PT" v.drawString(80,176,"Vencedores:\x85 ASSASINOS")
		elseif p.mmlang=="UA" v.drawString(102,176,"Wygraly: \x85WBYWCI")
		else v.drawString(92,176,"Winners: \x85MURDERERS") end
	elseif server.winner==2
		if p.mmlang=="ES" v.drawString(48,176,"Ganadores:\x84 COMISARIOS\x80 & \x83INOCENTES")
		elseif p.mmlang=="PL" v.drawString(60,176,"Wygrali: \x84SZERYFI\x80 & \x83NIEWINNI")
		elseif p.mmlang=="PT" v.drawString(52,176,"Vencedores: \x84XERIFES\x80 e \x83INOCENTES")
		elseif p.mmlang=="UA" v.drawString(60,176,"Wygraly: \x84SHERYFY\x80 ta \x83NEWYNNI")
		else v.drawString(52,176,"Winners: \x84SHERIFFS\x80 & \x83INNOCENTS") end
	end
	if MM.devbuild==nil v.drawString(0, 184, "WIP GAMETYPE\nv"..MM.version, V_RETURN8|V_ALLOWLOWERCASE|V_SNAPTOBOTTOM|V_SNAPTOLEFT)
	else
		v.drawString(0,184,"WIP GAMETYPE\nv"..MM.version.."-"..MM.devbuild, V_RETURN8|V_ALLOWLOWERCASE|V_SNAPTOBOTTOM|V_SNAPTOLEFT)
		v.drawString(0,160,"\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOBOTTOM|V_SNAPTOLEFT)
	end
end

hud.add(roleHUD, "game")
hud.add(scoresHUD, "scores")
hud.add(interHUD, "intermission")