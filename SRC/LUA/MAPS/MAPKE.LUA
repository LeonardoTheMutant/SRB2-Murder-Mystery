--Shadow Moses Island (MAPKE)
--Level script
--Original level design by Konami & Hideo Kojima
--SRB2 map port & code by LeonardoTheMutant

--ELEVATOR PLAYER TELEPORTATION DOES NOT CURRENTLY WORK

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

local function P_Teleport(dir)
	local mo = P_SpawnMobj(-192*FU, 2752*FU, 0, MT_RAY)
	searchBlockmap("objects", function(refmobj, foundmobj)
		switch(dir, {
			[true] = do --up
				P_MoveOrigin(foundmobj, foundmobj.x, foundmobj.y + 8388608, foundmobj.z) --dummy values
			end,
			[false] = do --down
				P_MoveOrigin(foundmobj, foundmobj.x, foundmobj.y - 8388608, foundmobj.z) --dummy values
			end
		})
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
					P_Teleport(true)
					elevatorState[1] = $ + 1
					elevatorState[3] = 105 --3 seconds
					elevatorState[4] = 3
					P_OpenElevatorDoors()
				elseif (elevatorState[4] == 2) then --going down
					P_Teleport(false)
					elevatorState[1] = $ - 1
					elevatorState[3] = 105 --3 seconds
					elevatorState[4] = 3
					P_OpenElevatorDoors()
				end
			end
		end
	else --timer is not 0
		--do elevator shaking
		if (((elevatorState[4] == 1) or (elevatorState[4] == 2)) and (elevatorState[3] == 140)) then P_StartQuake(FRACUNIT, 105, {-192*FRACUNIT, 2752*FRACUNIT, 0}, 160*FRACUNIT) end
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
		elevatorState[3] = 175 --5 seconds
		elevatorState[4] = 1
	end
end,"KEELVUP")

addHook("LinedefExecute", do
	if (not elevatorState[4]) then
		P_CloseElevatorDoors()
		elevatorState[3] = 175 --5 seconds
		elevatorState[4] = 2
	end
end,"KEELVDWN")

local duelSign = { xoff = 0, yoff = 0, palette = {{31, 35}}, image = { --placeholder
	"  1111 ",
	" 1    1 ",
	"1 2  2 1",
	"1      1",
	"1 2  2 1",
	"1  22  1",
	" 1    1",
	"  1111",
}}

hud.add(function(v)
	if (gamemap != 474) then return end
	v.drawString(200, 184, "\x85".."Elevator state", V_SNAPTOLEFT, "thin")
	v.drawString(200, 192, string.format("%4d %4d %4d %4d", elevatorState[1], elevatorState[2], elevatorState[3], elevatorState[4]), V_SNAPTOLEFT, "thin")
	if (MM and HIDEO and MM.shwdwn)
		HIDEO.DrawTextPatch(v, 268, 4, duelSign, 1, V_SNAPTOTOP|V_SNAPTORIGHT)
	end
end)
