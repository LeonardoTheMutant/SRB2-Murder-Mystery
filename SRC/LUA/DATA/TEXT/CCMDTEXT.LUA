-- CCMDTEXT.LUA
--
-- Text [constants] for the Console Commands

--Console text
rawset(_G, "info_mmhelp_adminCVAR", string.format(table.concat({
	"\x87MM_ABILITIES\x80    - Switch between \x87\"Mystery\"\x80 and \x81\"Vanilla\"\x80 skin abilities mode. Default is \x87\"Mystery\"\x80 (OFF).",
	"\x87MM_ALLOWINVINC\x80  - Allow Invincibility powerup to be used in MM.\x82 Do not enable this unless you want chaos in your game.\x80 Default value is \x85\"NO\"\x80.",
	"\x87MM_ALLOWSHIELDS\x80 - Allow Shield powerups to be used in MM.\x82 Do not enable this unless you want chaos in your game.\x80 Default value is \x85\"NO\"\x80.",
	"\x87MM_ALLOWSHOES\x80   - Allow Speed Sneakers powerup to be used in MM. Default value is \x85\"NO\"\x80.",
	"\x87MM_AUTOFIRE\x80     - Turn weapon autofire ON/OFF.",
	"\x87MM_CRYPTIC\x80      - Make the game more cryptic by disabling the teammate list, player nametags and most of the player counters on HUD.",
	"\x87MM_CUSTOMSKINS\x80  - Allow the usage of the Custom Skins/Characters in MM.",
	"\x87MM_FOOTMARKS\x80    - Enable/Disable the footmarks spawning.",
	"\x87MM_KILLTRAILS\x80   - Enable/Disable the Red Footmarks (Kill Trails) after Killing a player with the knife or stepping on the dead body.",
	"\x87MM_NOCAMPING\x80    - When enabled, %sMurderers\x80 who are camping on the %sSheriff's Emerald\x80 for longer than 30 seconds will be kicked.",
	"\x87MM_SPEED_SNEAK\x80  - Adjust the sneaking speed for all players. This works only when \x87MM_ABILITIES\x80 is disabled.",
	"\x87MM_SPEED_WALK\x80   - Adjust the walk speed for all players. This works only when \x87MM_ABILITIES\x80 is disabled.",
	"\x87MM_WEPCFG_MURD\x80  - Weapon Configuration for the %sMurderer\x80 role during the Normal Gameplay and the Showdown Duel.",
	"\x87MM_WEPCFG_SHERI\x80 - Weapon Configuration for the %sSheriff\x80 role during the Normal Gameplay and the Showdown Duel.",
	"\x87MM_WEPCFG_CIVIL\x80 - Weapon Configuration for the %sCivilian\x80 role. Setting this variable to\x81 1\x80 will let them use Red Ring + Knife,\x82 2\x80 forces to Knife-only.",
	"\x87MM_WEPCFG_HERO\x80  - Weapon Configuration for the %sHero\x80 role during the Normal Gameplay and the Showdown Duel.",
	"\x87MMSETUP\x80 - MM setup utility (in case you are lazy to manually set up each CVAR for the game)"
}, "\n"), MM.RoleColor[ROLE_MURDERER], MM.RoleColor[ROLE_SHERIFF], MM.RoleColor[ROLE_MURDERER], MM.RoleColor[ROLE_SHERIFF], MM.RoleColor[ROLE_CIVILIAN], MM.RoleColor[ROLE_HERO]))

--Console text
if (MM.debug) then rawset(_G, "info_mmhelp_debug", table.concat({
	"\x87MMPLAYER\x80    - Change player state/role",
	"\x87MMEXITLEVEL\x80 - Force round end with the winner",
	"\x87MMSHREMD\x80    - Spawn Sheriff's Emerald at player's position",
	"\x87MMTIMEWARP\x80  - Travel between different time zones (if map supports them)",
	"\x87MMSUSNSE\x80    - Start the Suspense music",
	"\x87MMDUEL\x80      - Start the Showdown Duel music",
	"\x87MMLOADMUS\x80   - (Re)load the Suspense and Showdown music tracklists",
	"\x87MMCHARSET\x80   - Display the loaded symbols in the Character Video Memory",
}, "\n")) end

--UTF-8 text
rawset(_G, "info_mmhelp_technical", {
	"^4LTM's ^7Murder Mystery",
	"^0Version ^1"..MM.version.."^0",
	"by ^4LeonardoTheMutant^0 & ^2his team^0",
	"Full credits are in the ^6README.TXT^0 inside this .PK3 file",
	"",
	"",
	"The developer team can be reached out by using one of the following links:",
	"",
	"",
	"Matrix: ",
	"^3https://matrix.to/#/#ltm_mm:matrix.org^0",
	"",
	"Discord: ",
	"^4https://discord.com/invite/UgG8h2djFE^0",
	"",
	"GitHub: ",
	"^6https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery^0",
	"",
	"Website: ",
	"^Bhttps://leonardothemutant.github.io/SRB2-Murder-Mystery^0"
})
