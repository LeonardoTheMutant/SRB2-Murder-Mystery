-- MINIGAMES.LUA
-- Code by LeonardoTheMutant
--
-- Murder Mystery minigames to not become bored

--
-- PONG MINIGAME
--
local function MM_Get2Players()
	if (PlayerCount() != 2) return end
    local plrs = {}
	for p in players.iterate
		plrs[#plrs + 1] = p
		if (#plrs == 2) break end
	end
    return plrs
end

local function PONG_PlaySFX(sfx)
    for p in players.iterate do if (p.mm.minigame) then S_StartSound(nil, sfx, p) end end
end

local function PONG_Win(winner)
    if (winner) MM.duelplrs[winner].mm.kills = $ + 1 end
    MM.pong.winner = winner
    MM.pong.timeout = 70
    PONG_PlaySFX(sfx_lvpass)
end

--PONG main logic
local function PONG_Thinker()
    --Move ball
    for frame = 1, MM.pong.speed do --speed works like frameskip for ball
        MM.pong.ball.x = $ + MM.pong.velocity.x
        MM.pong.ball.y = $ + MM.pong.velocity.y
    end

    --COLLISION CHECK
    --bounds
    if (MM.pong.ball.y < 0) --top
        MM.pong.ball.y = 0
        MM.pong.velocity.y = -$
        PONG_PlaySFX(sfx_mario1)
    end
    if (MM.pong.ball.y > 79) --bottom
        MM.pong.ball.y = 79
        MM.pong.velocity.y = -$
        PONG_PlaySFX(sfx_mario1)
    end
    if (MM.pong.ball.x < 0) --left side
        MM.pong.velocity.x = 0
        MM.pong.velocity.y = 0
        PONG_Win(2)
    end
    if (MM.pong.ball.x >= 160) --right side
        MM.pong.velocity.x = 0
        MM.pong.velocity.y = 0
        PONG_Win(1)
    end

    --check if paddles are out of bounds
    for pad = 1, 2 do
        if (MM.pong.pads[pad] < 0) MM.pong.pads[pad] = 0
        elseif (MM.pong.pads[pad] > 64) MM.pong.pads[pad] = 64 end
    end

    --ball & paddles collision
    if ((MM.pong.ball.x >= 8) and (MM.pong.ball.x <= 10) and (MM.pong.ball.y >= MM.pong.pads[1] - 1) and (MM.pong.ball.y <= (MM.pong.pads[1] + 16)))
        MM.pong.hits = $ + 1
        PONG_SetVelocity(1)
        if ((MM.pong.hits % 10) == 9) MM.pong.speed = $ + 1 end --increase the ball's speed every 10 hits
        PONG_PlaySFX(sfx_mario2)
    end
    if ((MM.pong.ball.x >= 149) and (MM.pong.ball.x <= 152) and (MM.pong.ball.y >= MM.pong.pads[2] - 1) and (MM.pong.ball.y <= (MM.pong.pads[2] + 16)))
        MM.pong.hits = $ + 1
        PONG_SetVelocity(-1)
        if ((MM.pong.hits % 10) == 9) MM.pong.speed = $ + 1 end --increase the ball's speed every 10 hits
        PONG_PlaySFX(sfx_mario2)
    end
end

-- PONG input handler
local function PONG_ThinkCmd(p)
    --Paddle controls, supports analog controls from joypads (kinda)
    if (PONG_GetMySlot(p)) --You are one of the duel players
        MM.pong.pads[PONG_GetMySlot(p)] = $ - (p.cmd.forwardmove / 24)
    end
end

--
-- SONIC RUN MINIGAME
--
local function SONIC_Reset(p)
    p.SonicRun = {
        active = 1,
        score = 0,
        Y = 0,
        Height = 20,
        velocity = 0,
        state = 0,
        timeout = 141,
        hazards = {},
        hazardsTimeout = 0,
        background = P_RandomKey(3)
    }
end

--
-- Main SONIC RUN logic & input handler
--
local function SONIC_Thinker(p)
    if (p.SonicRun.Y < 1) --touching the ground?
        p.SonicRun.state = 1 --running
        p.SonicRun.velocity = 0

        --controls
        if ((p.cmd.forwardmove > 0) or (p.cmd.buttons & BT_JUMP)) --FORWARD/JUMP (jump)
            p.SonicRun.state = 2 --spinning (jump/spin)
            p.SonicRun.velocity = 10
            S_StartSound(nil, sfx_cdfm02, p)
        elseif ((p.cmd.forwardmove < 0) or (p.cmd.buttons & BT_SPIN)) --BACKWARD/SPIN (spin)
            p.SonicRun.state = 2 --spinning (jump/spin)
            if (not p.SonicRun.spinsound) S_StartSound(nil, sfx_spin, p) end
			p.SonicRun.spinsound = 1
        else p.SonicRun.spinsound = 0 end
    else p.SonicRun.velocity = $ - 1 end

    --adjust Sonic's hitbox
    if (p.SonicRun.state == 2) p.SonicRun.Height = 14
    else p.SonicRun.Height = 20 end

    p.SonicRun.Y = $ + p.SonicRun.velocity
    --reposition Sonic so he doesn't move underground
    while (p.SonicRun.Y < 0) p.SonicRun.Y = $ + 1 end

    p.SonicRun.score = $ + 1

    --
    -- Hazard logic
    --
    p.SonicRun.hazardsTimeout = $ - 1

    --hazard spawning
    if (p.SonicRun.hazardsTimeout <= 0)
        local hazardType = P_RandomKey(8)
        if (hazardType == 0)
            table.insert(p.SonicRun.hazards, {x = 192, y = 0})
        elseif (hazardType == 1)
            table.insert(p.SonicRun.hazards, {x = 192, y = 16})
        elseif (hazardType == 2)
            table.insert(p.SonicRun.hazards, {x = 192, y = 32})
        elseif (hazardType == 3)
            table.insert(p.SonicRun.hazards, {x = 192, y = 0})
            table.insert(p.SonicRun.hazards, {x = 192, y = 16})
        elseif (hazardType == 4)
            table.insert(p.SonicRun.hazards, {x = 192, y = 16})
            table.insert(p.SonicRun.hazards, {x = 192, y = 32})
        elseif (hazardType == 5)
            table.insert(p.SonicRun.hazards, {x = 192, y = 32})
            table.insert(p.SonicRun.hazards, {x = 192, y = 48})
        elseif (hazardType == 6)
            table.insert(p.SonicRun.hazards, {x = 192, y = 16})
            table.insert(p.SonicRun.hazards, {x = 192, y = 32})
            table.insert(p.SonicRun.hazards, {x = 192, y = 48})
        elseif (hazardType == 7)
            table.insert(p.SonicRun.hazards, {x = 192, y = 0})
            table.insert(p.SonicRun.hazards, {x = 192, y = 16})
            table.insert(p.SonicRun.hazards, {x = 192, y = 32})
        end
        p.SonicRun.hazardsTimeout = (P_RandomKey(2) << 4) + 18
    end

    --hazards thinker and collision
    for id = 1, #p.SonicRun.hazards do
        if (p.SonicRun.hazards[id])
            --I have no idea why hazards desync in their movement
            p.SonicRun.hazards[id].x = $ - 5 --move

            if ((((p.SonicRun.hazards[id].x + 16) >= 16) and (p.SonicRun.hazards[id].x <= 20)) and (((p.SonicRun.hazards[id].y + 16) >= p.SonicRun.Y) and (p.SonicRun.hazards[id].y <= (p.SonicRun.Y + p.SonicRun.Height))))
                --die
                p.SonicRun.active = 0
            elseif (p.SonicRun.hazards[id].x < -15) --out of bounds
                table.remove(p.SonicRun.hazards, id)
            end
        end
    end
end

--global Pong thinker
addHook("ThinkFrame", do
    if (gametype != GT_LTMMURDERMYSTERY) return end
    if (MM.twopgame)
        if (PlayerCount() == 2) and (not MM.duelplrs) then MM.duelplrs = MM_Get2Players() end

        if ((not MM.duelplrs) or (not MM.duelplrs[1]) or (not MM.duelplrs[2])) return end

        if valid(MM.duelplrs[1]) and valid(MM.duelplrs[2]) and (MM.duelplrs[1].mm.minigame) and (MM.duelplrs[2].mm.minigame) MM.minigame = true
        else MM.minigame = false end
    end
    if (MM.minigame)
        if (MM.pong.timeout > -1) MM.pong.timeout = $ - 1
        else PONG_Thinker() end
        if (MM.pong.timeout == 0)
            MM.pong.winner = nil
            PONG_Reset()
            PONG_PlaySFX(sfx_gravch)
        end
    else
        MM.pong.winner = nil
        MM.pong.timeout = 70
    end
end)

--Player Thinker (Pong inputs, Sonic Run Thinker for each player)
addHook("PlayerThink", function(p)
    if (gametype != GT_LTMMURDERMYSTERY) return end

    --Player's minigame toggle
    if (p.cmd.buttons & BT_CUSTOM3) and ((MM.twopgame) or (p.spectator) or (PlayerCount() == 1))
		if ((p.mm.help) and (p.mm.help.active)) return end
        if (not (p.lastbuttons & BT_CUSTOM3))
            if (p.mm.minigame) --Disable minigame
                if (not p.mm.minigame.timeout) p.mm.minigame = nil end --Disable only when the timeout timer is out
                if (MM.minigame and PONG_GetMySlot(p)) --PONG-specific code
                    MM.duelplrs[1].mm.minigame = nil
                    MM.duelplrs[2].mm.minigame = nil
                    MM.pong.pads[1] = 32
                    MM.pong.pads[2] = 32
                end
            else --Enable minigame
                p.mm.minigame = {timeout = 105}
                SONIC_Reset(p)
            end
        end
    end

    --CUSTOM3 timeout logic
    if ((p.mm.minigame) and (p.mm.minigame.timeout)) p.mm.minigame.timeout = $ - 1 end

    --Player is in minigame state
    if (p.mm.minigame)
        if ((MM.minigame) and (MM.twopgame)) --PONG
            if (MM.pong.timeout < 0) PONG_ThinkCmd(p) end
            --Disable player movement (kinda)
            if (valid(p.realmo))
                p.realmo.momx = 0
                p.realmo.momy = 0
                p.realmo.state = S_PLAY_STND
            end
        elseif ((p.spectator) or (PlayerCount() == 1)) --SONIC RUN
            if (p.SonicRun.timeout)
                p.SonicRun.timeout = $ - 1
                if (p.SonicRun.timeout > TICRATE)
                    p.SonicRun.state = 0
                    if (not (p.SonicRun.timeout % TICRATE)) S_StartSound(nil, sfx_s3ka7, p) end
                elseif (p.SonicRun.timeout == TICRATE) S_StartSound(nil, sfx_s3kad, p) end
            end
            if ((p.SonicRun.active) and (not (p.SonicRun.timeout / TICRATE))) SONIC_Thinker(p) end
			p.powers[pw_nocontrol] = 1
        end
    end
end)
