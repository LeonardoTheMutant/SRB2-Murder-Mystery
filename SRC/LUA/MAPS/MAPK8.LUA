-- The 8-Ball Hotel (MAPK8)
-- Level script
--
-- Original map by SuperOfSRB2 & LeonardoTheMutant
-- Remake by LeonardoTheMutant

local MAPNUM = 468 --MAPK8


--
-- THE 8-BALL
--
freeslot("MT_8BALL", "S_8BALL", "SPR_8BAL")

mobjinfo[MT_8BALL] = {
    --$Title 8-Ball
    --$Sprite 8BALA0
    --$Flags8Text Static?
    --$Arg0 Static?
    --$Arg0Type 11
    --$Arg0Enum {0="False"; 2="True";}
    --$NotAngled
    doomednum = 468,
    spawnstate = S_8BALL,
    speed = 786432, --12*FU
    radius = 1048576, --16*FU
    height = 2097152, --32*FU
    activesound = sfx_statu2,
    flags = MF_SOLID|MF_SLIDEME|MF_PUSHABLE
}

states[S_8BALL] = {SPR_8BAL, 0, -1, nil, 0, 0, S_8BALL} -- S_RJETGLOOK1

addHook("MapThingSpawn", function(mobj, mapthing)
    if (mapthing.options & MTF_AMBUSH) then mobj.flags = mobj.flags & ~MF_PUSHABLE end
end, MT_8BALL)



--
-- ELEVATORS
--
freeslot("MT_ELEVATOR", "MT_ELEVATORBTN")

local ELEVATOR_RADIUS = 8388608 --128*FU

mobjinfo[MT_ELEVATOR] = {
    --$Title Elevator hitbox
    --$Arg0 Elevator ID
    radius = ELEVATOR_RADIUS,
    doomednum = 8171,
    spawnstate = S_INVISIBLE
}

mobjinfo[MT_ELEVATORBTN] = {
    --$Title Elevator call button
    --$Arg0 Elevator ID
    --$Arg1 Floor
    --Angled
    doomednum = 8172,
    spawnstate = S_INVISIBLE,
    radius = 2097152, --32*FU
    height = 4194304, --64*FU
    flags = 1
}



--
-- Elevator Operands
--
local ELEVATOR_CONFIRM = 0 --Do not execute next instructions until "Finished moving Doors/Lift" signal is recieved
local ELEVATOR_WAIT = 1 --Wait X tics
local ELEVATOR_OPEN = 2 --Open doors at floor
local ELEVATOR_CLOSE = 3 --Close doors at floor
local ELEVATOR_MOVE = 4 --Move to floor



local ELEVATORS = {}
ELEVATORS[0] = {stack = {}, floor = 0, doors = false, mo = nil}
ELEVATORS[1] = {stack = {}, floor = 0, doors = false, mo = nil}
addHook("NetVars", function(n)
    ELEVATORS = n(ELEVATORS)
end)

--
-- Map Load
--
addHook("MapLoad", function(map)
    if (map ~= MAPNUM) then return end

    ELEVATORS = {}
    ELEVATORS[0] = {stack = {}, floor = 0, doors = false, mo = nil}
    ELEVATORS[1] = {stack = {}, floor = 0, doors = false, mo = nil}
end)

local function E_OpenElevatorDoors(id, floor)
    if (floor == 0) then
        if (id == 0) then
            P_LinedefExecute(214) --Elevator door
            P_LinedefExecute(221) --Floor door
        elseif (id == 1) then
            P_LinedefExecute(261) --Floor door
            P_LinedefExecute(263) --Elevator door
        end
    elseif (floor == 1) then
        if (id == 0) then
            P_LinedefExecute(223)
            P_LinedefExecute(225)
        elseif (id == 1) then
            P_LinedefExecute(265)
            P_LinedefExecute(267)
        end
    elseif (floor == 2) then
        if (id == 0) then
            P_LinedefExecute(228)
            P_LinedefExecute(230)
        elseif (id == 1) then
            P_LinedefExecute(271)
            P_LinedefExecute(273)
        end
    elseif (floor == 3) then
        if (id == 0) then
            P_LinedefExecute(233)
            P_LinedefExecute(235)
        elseif (id == 1) then
            P_LinedefExecute(276)
            P_LinedefExecute(278)
        end
    elseif (floor == 4) then
        if (id == 0) then
            P_LinedefExecute(238)
            P_LinedefExecute(240)
        elseif (id == 1) then
            P_LinedefExecute(281)
            P_LinedefExecute(283)
        end
    end
