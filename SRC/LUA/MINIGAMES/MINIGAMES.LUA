-- MINIGAMES.LUA
-- Code by LeonardoTheMutant
--
-- Murder Mystery minigames to not become bored

--
-- PONG MINIGAME
--
local function PONG_Get2Players()
	if (MM.PlayerCount() ~= 2) then return end
	local plrs = {}
	for p in players.iterate
		plrs[#plrs + 1] = p
		if (#plrs == 2) break end
	end
	return plrs
end

local function PONG_PlaySFX(sfx)
	for p in players.iterate do if (p.mm.flags & FLAG_MINIGAME) then S_StartSound(nil, sfx, p) end end
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
	if (MM.pong.ball.y < 0) then --top
		MM.pong.ball.y = 0
		MM.pong.velocity.y = -$
		PONG_PlaySFX(sfx_mario1)
	end
	if (MM.pong.ball.y > 79) then --bottom
		MM.pong.ball.y = 79
		MM.pong.velocity.y = -$
		PONG_PlaySFX(sfx_mario1)
	end
	if (MM.pong.ball.x < 0) then --left side
		MM.pong.velocity.x = 0
		MM.pong.velocity.y = 0
		PONG_Win(2)
	end
	if (MM.pong.ball.x >= 160) then --right side
		MM.pong.velocity.x = 0
		MM.pong.velocity.y = 0
		PONG_Win(1)
	end

	--check if paddles are out of bounds
	for pad = 1, 2 do
		if (MM.pong.pads[pad] < 0) then MM.pong.pads[pad] = 0
		elseif (MM.pong.pads[pad] > 64) then MM.pong.pads[pad] = 64 end
	end

	--ball & paddles collision
	if ((MM.pong.ball.x >= 8) and (MM.pong.ball.x <= 10) and (MM.pong.ball.y >= MM.pong.pads[1] - 1) and (MM.pong.ball.y <= (MM.pong.pads[1] + 16))) then
		MM.pong.hits = $ + 1
		PONG_SetVelocity(1)
		if ((MM.pong.hits % 10) == 9) then MM.pong.speed = $ + 1 end --increase the ball's speed every 10 hits
		PONG_PlaySFX(sfx_mario2)
	end
	if ((MM.pong.ball.x >= 149) and (MM.pong.ball.x <= 152) and (MM.pong.ball.y >= MM.pong.pads[2] - 1) and (MM.pong.ball.y <= (MM.pong.pads[2] + 16))) then
		MM.pong.hits = $ + 1
		PONG_SetVelocity(-1)
		if ((MM.pong.hits % 10) == 9) then MM.pong.speed = $ + 1 end --increase the ball's speed every 10 hits
		PONG_PlaySFX(sfx_mario2)
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
	if (SonicRun.Y < 1) then --touching the ground?
		SonicRun.state = 1 --running
		SonicRun.velocity = 0

		--controls
		if (p.cmd.buttons & BT_JUMP) then --FORWARD/JUMP (jump)
			SonicRun.state = 2 --spinning (jump/spin)
			SonicRun.velocity = 10
			S_StartSound(nil, sfx_cdfm02, p)
		elseif (p.cmd.buttons & BT_SPIN) then --BACKWARD/SPIN (spin)
			SonicRun.state = 2 --spinning (jump/spin)
			if (not SonicRun.spinsound) then S_StartSound(nil, sfx_spin, p) end
			SonicRun.spinsound = 1
		else SonicRun.spinsound = 0 end
	else SonicRun.velocity = $ - 1 end

	--adjust Sonic's hitbox
	if (SonicRun.state == 2) then SonicRun.Height = 14
	else SonicRun.Height = 20 end

	SonicRun.Y = SonicRun.Y + SonicRun.velocity
	--reposition Sonic so he doesn't move underground
	while (SonicRun.Y < 0) SonicRun.Y = $ + 1 end

	SonicRun.score = $ + 1

	--
	-- Hazard logic
	--
	SonicRun.hazardsTimeout = $ - 1

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
			SonicRun.hazards[id].x = $ - 5 --move

			if (((SonicRun.hazards[id].x + 16) >= 16) and (SonicRun.hazards[id].x <= 20))
			and (((SonicRun.hazards[id].y + 16) >= SonicRun.Y) and (SonicRun.hazards[id].y <= (SonicRun.Y + SonicRun.Height))) then
				--die
				SonicRun.active = 0
			elseif (SonicRun.hazards[id].x < -15) --out of bounds
				table.remove(SonicRun.hazards, id)
			end
		end
	end
end

--global Pong thinker
addHook("ThinkFrame", do
	if (gametype ~= GT_LTMMURDERMYSTERY) return end
	if (MM.twopgame) then
		if (MM.PlayerCount() == 2) and (not MM.duelplrs) then MM.duelplrs = PONG_Get2Players() end

		if ((MM.duelplrs) and valid(MM.duelplrs[1]) and valid(MM.duelplrs[2]) and (MM.duelplrs[1].mm.minigame) and (MM.duelplrs[2].mm.minigame)) then
			MM.minigame = true

			--Pong overlay objects for both Players
			for plr = 1, 2 do
				local mo = MM.duelplrs[plr].mo
				if (valid(mo.tracer)) then P_SetOrigin(mo.tracer, mo.x, mo.y, mo.z + mo.height)
				else mo.tracer = P_SpawnMobjFromMobj(mo, 0, 0, mo.height, MT_PONGOVERLAY) end
			end
		else MM.minigame = false end
	end
	if (MM.minigame) then
		if (MM.pong.timeout > -1) then MM.pong.timeout = $ - 1
		else PONG_Thinker() end
		if (MM.pong.timeout == 0) then
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
	if (gametype ~= GT_LTMMURDERMYSTERY) then return end

	--Player's minigame toggle
	if (p.cmd.buttons & BT_CUSTOM3) and ((MM.twopgame) or (p.spectator) or (MM.PlayerCount() == 1)) and (not MM.hud.help.active) then
		if (not (p.lastbuttons & BT_CUSTOM3)) then
			if (p.mm.flags & FLAG_MINIGAME) then --Disable minigame
				if (not p.mm.minigame_timeout) then
					MM.hud.game.routine = MM.hud.routines["game_main"]
					p.mm.flags = p.mm.flags & ~FLAG_MINIGAME
				end --Disable only when the timeout timer is out
				if (MM.minigame and PONG_GetMySlot(p)) then --PONG-specific code
					for plr = 1, 2 do
						MM.duelplrs[plr].mm.minigame = nil
						MM.pong.pads[plr] = 32
						P_RemoveMobj(MM.duelplrs[plr].mo.tracer)
					end
				end
			else --Enable minigame
				p.mm.flags = $ | FLAG_MINIGAME
				p.mm.minigame_timeout = 105
				SONIC_Reset(p)
			end
		end
	end

	--CUSTOM3 timeout logic
	if ((p.mm.flags & FLAG_MINIGAME) and (p.mm.minigame_timeout)) then p.mm.minigame_timeout = $ - 1 end

	--Player is in minigame state
	if (p.mm.flags & FLAG_MINIGAME) then
		if ((MM.minigame) and (MM.twopgame)) then --PONG
			MM.hud.game.routine = MM.hud.routines["minigame_pong"]
		elseif ((p.spectator) or (MM.PlayerCount() == 1)) then --SONIC RUN
			MM.hud.game.routine = MM.hud.routines["minigame_sonicrun"]
			if (SonicRun.timeout) then
				SonicRun.timeout = $ - 1
				if (SonicRun.timeout > TICRATE) then
					SonicRun.state = 0
					if (not (SonicRun.timeout % TICRATE)) then S_StartSound(nil, sfx_s3ka7, p) end
				elseif (SonicRun.timeout == TICRATE) then S_StartSound(nil, sfx_s3kad, p) end
			end
		end
	end
end)

--Input reader for both minigames
addHook("PreThinkFrame", function()
	for p in players.iterate do
		if (p.mm.flags & FLAG_MINIGAME) then
			if (MM.minigame) and (MM.twopgame) then
				if (MM.pong.timeout < 0) then
					PONG_ThinkCmd(p)
					p.cmd.forwardmove = 0
					p.cmd.sidemove = 0
					p.cmd.buttons = 0
				end
			elseif (p.spectator) or (MM.PlayerCount() == 1) then
				if (SonicRun.active) and (not (SonicRun.timeout / TICRATE)) then SONIC_Thinker() end
				p.cmd.forwardmove = 0
				p.cmd.sidemove = 0
				p.cmd.buttons = 0
			end
		end
	end
end)
