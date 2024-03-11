-- MINIGAMES.LUA
-- Code LeonardoTheMutant
--
-- Murder Mystery minigames to not become bored

--
-- PONG MINIGAME
--
local function PONG_PlaySFX(sfx)
    for p in players.iterate do if (p.minigame) then S_StartSound(nil, sfx, p) end end
end

local function PONG_Win(winner)
    if (winner) MM.duelplrs[winner].kills = $ + 1 end
    MM.pong.winner = winner
    MM.pong.wintimeout = 70
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

    --paddles
    if ((MM.pong.ball.x >= 8) and (MM.pong.ball.x <= 10) and (MM.pong.ball.y >= MM.pong.pads[1] - 1) and (MM.pong.ball.y <= (MM.pong.pads[1] + 16)))
        MM.pong.hits = $ + 1
        PONG_SetVelocity(1)
		--increase ball speed each 10 hits
        if ((MM.pong.hits % 10) == 9) MM.pong.speed = $ + 1 end
        PONG_PlaySFX(sfx_mario2)
    end
    if ((MM.pong.ball.x >= 149) and (MM.pong.ball.x <= 152) and (MM.pong.ball.y >= MM.pong.pads[2] - 1) and (MM.pong.ball.y <= (MM.pong.pads[2] + 16)))
        MM.pong.hits = $ + 1
        PONG_SetVelocity(-1)
		--increase ball speed each 10 hits
        if ((MM.pong.hits % 10) == 9) MM.pong.speed = $ + 1 end
        PONG_PlaySFX(sfx_mario2)
    end
end

-- PONG input handler
local function PONG_ThinkCmd(p)
    if (p.cmd.forwardmove > 0) --up
        if (MM.duelplrs[1] == p) MM.pong.pads[1] = $ - 2
        elseif (MM.duelplrs[2] == p) MM.pong.pads[2] = $ - 2 end
    end

    if (p.cmd.forwardmove < 0) --down
        if (MM.duelplrs[1] == p) MM.pong.pads[1] = $ + 2
        elseif (MM.duelplrs[2] == p) MM.pong.pads[2] = $ + 2 end
    end

    --check if pads are out of bounds
    for pad = 1, 2 do
        if (MM.pong.pads[pad] < 0) MM.pong.pads[pad] = 0
        elseif (MM.pong.pads[pad] > 64) MM.pong.pads[pad] = 64 end
    end
end

--
-- SONIC RUN MINIGAME
--
local function SONIC_Reset(p)
    p.SonicRun = {
        score = 0,
        Y = 0,
        velocity = 0,
        jumpVelocity = 8,
        state = 0,
        timeout = 140
    }
end
local function SONIC_Thinker(p)
    if (p.SonicRun.timeout)
        p.SonicRun.state = 0
        p.SonicRun.timeout = $ - 1
        if (p.SonicRun.timeout > TICRATE)
            --if (not p.SonicRun.timeout % TICRATE) S_StartSound()
            return
        end
    end

    if (not p.SonicRun.Y)
        p.SonicRun.state = 1 --running

        if ((p.cmd.forwardmove > 0) or (p.cmd.buttons & BT_JUMP)) --up (jump)
            p.SonicRun.state = 2 --jump
            --p.SonicRun.velocity = jumpVelocity
        end

        if ((p.cmd.forwardmove < 0) or (p.cmd.buttons & BT_SPIN)) --down (spin)
            p.SonicRun.state = 2 --spin
        end
    else
        --p.SonicRun.velocity = $ + gravity
    end

    --p.SonicRun.Y = 0
    p.SonicRun.score = $ + 1
end

--global Pong thinker
addHook("ThinkFrame", do
    if (gametype != GT_MURDERMYSTERY) return end
    if (MM.twopgame)
        if (PlayerCount() == 2) MM.duelplrs = MM_Get2Players() end
        if (not MM.duelplrs) return end
        if (MM.duelplrs[1].valid) and (MM.duelplrs[2].valid) and (MM.duelplrs[1].minigame) and (MM.duelplrs[2].minigame) MM.minigame = true
        else MM.minigame = false end
    end
    if (MM.minigame)
        if (MM.pong.wintimeout > -1) MM.pong.wintimeout = $ - 1
        else PONG_Thinker() end
        if (MM.pong.wintimeout == 0)
            MM.pong.winner = nil
            PONG_Reset()
            PONG_PlaySFX(sfx_gravch)
        end
    else
        MM.pong.winner = nil
        MM.pong.wintimeout = 70
    end
end)

--Player Thinker (Pong inputs, Sonic Run Thinker for each player)
addHook("PlayerThink", function(p)
    if (gametype != GT_MURDERMYSTERY) return end

    --Player's minigame toggle
    if (p.cmd.buttons & BT_CUSTOM3) and ((MM.twopgame) or (p.spectator) or (PlayerCount() == 1))
        if (not p.custom3pressed)
            if (p.minigame)
                if (not p.minigametimeout) p.minigame=false end
            else
                p.minigame = true
                p.minigametimeout = 105
                SONIC_Reset(p)
            end
        end
        p.custom3pressed = true
    else p.custom3pressed = false end

    --timeout logic
    if (p.minigametimeout) and (p.minigametimeout > 0) p.minigametimeout = $ - 1 end

    --Player is in minigame state
    if (p.minigame)
        if ((MM.minigame) and (MM.twopgame)) --PONG
            if (MM.pong.winner == nil) PONG_ThinkCmd(p) end
            --Disable player movement (kinda)
            if ((p.realmo) and (p.realmo.valid))
                p.realmo.momx = 0
                p.realmo.momy = 0
                p.realmo.state = S_PLAY_STND
            end
        elseif ((p.spectator) or (PlayerCount() == 1)) --SONIC RUN
            SONIC_Thinker(p)
            if ((p.realmo) and (p.realmo.valid))
                p.realmo.momx = 0
                p.realmo.momy = 0
                p.realmo.momz = 0
                p.realmo.state = S_PLAY_STND
            end
        end
    end
end)
