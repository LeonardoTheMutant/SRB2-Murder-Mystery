# SRB2 Murder Mystery
Murder Mystery Add-On gametype for the Sonic Robo Blast 2

A port of the famous multiplayer game in SRB2
## How to start multiplayer server with Murder Mystery
### From command line
1. Write the `-file` parameter with a path to the add-on like `-FILE [path_to_the_pk3]`
2. Use `-gametype` to specify the gametype you want to start server with. In MM case it is `-gametype "Murder Mystery"`
3. you probably don't want to start from Greenflower 1 so use `-warp` to start game from specified level. To start from "Abandoned Shelter" map use `-warp MAPK0`

This is what command line should look like (example from Windows): `srb2win.exe -server (-dedicated) -file [place_where_pk3_located]/MM_MurderMystery-v[ver].pk3 -gametype "Murder Mystery" -warp MAPK0`

Please replace `[]` brackets with your path and version of the Add-On you use respectively. Add `-dedicated` if you want to start a dedicated server
### From in-game console
`MAP [MMmapnum] -GAMETYPE "Murder Mystery"`

Brackets are important in `"Murder Mystery"`! As a `MMmapnum` you can use `MAPK0` (Abandoned Shelter)

## Important server-side settings
- `rejoimtimeout` must be disabled for Murder Mystery to work properly. The code prevents gametype launch if this Console Variable is enabled.
- `timelimit` never set to `0`. Code will reset it to `5` each time you (or the game) will disable it. Murder Mystery is designed as MATCH-like game and Timelimit is actually useful here

## Open assets used in this project
- [Intermission Lock](https://mb.srb2.org/addons/intermission-lock-reduce-synch-fails-caused-by-players-joining-during-intermission.1293/) by Krabs
- [ShutUp Chatbug!](https://mb.srb2.org/addons/shut-up-chatbug.5046/) by [Jiskster](https://github.com/Jiskster)
- Heavily modified ModernSonic's footsteps engine. [Original fork of the script](https://mb.srb2.org/addons/footsteps.1378/) by Gomynola

### Please read the [READ_BEFORE_HOSTING.txt](READ_BEFORE_HOSTING.txt) for more hosting details