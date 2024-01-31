-- MINIGAME.LUA
-- Code LeonardoTheMutant
--
-- Pong two-player duel minigame

local function PONG_PlaySFX(sfx)
    for p in players.iterate do if (p.minigame) then S_StartSound(nil,sfx,p) end end
end

local function PONG_Win(winner)
    if (winner) MM.duelplrs[winner].kills = $ + 1 end
    MM.pong.winner = winner
    MM.pong.wintimeout = 70
    PONG_PlaySFX(114)
end

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
        PONG_PlaySFX(204)
    end
    if (MM.pong.ball.y > 99) --bottom
        MM.pong.ball.y = 99
        MM.pong.velocity.y = -$
        PONG_PlaySFX(204)
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
    if ((MM.pong.ball.x >= 8) and (MM.pong.ball.x <= 10) and (MM.pong.ball.y >= MM.pong.pads[1]-1) and (MM.pong.ball.y <= (MM.pong.pads[1] + 16)))
        MM.pong.hits = $ + 1
        PONG_SetVelocity(1)
        if (MM.pong.hits%10 == 9) MM.pong.speed = $ + 1 end
        PONG_PlaySFX(205)
    end
    if ((MM.pong.ball.x >= 149) and (MM.pong.ball.x <= 152) and (MM.pong.ball.y >= MM.pong.pads[2]-1) and (MM.pong.ball.y <= (MM.pong.pads[2] + 16)))
        MM.pong.hits = $ + 1
        PONG_SetVelocity(-1)
        if (MM.pong.hits%10 == 9) MM.pong.speed = $ + 1 end
        PONG_PlaySFX(205)
    end
end

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
        elseif (MM.pong.pads[pad] > 84) MM.pong.pads[pad] = 84 end
    end
end

addHook("ThinkFrame", do
    if (gametype != GT_MURDERMYSTERY) return end
    if (MM.twopgame)
        if (PlayerCount() == 2) MM.duelplrs = MM_Get2Players() end
        if (not MM.duelplrs) return end
        if (MM.duelplrs[1].valid) and (MM.duelplrs[2].valid) and (MM.duelplrs[1].minigame) and (MM.duelplrs[2].minigame) MM.minigame=true
        else MM.minigame = false end
    end
    if (MM.minigame)
        if (MM.pong.wintimeout > -1) MM.pong.wintimeout = $ - 1
        else PONG_Thinker() end
        if (MM.pong.wintimeout == 0)
            MM.pong.winner = nil
            PONG_Reset()
            for p in players.iterate do if (p.minigame) S_StartSound(nil, sfx_gravch, p) end end
        end
    else
        MM.pong.winner = nil
        MM.pong.wintimeout = 70
    end
end)
addHook("PlayerThink", function(p)
    if (gametype!=GT_MURDERMYSTERY) return end
    if (p.cmd.buttons & BT_CUSTOM3) and (MM.twopgame)
        if (not p.custom3pressed)
            if (p.minigame) 
                if (not p.minigametimeout) p.minigame=false end
            else
                p.minigame = true
                p.minigametimeout = 105
            end
        end
        p.custom3pressed = true
    else p.custom3pressed = false end

    if (p.minigametimeout) and (p.minigametimeout>0) p.minigametimeout = $ - 1 end

    if (MM.minigame) and (p.minigame)
        if (MM.pong.winner == nil)
            --player inputs have to be somehow disabled without disabling TTT inputs
            PONG_ThinkCmd(p)
        end
        if (not p.spectator)
            p.mo.momx = 0
            p.mo.momy = 0
            p.mo.momz = 0
            p.mo.state = S_PLAY_STND
        end
    end
end)