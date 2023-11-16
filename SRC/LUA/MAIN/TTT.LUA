-- TTT.LUA
-- Code LeonardoTheMutant
--
-- The TicTacToe two-player duel minigame

local function TTT_ToggleTurn()
    if (MM.ttt.turn==1) MM.ttt.turn=2
    elseif (MM.ttt.turn==2) MM.ttt.turn=1 end
    MM.ttt.turntime=350
end

local function TTT_Win(winner)
    if (winner!=0)
        if (MM.duelplrs[1].role==winner) MM.duelplrs[1].kills=$+1
        elseif (MM.duelplrs[2].role==winner) MM.duelplrs[2].kills=$+1 end
    end
    MM.ttt.winner=winner
    MM.ttt.wintimeout=70
    for p in players.iterate do S_StartSound(nil,114,p) end
end

local function TTT_CheckBoard()
    local filled=0
    for i=1,9 if (MM.ttt.board[i]) filled=$+1 end end --how many cells are filled
    local b = MM.ttt.board
    if ((b[1]==1) and (b[2]==1) and (b[3]==1)) or ((b[4]==1) and (b[5]==1) and (b[6]==1)) or 
    ((b[7]==1) and (b[8]==1) and (b[9]==1)) or ((b[1]==1) and (b[4]==1) and (b[7]==1)) or 
    ((b[2]==1) and (b[5]==1) and (b[8]==1)) or ((b[3]==1) and (b[6]==1) and (b[9]==1)) or 
    ((b[1]==1) and (b[5]==1) and (b[9]==1)) or ((b[3]==1) and (b[5]==1) and (b[7]==1))
        TTT_Win(1)
    elseif ((b[1]==2) and (b[2]==2) and (b[3]==2)) or ((b[4]==2) and (b[5]==2) and (b[6]==2)) or 
    ((b[7]==2) and (b[8]==2) and (b[9]==2)) or ((b[1]==2) and (b[4]==2) and (b[7]==2)) or 
    ((b[2]==2) and (b[5]==2) and (b[8]==2)) or ((b[3]==2) and (b[6]==2) and (b[9]==2)) or 
    ((b[1]==2) and (b[5]==2) and (b[9]==2)) or ((b[3]==2) and (b[5]==2) and (b[7]==2))
        TTT_Win(2)
    elseif (filled==9) TTT_Win(0)
    else TTT_ToggleTurn() end
end

local function TTT_ThinkCmd(p)
    if (MM.duelplrs[MM.ttt.turn]==p) and (MM.ttt.winner==nil)
        if (p.cmd.forwardmove>0) --up
            if (not p.uppressed)
                MM.ttt.cursor=$-3
                S_StartSound(nil,167,p)
                if (MM.ttt.cursor<1) MM.ttt.cursor=$+9 end
            end
            p.uppressed=true
        else p.uppressed=false end

        if (p.cmd.forwardmove<0) --down
            if (not p.downpressed)
                MM.ttt.cursor=$+3
                S_StartSound(nil,167,p)
                if (MM.ttt.cursor>9) MM.ttt.cursor=$-9 end
            end
            p.downpressed=true
        else p.downpressed=false end

        if (p.cmd.sidemove>0) --right
            if (not p.rightpressed)
                MM.ttt.cursor=$+1
                S_StartSound(nil,167,p)
                if (MM.ttt.cursor>9) MM.ttt.cursor=$-9 end
            end
            p.rightpressed=true
        else p.rightpressed=false end

        if (p.cmd.sidemove<0) --left
            if (not p.leftpressed)
                MM.ttt.cursor=$-1
                S_StartSound(nil,167,p)
                if (MM.ttt.cursor<1) MM.ttt.cursor=$+9 end
            end
            p.leftpressed=true
        else p.leftpressed=false end

        if (p.cmd.buttons&(BT_JUMP|BT_ATTACK))
            if (not p.setbtnpressed)
                if (not MM.ttt.board[MM.ttt.cursor])
                    MM.ttt.board[MM.ttt.cursor]=p.role
                    S_StartSound(nil,139,p)
                    TTT_CheckBoard()
                else S_StartSound(nil,678,p) end
            end
            p.setbtnpressed=true
        else p.setbtnpressed=false end
    end
end

local function TTT_GetRandomFreeCell()
    local cell
    repeat cell=P_RandomKey(9)+1 until (MM.ttt.board[cell]==0)
    return cell
end

addHook("ThinkFrame", do
    if (gametype!=GT_MURDERMYSTERY) return end
    if (MM.twopgame)
        if (PlayerCount()==2) MM.duelplrs=MM_Get2Players() end
        if (MM.duelplrs[1].valid) and (MM.duelplrs[2].valid) and (MM.duelplrs[1].minigame) and (MM.duelplrs[2].minigame) MM.minigame=true
        else MM.minigame=false end
    end
    if (MM.minigame)
        if (MM.ttt.winner==nil) MM.ttt.turntime=$-1 end
        if (MM.ttt.turntime<1) and (MM.ttt.winner==nil)
            MM.ttt.board[TTT_GetRandomFreeCell()]=MM.duelplrs[MM.ttt.turn].role
            S_StartSound(nil,139,p)
            TTT_CheckBoard()
        end
        if (MM.ttt.wintimeout>-1) MM.ttt.wintimeout=$-1 end
        if (MM.ttt.wintimeout==0)
            if (MM.duelplrs[1].kills==CV_FindVar("MMTTTLIMIT").value) MM_EndRound(MM.duelplrs[1].role)
            elseif (MM.duelplrs[2].kills==CV_FindVar("MMTTTLIMIT").value) MM_EndRound(MM.duelplrs[2].role) end
            MM.ttt.winner=nil
            MM.ttt.turntime=350
            TTT_ResetBoard()
            for p in players.iterate do if (p.minigame) S_StartSound(nil,279,p) end end
        end
    else
        TTT_ResetBoard()
        MM.ttt.turntime=350
        MM.ttt.winner=nil
        MM.ttt.wintimeout=0
    end
end)
addHook("PlayerThink", function(p)
    if (gametype!=GT_MURDERMYSTERY) return end
    if (p.cmd.buttons&BT_CUSTOM3) and (MM.twopgame)
        if (not p.custom3pressed)
            if (p.minigame) 
                if (not p.minigametimeout) p.minigame=false end
            else
                p.minigame=true
                p.minigametimeout=105
            end
        end
        p.custom3pressed = true
    else p.custom3pressed = false end

    if (p.minigametimeout) and (p.minigametimeout>0) p.minigametimeout=$-1 end

    if (MM.minigame) and (p.minigame)
        if (MM.ttt.winner==nil)
            --player inputs have to be somehow disabled without disabling TTT inputs
            TTT_ThinkCmd(p)
        end
        if (not p.spectator)
            p.mo.momx = 0
            p.mo.momy = 0
            p.mo.momz = 0
            p.mo.state = S_PLAY_STND
        end
    end
end)