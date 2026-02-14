--Shadow Moses Island (MAPKE)
--Level script
--Original level design by Konami & Hideo Kojima
--SRB2 map port & code by LeonardoTheMutant

local timerConst = {
	105, --3 seconds, elevator came to the floor and waits to open doors
	700 --20 seconds, evevator travel time
}

local elevatorState = {
	0, --floor (0 - Top, 1 - B1, 2 - B2)
	0, --doors state (0 - closed, 1 - open)
	0, --timer
	0, --direction (0 - none/idle, 1 - up, 2 - down, 3 - just arrived)
}

local function P_OpenElevatorDoors()
	if (not elevatorState[2]) then
		P_LinedefExecute(94)
		elevatorState[2] = 1
	end
end

local function P_CloseElevatorDoors()
	if (elevatorState[2]) then
		P_LinedefExecute(95)
		elevatorState[2] = 0
	end
end

local function P_ElevatorMove()
	local mo
	switch(elevatorState[1], {
		[0] = do --from Top Floor
			local mo = P_SpawnMobj(-192*FU, 2752*FU, 0, MT_RAY)
			searchBlockmap("objects", function(refmobj, foundmobj)
				P_MoveOrigin(foundmobj, foundmobj.x - 2048*FU, foundmobj.y, foundmobj.z)
			end, mo, (mo.x - 8388608), (mo.x + 8388608), (mo.y - 8388608), (mo.y + 8388608))
		end,
		[1] = do --from Basement 1
			local mo = P_SpawnMobj(-192*FU, 2752*FU, 0, MT_RAY)
			searchBlockmap("objects", function(refmobj, foundmobj)
				P_MoveOrigin(foundmobj, foundmobj.x - 2048*FU, foundmobj.y, foundmobj.z) --dummy values
			end, mo, (mo.x - 8388608), (mo.x + 8388608), (mo.y - 8388608), (mo.y + 8388608))
		end,
		[2] = do --from Basement 2
			local mo = P_SpawnMobj(-192*FU, 2752*FU, 0, MT_RAY)
			searchBlockmap("objects", function(refmobj, foundmobj)
				P_MoveOrigin(foundmobj, foundmobj.x - 2048*FU, foundmobj.y, foundmobj.z) --dummy values
			end, mo, (mo.x - 8388608), (mo.x + 8388608), (mo.y - 8388608), (mo.y + 8388608))
		end,
	})
	P_StartQuake(FRACUNIT, timerConst[2] - 70, {-2240*FRACUNIT, 2752*FRACUNIT, 0}, 160*FRACUNIT)
end

local function P_ElevatorFloor()
	local mo = P_SpawnMobj(-2240*FU, 2752*FU, 0, MT_RAY)
	searchBlockmap("objects", function(refmobj, foundmobj)
		switch(elevatorState[1], {
			[0] = do --to Top floor
				P_MoveOrigin(foundmobj, foundmobj.x + 2048*FU, foundmobj.y, foundmobj.z)
			end,
			[1] = do --to Basement 1
				P_MoveOrigin(foundmobj, foundmobj.x + 2048*FU, foundmobj.y, foundmobj.z) --dummy values
			end,
			[2] = do --to Basement 2
				P_MoveOrigin(foundmobj, foundmobj.x + 2048*FU, foundmobj.y, foundmobj.z) --dummy values
			end,
		})
		S_StartSound(nil, sfx_ding, foundmobj.player)
	end, mo, (mo.x - 8388608), (mo.x + 8388608), (mo.y - 8388608), (mo.y + 8388608))
end

addHook("ThinkFrame", do
	if (elevatorState[3]) then elevatorState[3] = $ - 1 end
	if (not elevatorState[3]) --if timer ran out
		if (elevatorState[2]) then --if the doors are open
			if (not elevatorState[4]) then P_CloseElevatorDoors() --if elevator does not plan to move close the elevator doors
			elseif (elevatorState[4] == 3) then elevatorState[4] = 0 end --if elevator has just arrived change its direction to none/idle
		else --doors are closed
			if (elevatorState[4]) --if evetator plans to move
				if (elevatorState[4] == 1) then --going up
					elevatorState[1] = $ + 1
				elseif (elevatorState[4] == 2) then --going down
					elevatorState[1] = $ - 1
				end
				P_ElevatorFloor()
				elevatorState[3] = timerConst[1]
				elevatorState[4] = 3
				P_OpenElevatorDoors(elevatorState[1])
			end
		end
	else --timer is not 0
		--Move players into the elevator and do the evelator thingies
		if (((elevatorState[4] == 1) or (elevatorState[4] == 2)) and (elevatorState[3] == timerConst[2] - 35))
			P_ElevatorMove()
		end
	end
end)

