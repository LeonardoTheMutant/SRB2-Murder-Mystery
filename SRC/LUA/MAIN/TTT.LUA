-- TTT.LUA
-- Code LeonardoTheMutant
--
-- The TicTacToe two-player duel minigame

addHook("PlayerThink", function(p)
    if (gametype!=GT_MURDERMYSTERY) return end
    if (MM.twopgame)
        if (PlayerCount()==2) MM.duelplrs=Get2Players() end
        if (MM.duelplrs[1].minigame) and (MM.duelplrs[2].minigame) MM.minigame=true
        else MM.minigame=false end
    end
    if (p.cmd.buttons&BT_CUSTOM3)
        if (not p.custom3pressed)
            if (p.minigame) p.minigame=false --I tried to do !p.minigame but this is not C
            else p.minigame=true end
        end
        p.custom3pressed = true
    else p.custom3pressed = false end
end)