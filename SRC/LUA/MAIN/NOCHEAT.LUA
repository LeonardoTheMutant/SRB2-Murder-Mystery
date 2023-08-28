--NOCHEAT.LUA
--by LeonardoTheMutant
--
--This script doesn't allow player renaming that's often used in MM
--as a cheat to spoil someone's roles while the spoiler person is dead

addHook("PlayerSpawn", function(p)
	if gametype!=GT_MURDERMYSTERY return end
	p.oldname=p.name
end)
addHook("PlayerThink", function(p)
	if gametype!=GT_MURDERMYSTERY return end
	if p.name!=p.oldname
		if p==server print("\x85SERVER HOST TRIED TO CHEAT WITH RENAMING!!!") end
		COM_BufInsertText(p, "QUIT")
		return
	end
end)


-- ##        #######  ##
-- ##       ##     ## ##
-- ##       ##     ## ##
-- ##       ##     ## ##
-- ##       ##     ## ##
-- ##       ##     ## ##
-- ########  #######  ######## if you read this code just to find out why your game is closing in MM and you didn't read MMHELP in console