addHook("LinedefExecute", do
	if (not elevatorState[4]) then
		P_OpenElevatorDoors()
		elevatorState[3] = 5*TICRATE
	end
end,"KEELVOPN")

addHook("LinedefExecute", do
	if (not elevatorState[4]) then
		P_CloseElevatorDoors()
		elevatorState[3] = timerConst[2]
		elevatorState[4] = 1
	end
end,"KEELVUP")

addHook("LinedefExecute", do
	if (not elevatorState[4]) then
		P_CloseElevatorDoors()
		elevatorState[3] = timerConst[2]
		elevatorState[4] = 2
	end
end,"KEELVDWN")



--
-- GRAPHICS
--

local digitTile1 = "55"..string.rep("7", 8).."11"
local digitTile2 = "44"..string.rep("7", 8).."22"

local duelSign_digits = {
	palette = {
		{31, 31, 31, 31, 31, 31, 41, 39}, --0
		{41, 31, 31, 41, 41, 41, 41, 39}, --1
		{31, 31, 41, 31, 31, 41, 31, 39}, --2
		{31, 31, 31, 31, 41, 41, 31, 39}, --3
		{41, 31, 31, 41, 41, 31, 31, 39}, --4
		{31, 41, 31, 31, 41, 31, 31, 39}, --5
		{31, 41, 31, 31, 31, 31, 31, 39}, --6
		{31, 31, 31, 41, 41, 41, 41, 39}, --7
		{31, 31, 31, 31, 31, 31, 31, 39}, --8
		{31, 31, 31, 31, 41, 31, 31, 39}  --9

	},
	image = {
		"700000000007",
		"570000000071",
		digitTile1,
		digitTile1,
		digitTile1,
		digitTile1,
		digitTile1,
		digitTile1,
		digitTile1,
		digitTile1,
		"576666666671",
		"766666666667",
		digitTile2,
		digitTile2,
		digitTile2,
		digitTile2,
		digitTile2,
		digitTile2,
		digitTile2,
		digitTile2,
		"473333333372",
		"733333333337"
	}
}

--Graphics optimization at its peak (do not let the programmer cook graphics)

local tilePart0 = "00"
local tilePart1 = "11"
local tilePart2 = "22"
local tilePartSpace = string.rep(" ", 12)

local signTile0 = tilePart0..string.rep(tilePart1, 4)..tilePartSpace..tilePart1..tilePartSpace..tilePart1.."1"..string.rep(tilePart0, 2)..tilePart1.."1"..tilePartSpace..tilePart1..tilePartSpace..string.rep(tilePart1, 4)..tilePart0
local signTile1 = string.rep(tilePart0, 41) --plain line of zeroes
local signTile2 = tilePart0..string.rep(tilePart1, 39)..tilePart0 --"00111100"
local signTile3 = tilePart0..string.rep(tilePart2, 39)..tilePart0 --"00222200"
local signTile4 = "0011111111000000000000000000000000000000000000000000000000000000000000001111111100"
local signTile5 = tilePart0..string.rep(tilePart1, 4)..tilePartSpace..tilePart1..tilePartSpace..string.rep(tilePart1, 5)..tilePartSpace..tilePart1..tilePartSpace..string.rep(tilePart1, 4)..tilePart0

