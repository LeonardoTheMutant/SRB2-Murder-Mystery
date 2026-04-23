-- MINIGAMES.LUA
-- Code by LeonardoTheMutant
--
-- Murder Mystery minigames to not become bored

--
-- PONG MINIGAME
--

local function PONG_PlaySFX(sfx)
	for p in players.iterate do if (p.mm.flags & FLAG_MINIGAME) then S_StartSound(nil, sfx, p) end end
end

local function PONG_Win(winner)
	if (winner) then MM.duelplrs[winner].mm.kills = MM.duelplrs[winner].mm.kills + 1 end
	MM.pong.winner = winner
	MM.pong.timeout = 70
	PONG_PlaySFX(sfx_lvpass)
end

--PONG main logic
local function PONG_Thinker()
	--check if paddles are out of bounds
	for pad = 1, 2 do
		if (MM.pong.pads[pad] < 0) then MM.pong.pads[pad] = 0
		elseif (MM.pong.pads[pad] > 64) then MM.pong.pads[pad] = 64 end
	end

	if (MM.pong.timeout) then
		MM.pong.timeout = MM.pong.timeout - 1
		if (not MM.pong.timeout) then
			MM.pong.winner = nil
			PONG_PlaySFX(sfx_chchng)
			PONG_Reset()
		end
	else
		--Move ball
		for frame = 1, MM.pong.speed do --speed works like frameskip for ball
			MM.pong.ball.x = MM.pong.ball.x + MM.pong.velocity.x
			MM.pong.ball.y = MM.pong.ball.y + MM.pong.velocity.y
		end

		--Ball collision check against walls
		if (MM.pong.ball.y < 0) then --top
			MM.pong.ball.y = 0
			MM.pong.velocity.y = -MM.pong.velocity.y
			PONG_PlaySFX(sfx_mario1)
		end
		if (MM.pong.ball.y > 79) then --bottom
			MM.pong.ball.y = 79
			MM.pong.velocity.y = -MM.pong.velocity.y
			PONG_PlaySFX(sfx_mario1)
		end
		if (MM.pong.ball.x < 0) then --left side
			MM.pong.velocity.x = 0
			MM.pong.velocity.y = 0
			PONG_Win(2)
		end
		if (MM.pong.ball.x > 158) then --right side
			MM.pong.velocity.x = 0
			MM.pong.velocity.y = 0
			PONG_Win(1)
		end

		--ball & paddles collision
		if ((MM.pong.ball.x >= 8) and (MM.pong.ball.x <= 10) and (MM.pong.ball.y >= MM.pong.pads[1] - 1) and (MM.pong.ball.y <= (MM.pong.pads[1] + 16))) then
			MM.pong.hits = MM.pong.hits + 1
			PONG_SetVelocity(1)
			if ((MM.pong.hits % 10) == 9) then MM.pong.speed = MM.pong.speed + 1 end --increase the ball's speed every 10 hits
			PONG_PlaySFX(sfx_mario2)
		end
		if ((MM.pong.ball.x >= 149) and (MM.pong.ball.x <= 152) and (MM.pong.ball.y >= MM.pong.pads[2] - 1) and (MM.pong.ball.y <= (MM.pong.pads[2] + 16))) then
			MM.pong.hits = MM.pong.hits + 1
			PONG_SetVelocity(-1)
			if ((MM.pong.hits % 10) == 9) then MM.pong.speed = MM.pong.speed + 1 end --increase the ball's speed every 10 hits
			PONG_PlaySFX(sfx_mario2)
		end
	end
end

-- PONG input handler
local function PONG_ThinkCmd(p)
	--Paddle controls, supports analog controls from joypads (kinda)
	if (PONG_GetMySlot(p)) then --You are one of the duel players
		MM.pong.pads[PONG_GetMySlot(p)] = MM.pong.pads[PONG_GetMySlot(p)] - (p.cmd.forwardmove / 24)
	end
end

