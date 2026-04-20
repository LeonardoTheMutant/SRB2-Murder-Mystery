-- MAPVOTE.LUA
-- Code by LeonardoTheMutant
--
-- Map Voting system for Intermission screens

local function findElementInTable(tbl, elm)
	for k, v in pairs(tbl) do
		if (elm == v) then return k end
	end
	return nil
end

local cv_inttime = CV_FindVar("inttime")
local cv_voteenabled = CV_FindVar("mm_vote_enable")
local cv_scoretime = CV_FindVar("mm_vote_scoretime")
local cv_votetime = CV_FindVar("mm_vote_votetime")
local cv_resulttime = CV_FindVar("mm_vote_resulttime")

local failParseStr = "%sFailed to parse \"%s\" (Is the Map Name/ID correct?)"
local supplyParamsStr = "Please supply Map ID(s) and/or Map Name(s) as parameters"
COM_AddCommand("mmvote_mapblacklist", function(p, ...)
	local args = {...}

	if (#args) then
		switch(args[1]:lower(), {
			["-l"] = function()
				CONS_Printf(p, "\x87List of blacklisted maps\x80:")
				local blacklistLen = #MM.mapvote.blacklist
				if (blacklistLen) then
					for i = 1, blacklistLen do
						local mapNumber, mapName = G_FindMapByNameOrCode(MM.mapvote.blacklist[i])
						if (mapNumber and mapName) then
							CONS_Printf(p, string.format("\t%s: %s", mapNumber, mapName))
						end
					end
				else
					CONS_Printf(p, "\t(empty)")
				end
			end,
			["-a"] = function()
				if (#args == 1) then
					CONS_Printf(p, supplyParamsStr)
					return
				end

				for i = 2, #args do
					local blacklistLen = #MM.mapvote.blacklist
					local mapNumber, mapName = G_FindMapByNameOrCode(args[i])
					if (mapNumber) then
						if (findElementInTable(MM.mapvote.blacklist, mapNumber))
							CONS_Printf(p, string.format("\x82\"%s\" (%d) is already present in the blacklist", mapName, mapNumber))
						else
							MM.mapvote.blacklist[blacklistLen + 1] = mapNumber
							CONS_Printf(p, string.format("%sAdded \"%s\" (%d) to the blacklist", "\x83", mapName, mapNumber))
						end
					else
						CONS_Printf(p, string.format(failParseStr, "\x85", args[i]))
					end
				end
			end,
			["-r"] = function()
				if (#args == 1) then
					CONS_Printf(p, supplyParamsStr)
					return
				end

				for i = 2, #args do
					local blacklistLen = #MM.mapvote.blacklist
					local mapNumber, mapName = G_FindMapByNameOrCode(args[i])

					if (mapNumber)
						local index = findElementInTable(MM.mapvote.blacklist, mapNumber)
						if (index) then
							table.remove(MM.mapvote.blacklist, index)
							CONS_Printf(p, string.format("\x83Removed \"%s\" (%d) from the blacklist", mapName, mapNumber))
						else
							CONS_Printf(p, string.format("\x85\"%d\" not found in the blacklist so not removed", mapNumber))
						end
					else
						CONS_Printf(p, string.format(failParseStr, "\x85", args[i]))
					end
				end
			end,
			["default"] = function()
				CONS_Printf(p, string.format("Unrecognized parameter \"%s\"", args[1]))
			end
		})
	else
		CONS_Printf(p, "Please use one of the following command parameters:\n\t-l - List entries of the blacklist\n\t-a - Add entry(-ies)\n\t-r - Remove entry(-ies)")
	end
end, COM_ADMIN)

local function getRandomMaps(NoOfMaps)
	local mapsLen = 0
	local maps = {}

	--Get all MM, Match and Tag maps loaded in the game
	for i = 0, #mapheaderinfo do
		if (mapheaderinfo[i] and (mapheaderinfo[i].typeoflevel & TOL_LTM_MM) and not findElementInTable(MM.mapvote.blacklist, i)) then
			maps[mapsLen + 1] = i
			mapsLen = mapsLen + 1
		end
	end

	--Do we have enough maps to choose from?
	if (mapsLen < NoOfMaps) then
		printf("\x82WARNING: \x80Not enough maps are available to pick %d random from. Trying to choose random maps again with blacklist ignored...", NoOfMaps)
		mapsLen = 0
		maps = {}
		for i = 0, #mapheaderinfo do
			if (mapheaderinfo[i] and (mapheaderinfo[i].typeoflevel & TOL_LTM_MM)) then
				maps[mapsLen + 1] = i
				mapsLen = mapsLen + 1
			end
		end
	end

	--Get random maps from available
	local m = {}
	local index
	for i = 1, NoOfMaps do
		index = P_RandomKey(mapsLen) + 1
		m[i] = maps[index]
		table.remove(maps, index)
		mapsLen = mapsLen - 1
	end
	return m
end

local fade_strength = 0
local NUM_MAPS = 6

enum(
	"MV_SCORE", --Default intermission leaderboard screen
	"MV_VOTE",
	"MV_RESULT"
)

local eMeM = MM

addHook("MapChange", function()
	if (gametype ~= GT_LTMMURDERMYSTERY) then return end

	for i = 1, NUM_MAPS do MM.mapvote.votes[i] = 0 end
	MM.mapvote.maplist = {}
	eMeM.hud.intermission.routine = eMeM.hud.routines["intermission_main"]
	intermissionstate = MV_SCORE
end)

--Background renderer
local function render_background(v)
	local BGpatch
	switch(eMeM.winner, {
		[WIN_MURD] = function()
			BGpatch = eMeM.graphics["INTRMBG1"]
		end,
		[WIN_CIVILS] = function()
			BGpatch = eMeM.graphics["INTRMBG2"]
		end,
		[WIN_JESTERKILLED] = function()
			BGpatch = eMeM.graphics["INTRMBG5"]
		end,
		['default'] = function()
			BGpatch = eMeM.graphics["INTRMBG0"]
		end
	})
	for x = 0, v.width(), BGpatch.width * v.dupx() do
		for y = 0, v.height(), BGpatch.height * v.dupy() do
			v.draw(x, y, BGpatch, V_NOSCALESTART)
		end
	end
end

local function pos_get2Dfrom1D(pos, width)
	width = width or 3
	return (pos % width), (pos / width)
end

local selectColormap
local levelPics = {}
local winnerMapID
local voteIcon

local startX = 24 --X of the first picture
local startY = 24 --Y of the first picture
local xoffset = 96
local yoffset = 72
local HUD_INTERMISSION = "HUD_INTERMISSION"

local lvlsel_border1 = string.rep("0", 80)
local lvlsel_border2 = string.rep("0", 1) .. string.rep(" ", 78) .. string.rep("0", 1)
local lvlsel_border = {
	palette = {{73}, {35}},
	image = {} -- aintnoway I am manually adding 50 entries here...!
}
-- ...I am doing it the smart way
lvlsel_border.image[1] = lvlsel_border1
for i = 2, 49 do
	lvlsel_border.image[i] = lvlsel_border2
end
lvlsel_border.image[50] = lvlsel_border1

local function vote_render(v)
	render_background(v)

	if (not selectColormap) then
		selectColormap = {v.getColormap(TC_RAINBOW, SKINCOLOR_JET), v.getColormap(TC_DEFAULT)}
	end

	if (not voteIcon) then voteIcon = v.cachePatch("NSSHUD") end

	HIDEO.DrawStrUnicode_Center(v, 160, 8, MM.GetText(HUD_INTERMISSION, "VOTING"))
	local timeleft = G_TicsToSeconds((cv_votetime.value*TICRATE) - intermissiontime)
	HIDEO.DrawStrUnicode_Center(v, 160, 172, string.format("%s: ^7JUMP^0   %s: ^7SPIN^0", MM.GetText(HUD_INTERMISSION, "SELECT"), MM.GetText(HUD_INTERMISSION, "CANCEL")), MM.hud.canvas.font.small.scale)
	HIDEO.DrawStrUnicode_Center(v, 160, 188, string.format("^2%s %d %s", MM.GetText(HUD_INTERMISSION, "VOTING_ENDS_IN"), timeleft, MM.GetText("HUD_SECONDS")))

	--This loop is designed for 6 maps per screen!!!
	for i = 1, NUM_MAPS do
		local x, y = pos_get2Dfrom1D((i - 1), 3)

		local picName = G_BuildMapName(MM.mapvote.maplist[i]) + "P"
		if (not levelPics[picName]) then
			if (v.patchExists(picName)) then levelPics[picName] = v.cachePatch(picName)
			else levelPics[picName] = v.cachePatch("BLANKLVL") end
		end

		--map picture
		v.drawScaled((startX + (x*xoffset))*FU, (startY + (y*yoffset))*FU, 32768, levelPics[picName], 0, selectColormap[bool2int(i == consoleplayer.currentweapon) + 1])

		--text
		local mapName = G_BuildMapTitle(MM.mapvote.maplist[i])
		if (HIDEO.StrWidthUnicode(mapName, tlags, 32768) >= 78) then mapName = mapName:sub(0, 18).."..." end --Map name might be too long to fit

		--Things to do when player is hovering overing over this slot
		local colorStr = ""
		if (consoleplayer.currentweapon == i) then
			HIDEO.DrawTextPatch(v, (startX + (x*xoffset)), (startY + (y*yoffset)), lvlsel_border, bool2int(consoleplayer.mm.kills) + 1)
			colorStr = "^2"
		end
		HIDEO.DrawStrUnicode(v, (startX + (x*xoffset) + 2), (startY + (y*yoffset) + 2), colorStr..mapName, 0, 32768)

		for r = 0, MM.mapvote.votes[i] - 1 do
			v.drawScaled((startX + (x*xoffset) + r*4)*FU, (startY + (y*yoffset) + 52)*FU, 32768, voteIcon)
		end
	end
end

local function result_render(v)
	render_background(v)

	local timeleft = (cv_resulttime.value*TICRATE) - intermissiontime

	HIDEO.DrawStrUnicode_Center(v, 160, 8, MM.GetText(HUD_INTERMISSION, "DECISION"))

	local picName = G_BuildMapName(winnerMapID) + "P"

	--map picture
	v.draw(80, 24, levelPics[picName])

	HIDEO.DrawStrUnicode_Center(v, 160, 128, "^2" + MM.GetText(HUD_INTERMISSION, "SPEEDINGOFF_TO"))
	HIDEO.DrawStrUnicode_Center(v, 160, 144, G_BuildMapTitle(winnerMapID))
	local author = mapheaderinfo[winnerMapID].author
	if (author) then
		local drawstr = string.format("%s: %s", MM.GetText(HUD_INTERMISSION, "AUTHORS"), author)
		HIDEO.DrawStrUnicode_Center(v, 160, 152, HIDEO.WordWrap(0, MM.hud.canvas.width, 0, MM.hud.canvas.font.small.scale, drawstr), 0, MM.hud.canvas.font.small.scale)
	end
	HIDEO.DrawStrUnicode_Center(v, 160, 188, string.format("^2%s %d %s", MM.GetText(HUD_INTERMISSION, "WARPING_IN"), G_TicsToSeconds(timeleft), MM.GetText("HUD_SECONDS")))

	if (intermissiontime >= (cv_resulttime.value*TICRATE) - 32) then
		v.fadeScreen(0xFB00, 32 - timeleft)
	end
end


sfxinfo[sfx_s240].caption = "Ding"
local SFX_SELECT = sfx_s240
sfxinfo[sfx_s243].caption = "Warping..."
local SFX_VOTING_START = sfx_s243
local SFX_CONFIRM = sfx_s3k63
local SFX_CANCEL = sfx_s3k72
local SFX_FAIL = sfx_s3k74
local SFX_COUNTDOWN = sfx_s3k89
local SFX_WINNER = sfx_lvpass
local SFX_SPEEDING_OFF = sfx_s3kaf

local up, down, left, right

addHook("IntermissionThinker", function()
	if (gametype ~= GT_LTMMURDERMYSTERY) then return end

	intermissiontime = intermissiontime + 1

	local totaltime = cv_scoretime.value + cv_votetime.value + cv_resulttime.value
	if (totaltime > cv_inttime.value) and (cv_voteenabled.value) then CV_Set(cv_inttime, totaltime) end

	switch(intermissionstate, {
		[MV_SCORE] = function()
			if (intermissiontime == (cv_scoretime.value * TICRATE)) and (cv_voteenabled.value) then
				MM.mapvote.maplist = getRandomMaps(6)
				for p in players.iterate do
					p.currentweapon = 1
					p.mm.kills = 0
				end
				MM.hud.intermission.routine = vote_render --swap to the Map Voting screen
				intermissionstate = MV_VOTE
				intermissiontime = 0
				S_StartSound(nil, SFX_VOTING_START)
			end
		end,
		[MV_VOTE] = function()
			--Listen for player inputs
			for p in players.iterate do
				local pmm = p.mm

				up = (p.cmd.forwardmove >= 10)
				down = (p.cmd.forwardmove <= -10)
				left = (p.cmd.sidemove <= -10)
				right = (p.cmd.sidemove >= 10)

				if (pmm.kills) --I am too lazy to make another variable just to store boolean value
					--Player has voted, listen only for "Cancel choice" button
					if (p.cmd.buttons & BT_SPIN) then
						MM.mapvote.votes[p.currentweapon] = MM.mapvote.votes[p.currentweapon] - 1
						pmm.kills = 0
						S_StartSound(nil, SFX_CANCEL, p)
					end

					if (up and not p.prevup) or (down and not p.prevdown) or (left and not p.prevleft) or (right and not p.prevright) then S_StartSound(nil, SFX_FAIL, p) end
				else
					--Player has not voted yet, let it select the desired map
					if (p.cmd.buttons & BT_JUMP) then
						MM.mapvote.votes[p.currentweapon] = MM.mapvote.votes[p.currentweapon] + 1
						pmm.kills = 1
						S_StartSound(nil, SFX_CONFIRM, p)
					end

					if (up) and not (p.prevup) then
						if (p.currentweapon < 4) then p.currentweapon = p.currentweapon + 3
						else p.currentweapon = p.currentweapon - 3 end
						S_StartSound(nil, SFX_SELECT, p)
					end

					if (down) and not (p.prevdown) then
						if (p.currentweapon > 3) then p.currentweapon = p.currentweapon - 3
						else p.currentweapon = p.currentweapon + 3 end
						S_StartSound(nil, SFX_SELECT, p)
					end

					if (left) and not (p.prevleft) then
						switch(p.currentweapon, {
							[1] = function()
								p.currentweapon = 3
							end,
							[4] = function()
								p.currentweapon = 6
							end,
						["default"] = function()
							p.currentweapon = p.currentweapon - 1
							end
						})
						S_StartSound(nil, SFX_SELECT, p)
					end

					if (right) and not (p.prevright) then
						switch(p.currentweapon, {
							[3] = function()
								p.currentweapon = 1
							end,
							[6] = function()
								p.currentweapon = 4
							end,
							["default"] = function()
								p.currentweapon = p.currentweapon + 1
							end
						})
						S_StartSound(nil, SFX_SELECT, p)
					end
				end

				p.prevup = up
				p.prevdown = down
				p.prevleft = left
				p.prevright = right
			end

			local timeleft = (cv_votetime.value * TICRATE) - intermissiontime
			if ((timeleft > 0) and (timeleft <= 105) and not (intermissiontime % TICRATE)) then
				S_StartSound(nil, SFX_COUNTDOWN)
			end

			if (intermissiontime == (cv_votetime.value * TICRATE)) then
				MM.hud.intermission.routine = result_render --swap to the Vote Result screen
				intermissionstate = MV_RESULT
				intermissiontime = 0
				S_StartSound(nil, SFX_WINNER, consoleplayer)

				--Get the best number of tallies
				local best = 0
				for slot = 1, NUM_MAPS do
					if (MM.mapvote.votes[slot] > best) then best = MM.mapvote.votes[slot] end
				end

				local bestMaps = {}
				local bestMapsNo = 1
				--How many tied slots are there with the top number?
				for slot = 1, NUM_MAPS do
					if (MM.mapvote.votes[slot] == best) then bestMaps[bestMapsNo] = slot end
				end

				--Now select the random slot among best slots
				winnerMapID = MM.mapvote.maplist[bestMaps[P_RandomKey(bestMapsNo) + 1]]
			end
		end,
		[MV_RESULT] = function()
			if (intermissiontime == (cv_resulttime.value*TICRATE) - 32) then
				S_StartSound(nil, SFX_SPEEDING_OFF, consoleplayer)
			end
			if (intermissiontime == (cv_resulttime.value*TICRATE) - 1) then
				COM_BufInsertText(server, string.format("map %d", winnerMapID))
			end
		end
	})
end)