end

local function E_CloseElevatorDoors(id, floor)
    if (floor == 0) then
        if (id == 0) then
            P_LinedefExecute(215) --Elevator door
            P_LinedefExecute(222) --Floor door
        elseif(id == 1) then
            P_LinedefExecute(262) --Floor door
            P_LinedefExecute(264) --Elevator door
        end
    elseif (floor == 1) then
        if (id == 0) then
            P_LinedefExecute(224)
            P_LinedefExecute(226)
        elseif(id == 1) then
            P_LinedefExecute(266)
            P_LinedefExecute(268)
        end
    elseif (floor == 2) then
        if (id == 0) then
            P_LinedefExecute(229)
            P_LinedefExecute(231)
        elseif (id == 1) then
            P_LinedefExecute(272)
            P_LinedefExecute(274)
        end
    elseif (floor == 3) then
        if (id == 0) then
            P_LinedefExecute(234)
            P_LinedefExecute(236)
        elseif (id == 1) then
            P_LinedefExecute(277)
            P_LinedefExecute(279)
        end
    elseif (floor == 4) then
        if (id == 0) then
            P_LinedefExecute(239)
            P_LinedefExecute(241)
        elseif (id == 1) then
            P_LinedefExecute(282)
            P_LinedefExecute(284)
        end
    end
end

local function E_MoveElevator(id, floor)
    if (id == 0) then
        if (floor == 0) then
            P_LinedefExecute(213)
        elseif (floor == 1) then
            P_LinedefExecute(227)
        elseif (floor == 2) then
            P_LinedefExecute(232)
        elseif (floor == 3) then
            P_LinedefExecute(237)
        elseif (floor == 4) then
            P_LinedefExecute(242)
        end
    elseif (id == 1) then
        if (floor == 0) then
            P_LinedefExecute(255)
        elseif (floor == 1) then
            P_LinedefExecute(269)
        elseif (floor == 2) then
            P_LinedefExecute(270)
        elseif (floor == 3) then
            P_LinedefExecute(275)
        elseif (floor == 4) then
            P_LinedefExecute(280)
        end
    end
end

local function E_CallElevator(id, floor)
    if (ELEVATORS[id].floor ~= floor) then --If on another floor
        if (ELEVATORS[id].doors) then --Close doors if open
            table.insert(ELEVATORS[id].stack, {cmd = ELEVATOR_CLOSE, param = ELEVATORS[id].floor}) --Close doors where you currently are
        end
        table.insert(ELEVATORS[id].stack, {cmd = ELEVATOR_MOVE, param = floor}) --Move to specified floor
    end
    table.insert(ELEVATORS[id].stack, {cmd = ELEVATOR_OPEN, param = floor}) --Open the doors on that floor
    if (ELEVATORS[id].floor ~= floor)
        table.insert(ELEVATORS[id].stack, {cmd = ELEVATOR_WAIT, param = 70}) --Wait 2 seconds before doing anything else
    end
end

--Elevator 0 has finished vertical movement
addHook("LinedefExecute", function()
    if (ELEVATORS[0].stack[1].cmd == ELEVATOR_CONFIRM) then
        ELEVATORS[0].floor = ELEVATORS[0].stack[1].param
        S_StartSound(ELEVATORS[0].mo, sfx_eleva3)
        table.remove(ELEVATORS[0].stack, 1)
    end
end,"EL_F_MOV0")

--Elevator 0 has finished door movement
addHook("LinedefExecute", function()
    if (ELEVATORS[0].stack[1].cmd == ELEVATOR_CONFIRM) then
        ELEVATORS[0].doors = not ELEVATORS[0].doors
        table.remove(ELEVATORS[0].stack, 1)
    end
end,"EL_F_DOR0")

