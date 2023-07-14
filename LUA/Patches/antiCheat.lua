--antiCheat.lua
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
-- Showing this message here cuz this is the last file loaded in this .pk3
print("\x83Murder Mystery loaded succesfuly, please note that this is WORK IN PROGRESS GAMETYPE and everything you see in this version can be completely changed in the future!\n\x85Please DO NOT TALK or POST ABOUT this gametype on any Message Board or forum, we would like to keep this in Mystery until release =)\n\x81If you're the server host \x81open this .PK3 (as a regular .ZIP) and look for \x82READ_BEFORE_HOSTING.txt\x81 file inside of it for imporant warnings and recommended server setup\x88\nThank you")


-- ##        #######  ##
-- ##       ##     ## ##
-- ##       ##     ## ##
-- ##       ##     ## ##
-- ##       ##     ## ##
-- ##       ##     ## ##
-- ########  #######  ######## if you read this code just to find out why your game is closing in MM and you didn't read MMHELP in console