--
-- SONIC RUN MINIGAME
--
rawset(_G, "SonicRun", {})
local function SONIC_Reset()
	SonicRun = {
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

local function SONIC_IntertHazard(height)
	table.insert(SonicRun.hazards, {192, height})
end

--
-- Main SONIC RUN logic & input handler
--
local function SONIC_Thinker()
	if (SonicRun.timeout) then
		SonicRun.timeout = SonicRun.timeout - 1
		if not (SonicRun.timeout % TICRATE) then
			if (SonicRun.timeout > TICRATE) then S_StartSound(nil, sfx_s3ka7, consoleplayer)
			elseif (SonicRun.timeout == TICRATE) then S_StartSound(nil, sfx_s3kad, consoleplayer) end
		end
	end

	if (not SonicRun.active) or (SonicRun.timeout > TICRATE) then return end

	if (SonicRun.Y < 1) then --touching the ground?
		SonicRun.state = 1 --running
		SonicRun.velocity = 0

		--controls
		if (consoleplayer.cmd.buttons & BT_JUMP) then --FORWARD/JUMP (jump)
			SonicRun.state = 2 --spinning (jump/spin)
			SonicRun.velocity = 10
			S_StartSound(nil, sfx_cdfm02, p)
		elseif (consoleplayer.cmd.buttons & BT_SPIN) then --BACKWARD/SPIN (spin)
			SonicRun.state = 2 --spinning (jump/spin)
			if (not SonicRun.spinsound) then S_StartSound(nil, sfx_spin, p) end
			SonicRun.spinsound = 1
		else SonicRun.spinsound = 0 end
	else SonicRun.velocity = SonicRun.velocity - 1 end

	--adjust Sonic's hitbox
	if (SonicRun.state == 2) then SonicRun.Height = 14
	else SonicRun.Height = 20 end

	SonicRun.Y = SonicRun.Y + SonicRun.velocity
	--reposition Sonic so he doesn't move underground
	while (SonicRun.Y < 0) do SonicRun.Y = SonicRun.Y + 1 end

	SonicRun.score = SonicRun.score + 1

	--
	-- Hazard logic
	--
	SonicRun.hazardsTimeout = SonicRun.hazardsTimeout - 1

	--hazard spawning
	if (SonicRun.hazardsTimeout <= 0) then
		switch(P_RandomKey(8), {
			[0] = function()
				SONIC_IntertHazard(0)
			end,
			[1] = function()
				SONIC_IntertHazard(16)
			end,
			[2] = function()
				SONIC_IntertHazard(32)
			end,
			[3] = function()
				SONIC_IntertHazard(0)
				SONIC_IntertHazard(16)
			end,
			[4] = function()
				SONIC_IntertHazard(16)
				SONIC_IntertHazard(32)
			end,
			[5] = function()
				SONIC_IntertHazard(32)
				SONIC_IntertHazard(48)
			end,
			[6] = function()
				SONIC_IntertHazard(16)
				SONIC_IntertHazard(32)
				SONIC_IntertHazard(48)
			end,
			[7] = function()
				SONIC_IntertHazard(0)
				SONIC_IntertHazard(16)
				SONIC_IntertHazard(32)
			end
		})
		SonicRun.hazardsTimeout = (P_RandomKey(2) * 16) + 18
	end

	--hazards thinker and collision
	for id = 1, #SonicRun.hazards do
		if (SonicRun.hazards[id]) then
			--I have no idea why hazards desync in their movement
			SonicRun.hazards[id][1] = SonicRun.hazards[id][1] - 5 --move

			if (((SonicRun.hazards[id][1] + 16) >= 16) and (SonicRun.hazards[id][1] <= 20))
			and (((SonicRun.hazards[id][2] + 16) >= SonicRun.Y) and (SonicRun.hazards[id][2] <= (SonicRun.Y + SonicRun.Height))) then
				--die
				SonicRun.active = 0
			elseif (SonicRun.hazards[id][1] < -15) then --out of bounds
				table.remove(SonicRun.hazards, id)
			end
		end
	end
end


--
-- MAIN LOGIC
--
local FLAG_M = FLAG_MINIGAME --load the global variable into local variables space
local C3_timeout

addHook("PreThinkFrame", function()
	if (gametype ~= GT_LTMMURDERMYSTERY) then return end

	for p in players.iterate do
		if (p.cmd.buttons & BT_CUSTOM3) and not (C3_timeout) then
			C3_timeout = 35
			if (p.mm.flags & FLAG_M) then
				--Disable minigame
				p.mm.flags = p.mm.flags & ~FLAG_M

				if (MM.twopgame) and (MM.minigame) and PONG_GetMySlot(p) then
					--Disable PONG if one of the duel players quit the minigame
					for plr in players.iterate do
						plr.mm.flags = plr.mm.flags & ~FLAG_M
						MM.ResetHUD(plr)
					end
					PONG_Reset()
					MM.minigame = false
					MM.pong.timeout = 70
				end
				MM.ResetHUD() --Restore HUD
			else
				if (MM.twopgame) or (p.spectator) then --Let players enable the Minigame state only when they are meant to
					--Enable minigame
					p.mm.flags = p.mm.flags | FLAG_M

					--Set the HUD rendering routine
					if (p.spectator) and (p == consoleplayer) then
						if (MM.minigame) then
							MM.hud.game.routine = MM.hud.routines["minigame_pong"]
						else
							--SONIC RUN
							SONIC_Reset()
							MM.hud.game.routine = MM.hud.routines["minigame_sonicrun"]
						end
					end
				end
			end
		end

		if (p.mm.flags & FLAG_M) then
			if (MM.twopgame) and (MM.minigame) then
				--PONG
				PONG_ThinkCmd(p)
				p.cmd.buttons = 0
				p.cmd.forwardmove = 0
				p.cmd.sidemove = 0
			elseif (p.spectator) and not (MM.minigame)
				--SONIC RUN
				SONIC_Thinker()
				p.cmd.buttons = 0
				p.cmd.forwardmove = 0
				p.cmd.sidemove = 0
			end
		end
	end
end)

addHook("ThinkFrame", function()
	if (gametype ~= GT_LTMMURDERMYSTERY) then return end

	if (MM.duelplrs) then
		if (valid(MM.duelplrs[1]) and (MM.duelplrs[1].mm.flags & FLAG_M))
		and (valid(MM.duelplrs[2]) and (MM.duelplrs[2].mm.flags & FLAG_M)) then
			MM.minigame = true
		else
			MM.minigame = false
		end
	end

	if (MM.twopgame) and (MM.minigame) then
		if (consoleplayer == MM.duelplrs[1]) or (consoleplayer == MM.duelplrs[2]) then
			MM.hud.game.routine = MM.hud.routines["minigame_pong"]
		end
		PONG_Thinker()
	end

	if (C3_timeout) then C3_timeout = C3_timeout - 1 end
end)