local duelSign = {
	palette = {
		{31, 39, 31},
		{31, 39, 47},
		{31, 39, 46},
		{31, 39, 45},
		{31, 39, 44},
		{31, 39, 43},
		{31, 39, 42},
		{31, 39, 41},
		{31, 39, 40},
		{31, 39, 41}
	},
	image = {
		signTile1,
		signTile1,
		signTile2,
		signTile3,
		signTile3,
		"0022222111111111122221111222222222211111111111112211111111112222111111111111222200",
		"0022221111111111112221111222222222211111111111112211111111111222111111111111222200",
		"0022221111222221111221111222222222211112222222222211112222211122222211112222222200",
		"0022221111222222111221111222222222211112222222222211112222221122222211112222222200",
		"0022221111222221111221111222222222211111111111222211112222211122222211112222222200",
		"0022221111111111111221111222222222211111111111222211111111111222222211112222222200",
		"0022221111111111111221111222222222211112222222222211111111111222222211112222222200",
		"0022221111222221111221111222222222211112222222222211112222111122222211112222222200",
		"0022221111222222111221111222222222211112222222222211112222211122222211112222222200",
		"0022221111222222111221111111111112211111111111112211112222211122222211112222222200",
		"0022221111222222111221111111111112211111111111112211112222211122222211112222222200",
		signTile3,
		signTile3,
		signTile3,
		"0022222111111122112211111111112211221111111221122111111111111221122111111112222200",
		"0022222111111122112211111111112211221111111221122111111111111221122111111112222200",
		signTile3,
		signTile3,
		signTile2,
		signTile2,
		"0011111111111111000000000000000111111111111000000000011111000000011111111111111100",
		"0011111111111111000000000000000111111111111000000000011100001110000111111111111100",
		"0011111111111000000011111000000111111111111000110000011100001110000111111111111100",
		"0011111111111000000011111000000111111111111000110000011100001110000111111111111100",
		"0011111111111111111111000000000111111111111000110001110000111111100001111111111100",
		"0011111111111111111111000011111111111111111000000001100000111111100000111111111100",
		"0011111111111111111111000011111111111111111000000001100000111111100000111111111100",
		"0011111111111000000000000000000000000011111000001111111100000000000111111111111100",
		"0011111111111000000000000000000000000011111000001111111100000000000111111111111100",
		"0011111111111000000000000000000000000011111000001111111111100000111111111111111100",
		"0011111111111000001111111111111111111111111000000000011111100000111111111111111100",
		"0011111111111000001111111111111111111111111000111000011111100000111111111111111100",
		"0011111111111000001100000000000001111111111000111000000000000000000000111111111100",
		"0011111111111000001100001111100001111111111000111000000001100000110000111111111100",
		"0011111111111000001100001111100001111111111000111000000001100000110000111111111100",
		"0011111111111000001100001111100001111111111000111000000001100000110000111111111100",
		"0011111111111000001100001100000001111111111000111000000000000000000000111111111100",
		"0011111111111000001100001100000001111111111000111000011111110001111111111111111100",
		"0011111111111000001100001111111111111111111000111000011111110001111111111111111100",
		"0011111111111000001100001111111111111111111000111000011111110001111111111111111100",
		"0011111111111000001100001111111111111111111000111000011111110001111111111111111100",
		"0011111111111000001100001111111111111111111000111000011111110001111111111111111100",
		"0011111111111000001100001111111111111111111000100000111111000000011111111111111100",
		"0011111111111000001100001111111111111111111000100001111111000000011111111111111100",
		"0011111111111000001100001111111110000111111000111111111100001110000111111111111100",
		"0011111111110000011111000000000000000011111000111111111100001110000111111111111100",
		"0011111111000000111111100000000000000011111000111111100000111111100000111111111100",
		"0011111111000000111111100000000000000111111111111111100000111111100000111111111100",
		signTile2,
		signTile2,
		signTile4,
		signTile4,
		signTile2,
		signTile2,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile5,
		signTile0,
		signTile0,
		signTile0,
		signTile0,
		signTile2,
		signTile2,
		signTile4,
		signTile4,
		signTile2,
		signTile1,
		signTile1
	}
}

local function sortOfSine(a, base)
	local b = a % (base * 2)
	if (b > (base - 1)) then return (base * 2) - b - 1
	else return b end
end

local timertime
hud.add(function(v)
	if not ((gamemap == 474) and (MM.hud.show)) then return end
	timertime = (MM.timelimit * 2100) - leveltime
	v.drawString(200, 184, "\x85".."Elevator state", V_SNAPTOLEFT, "thin")
	v.drawString(200, 192, string.format("%4d %4d %4d %4d", elevatorState[1], elevatorState[2], elevatorState[3], elevatorState[4]), V_SNAPTOLEFT, "thin")
	if (MM and HIDEO and MM.shwdwn)
		HIDEO.DrawTextPatch(v, 234, 4, duelSign, sortOfSine(leveltime, 9)+1, V_SNAPTOTOP|V_SNAPTORIGHT)
		if ((timertime / 35) > 99) then
			for i = 1, 2 do
				for j = 1, 2 do
					HIDEO.DrawTextPatch(v, (194 + (i*36) + (j*14)), 63, duelSign_digits, 10, V_SNAPTOTOP|V_SNAPTORIGHT)
				end
			end
		else
			HIDEO.DrawTextPatch(v, 244, 63, duelSign_digits, (timertime/350)+1, V_SNAPTOTOP|V_SNAPTORIGHT)
			HIDEO.DrawTextPatch(v, 258, 63, duelSign_digits, ((timertime/35)%10)+1, V_SNAPTOTOP|V_SNAPTORIGHT)
			HIDEO.DrawTextPatch(v, 280, 63, duelSign_digits, (G_TicsToCentiseconds(timertime)/10)+1, V_SNAPTOTOP|V_SNAPTORIGHT)
			HIDEO.DrawTextPatch(v, 294, 63, duelSign_digits, (G_TicsToCentiseconds(timertime)%10)+1, V_SNAPTOTOP|V_SNAPTORIGHT)
		end
	end
end)