--Elevator 1 has finished vertical movement
addHook("LinedefExecute", function()
    if (ELEVATORS[1].stack[1].cmd == ELEVATOR_CONFIRM) then
        ELEVATORS[1].floor = ELEVATORS[1].stack[1].param
        S_StartSound(ELEVATORS[1].mo, sfx_eleva3)
        table.remove(ELEVATORS[1].stack, 1)
    end
end,"EL_F_MOV1")

--Elevator 1 has finished door movement
addHook("LinedefExecute", function()
    if (ELEVATORS[1].stack[1].cmd == ELEVATOR_CONFIRM) then
        ELEVATORS[1].doors = not ELEVATORS[1].doors
        table.remove(ELEVATORS[1].stack, 1)
    end
end,"EL_F_DOR1")

--
-- MapThing Spawn
--
addHook("MapThingSpawn", function(mo, thing)
    local id = tonumber(thing.args[0]) or 0
    mo.elevatorid = id
    MM.DebugPrint(string.format("Elevator hitbox spawned at %d %d %d with args %s", FixedInt(mo.x), FixedInt(mo.y), FixedInt(mo.z), thing.args[0]))
end, MT_ELEVATOR)

addHook("MapThingSpawn", function(mo, thing)
    mo.elevatorid = tonumber(thing.args[0]) or 0
    mo.floor = tonumber(thing.args[1]) or 0
    ELEVATORS[mo.elevatorid].mo = mo
    MM.DebugPrint(string.format("Elevator button spawned at %d %d %d with args %s %s", FixedInt(mo.x), FixedInt(mo.y), FixedInt(mo.z), thing.args[0], thing.args[1]))
end, MT_ELEVATORBTN)



local SHOW_OVERLAY = 0

--
-- Elevator & Elevator Call Button controls
--
addHook("PreThinkFrame", function()
    SHOW_OVERLAY = 0
end)

addHook("MobjThinker", function(mo)
    searchBlockmap("objects", function(ref, found)
        if (found.type == MT_PLAYER) and (not found.player.spectator) and (R_PointToDist2(ref.x, ref.y, found.x, found.y) < ELEVATOR_RADIUS) then
            local p = found.player
            if (not ELEVATORS[ref.elevatorid].stack[1]) then
                if (p == consoleplayer) then SHOW_OVERLAY = 1 end
                if (p.cmd.buttons & BT_SPIN) then
                    if ((p.cmd.buttons & BT_WEAPONMASK) == 1) then
                        E_CallElevator(ref.elevatorid, 0)
                    elseif ((p.cmd.buttons & BT_WEAPONMASK) == 2) then
                        E_CallElevator(ref.elevatorid, 1)
                    elseif ((p.cmd.buttons & BT_WEAPONMASK) == 3) then
                        E_CallElevator(ref.elevatorid, 2)
                    elseif ((p.cmd.buttons & BT_WEAPONMASK) == 4) then
                        E_CallElevator(ref.elevatorid, 3)
                    elseif ((p.cmd.buttons & BT_WEAPONMASK) == 5) then
                        E_CallElevator(ref.elevatorid, 4)
                    end
                end
            end
        end
    end, mo, mo.x - ELEVATOR_RADIUS, mo.x + ELEVATOR_RADIUS, mo.y - ELEVATOR_RADIUS, mo.y + ELEVATOR_RADIUS)
end, MT_ELEVATOR)

addHook("TouchSpecial", function(ref, found)
    if (found.type == MT_PLAYER) and (not found.player.spectator) and (AngleDiff(found.angle, ref.angle) < ANGLE_45) then
        local p = found.player
        if (not ELEVATORS[ref.elevatorid].stack[1]) and ((ELEVATORS[ref.elevatorid].floor ~= ref.floor) or ((ELEVATORS[ref.elevatorid].floor == ref.floor) and not ELEVATORS[ref.elevatorid].doors)) then
            if (p == consoleplayer) then SHOW_OVERLAY = 2 end
            if (p.cmd.buttons & BT_CUSTOM1) then
                E_CallElevator(ref.elevatorid, ref.floor)
            end
        end
    end

    return true
end, MT_ELEVATORBTN)


