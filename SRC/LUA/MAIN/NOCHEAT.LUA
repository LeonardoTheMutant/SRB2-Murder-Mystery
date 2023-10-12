--NOCHEAT.LUA
--by LeonardoTheMutant
--
--This script doesn't allow player renaming which was often used in MM
--as a cheat to spoil someone's roles while the spoiler person is dead

addHook("PlayerThink", function(p)
	if (gametype!=GT_MURDERMYSTERY) return end
	if (p.name!=p.oldname) and (p.spectator)
		if (p==server)
			print("\x85SERVER HOST TRIED TO CHEAT WITH RENAMING!!!")
			COM_BufInsertText(server, "QUIT")
		end
		COM_BufInsertText(server, "KICK "..#p.." Do not rename when dead!")
		return
	end
	p.oldname=p.name
end)

-- ##        #######  ##
-- ##       ##     ## ##
-- ##       ##     ## ##
-- ##       ##     ## ##
-- ##       ##     ## ##
-- ##       ##     ## ##
-- ########  #######  ######## if you read this code without reading MMHELP in console first