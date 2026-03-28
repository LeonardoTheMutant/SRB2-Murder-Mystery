-- CCMDTEXT.LUA
--
-- Text [constants] for the Console Commands

--Console text
rawset(_G, "info_mmhelp_adminCVAR", string.format([[
‡MM_ABILITIES€    - Switch between ‡"Mystery"€ and Œ"Vanilla"€ skin abilities mode. Default is ‡"Mystery"€ (OFF).
‡MM_ALLOWINVINC€  - Allow Invincibility powerup to be used in MM. ‚Do not enable this unless you want chaos in your game.€ Default value is …"NO"€.
‡MM_ALLOWSHIELDS€ - Allow Shield powerups to be used in MM. ‚Do not enable this unless you want chaos in your game.€ Default value is …"NO"€.
‡MM_ALLOWSHOES€   - Allow Speed Sneakers powerup to be used in MM. Default value is …"NO"€.
‡MM_AUTOFIRE€     - Turn weapon autofire ON/OFF.
‡MM_CRYPTIC€      - Make the game more cryptic by disabling the teammate list, player nametags and most of the player counters on HUD.
‡MM_CUSTOMSKINS€  - Allow the usage of the Custom Skins/Characters in MM.
‡MM_FOOTMARKS€    - Enable/Disable the footmarks spawning.
‡MM_KILLTRAILS€   - Enable/Disable the Red Footmarks (Kill Trails) after Killing a player with the knife or stepping on the dead body.
‡MM_NOCAMPING€    - When enabled, %sMurderers€ who are camping on the %sSheriff's Emerald€ for longer than 30 seconds will be kicked.
‡MM_SPEED_SNEAK€  - Adjust the sneaking speed for all players. This works only when ‡MM_ABILITIES€ is disabled.
‡MM_SPEED_WALK€   - Adjust the walk speed for all players. This works only when ‡MM_ABILITIES€ is disabled.
‡MM_WEPCFG_MURD€  - Weapon Configuration for the %sMurderer€ role during the Normal Gameplay and the Showdown Duel.
‡MM_WEPCFG_SHERI€ - Weapon Configuration for the %sSheriff€ role during the Normal Gameplay and the Showdown Duel.
‡MM_WEPCFG_CIVIL€ - Weapon Configuration for the %sCivilian€ role. Setting this variable to 1€ will let them use Red Ring + Knife, ‚2€ forces to Knife-only.
‡MM_WEPCFG_HERO€  - Weapon Configuration for the %sHero€ role during the Normal Gameplay and the Showdown Duel.
‡MMSETUP€0 - MM setup utility (in case you are lazy to manually set each CVAR for the game)"
]], MM.RoleColor[ROLE_MURDERER], MM.RoleColor[ROLE_SHERIFF], MM.RoleColor[ROLE_MURDERER], MM.RoleColor[ROLE_SHERIFF], MM.RoleColor[ROLE_CIVILIAN], MM.RoleColor[ROLE_HERO]))

--Console text
if (MM.debug) then rawset(_G, "info_mmhelp_debug", [[
‡MMPLAYER€    - Change player state/role
‡MMEXITLEVEL€ - Force round end with the winner
‡MMSHREMD€    - Spawn Sheriff's Emerald at player's position
‡MMTIMEWARP€  - Travel between different time zones (if map supports them)
‡MMSUSNSE€    - Start the Suspense music
‡MMDUEL€      - Start the Showdown Duel music
‡MMLOADMUS€   - (Re)load the Suspense and Showdown music tracklists
‡MMCHARSET€   - Display the loaded symbols in the Character Video Memory
]]) end

--UTF-8 text
rawset(_G, "info_mmhelp_technical", string.format([[
^4LTM's ^7Murder Mystery
^0Version ^1%s^0
by ^2"SRB2MM_DEV team"^0
Full credits are in the ^6README.TXT^0 inside this .PK3 file


The developer team can be reached out by using one of the following links:


Discord: ^4https://www.discord.com/invite/UgG8h2djFE^0

Matrix: ^3https://matrix.to/#/#ltm_mm:matrix.org^0

GitHub: ^6https://www.github.com/LeonardoTheMutant/SRB2-Murder-Mystery^0

Website: ^Bhttps://leonardothemutant.github.io/SRB2-Murder-Mystery^0]], MM.version))