-- Overlay renderer
hud.add(function(v)
    if (gamemap ~= MAPNUM) then return end

    if (SHOW_OVERLAY == 1) then
        v.drawString(160, 156, "\x87SPIN\x80 + \x87WEAPON 1-5\x80\nto move to a different floor", V_ALLOWLOWERCASE|V_RETURN8,  "center")
    elseif (SHOW_OVERLAY == 2) then
        v.drawString(160, 156, "\x87"+"CUSTOM1\x80 to call the elevator", V_ALLOWLOWERCASE, "center")
    end
end, "game")


--
-- ELEVATOR CPU
--
addHook("ThinkFrame", function()
    if (gamemap ~= MAPNUM) then return end

    for id = 0, 1 do
        if (ELEVATORS[id].stack[1]) then
            if (ELEVATORS[id].stack[1].cmd == ELEVATOR_WAIT) then --Wait
                if (ELEVATORS[id].stack[1].param) then
                    ELEVATORS[id].stack[1].param = ELEVATORS[id].stack[1].param - 1
                else
                    table.remove(ELEVATORS[id].stack, 1)
                end
            elseif (ELEVATORS[id].stack[1].cmd == ELEVATOR_OPEN) then --Open doors
                if (ELEVATORS[id].doors) --If doors open
                    table.remove(ELEVATORS[id].stack, 1) --Ignore
                else
                    E_OpenElevatorDoors(id, ELEVATORS[id].stack[1].param)
                    S_StartSound(ELEVATORS[id].mo, sfx_doorb1)
                    ELEVATORS[id].stack[1].cmd = ELEVATOR_CONFIRM
                end
            elseif (ELEVATORS[id].stack[1].cmd == ELEVATOR_CLOSE) then --Close doors
                if (ELEVATORS[id].doors) then --If doors open
                    E_CloseElevatorDoors(id, ELEVATORS[id].stack[1].param)
                    S_StartSound(ELEVATORS[id].mo, sfx_doora1)
                    ELEVATORS[id].stack[1].cmd = ELEVATOR_CONFIRM
                else
                    table.remove(ELEVATORS[id].stack, 1) --Ignore
                end
            elseif (ELEVATORS[id].stack[1].cmd == ELEVATOR_MOVE) then --Move to floor
                E_MoveElevator(id, ELEVATORS[id].stack[1].param)
                S_StartSound(ELEVATORS[id].mo, sfx_eleva1)
                ELEVATORS[id].stack[1].cmd = ELEVATOR_CONFIRM
            end
        end
    end
end)



--
-- DEBUG
--
-- COM_AddCommand("elevatorcmd", function(p, i, c, p)
--     table.insert(ELEVATORS[tonumber(i) or 0].stack, {cmd = tonumber(c) or ELEVATOR_WAIT, param = tonumber(p) or 0})
-- end)
-- hud.add(function(v)
--     for id = 0, 1 do
--         for i = 1, #ELEVATORS[id].stack do
--             if (ELEVATORS[id].stack[i].cmd == ELEVATOR_CONFIRM) then v.drawString(id * 48, i * 8, "CNF "+ ELEVATORS[id].stack[i].param)
--             elseif (ELEVATORS[id].stack[i].cmd == ELEVATOR_WAIT) then v.drawString(id * 48, i * 8, "TIM "+ ELEVATORS[id].stack[i].param)
--             elseif (ELEVATORS[id].stack[i].cmd == ELEVATOR_OPEN) then v.drawString(id * 48, i * 8, "OPN "+ ELEVATORS[id].stack[i].param)
--             elseif (ELEVATORS[id].stack[i].cmd == ELEVATOR_CLOSE) then v.drawString(id * 48, i * 8, "CLS "+ ELEVATORS[id].stack[i].param)
--             elseif (ELEVATORS[id].stack[i].cmd == ELEVATOR_MOVE) then v.drawString(id * 48, i * 8, "MOV "+ ELEVATORS[id].stack[i].param)
--             end
--         end
--     end
-- end)
