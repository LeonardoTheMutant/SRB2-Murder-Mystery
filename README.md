# SRB2 Murder Mystery
Murder Mystery Add-On gametype for the Sonic Robo Blast 2

A port of the famous multiplayer game in SRB2

## How to build your **MurderMystery.PK3** from this repository
There is currently no build/makefile available for this project so you have to build the ***.PK3*** manually. First, use `git clone (repository URL)` to save the repository to your computer *OR* download the repository files as a **.ZIP** archive. After that go the *SRC/* folder in your saved repository and select every file & folder located here (shortcut is `CTRL+A`). You have to create new archive with ***.PK3*** extension and import the selected files into it. Filename of the archive does not matter, only the extension. If everything is done correctly you will be able to load the ***.PK3*** you created in SRB2 without any problem.

## How to start the multiplayer server with Murder Mystery
### From command line
1. Write the `-file` parameter with a path to the add-on like `-file [path_to_the_pk3]`
2. Use `-gametype` to specify the gametype you want to start server with. In this case it is `-gametype "Murder Mystery"`
3. You probably don't want to start from Greenflower 1 so use `-warp` to start game from the specified level. To start from "Abandoned Shelter" map use `-warp MAPK0`

This is what command line should look like (I use Windows here): `srb2win.exe -server (-dedicated) -file [place_where_pk3_located]/MurderMystery-packname].pk3 -gametype "Murder Mystery" -warp MAPK0`

Please replace `[]` brackets with your path and the name of your .PK3 file you use respectively. Add `-dedicated` if you want to start a dedicated server (A server type where console appears instead of a game window, host is not a player here).
### From in-game console
`MAP [MMmapnum] -GAMETYPE "Murder Mystery"`

Brackets are important in `"Murder Mystery"`! As a `[MMmapnum]` you can use **MAPK0** (Abandoned Shelter)

## Important server-side settings
Please set the following CVARs in your server console (or as admin) to make MM work fine:
- `rejoimtimeout` must be disabled (value set to `0`) for Murder Mystery to work properly, otherwise your console will be spammed with warnings (Yes this is serious)
- `timelimit` never set to `0`. Code will reset it to `5` each time you (or the game) will disable it. Murder Mystery is designed as MATCH-like game and Timelimit is actually useful here

## Open assets used in this project
- [Intermission Lock](https://mb.srb2.org/addons/intermission-lock-reduce-synch-fails-caused-by-players-joining-during-intermission.1293/) by Krabs - Does not allow player joining when server is on intermission;
- [ShutUp Chatbug!](https://mb.srb2.org/addons/shut-up-chatbug.5046/) by [Jiskster](https://github.com/Jiskster) - Small script for handling chatbugs and some player lags;
- Heavily modified ModernSonic's footsteps engine, [original fork of the script](https://mb.srb2.org/addons/footsteps.1378/) by Gomynola - Used to make footstep sounds and marks when players walk.

## For developers and translators
This gametype supports language translations. You can add your own language to the project by either
1. Modifying the source code you have access to
2. Making a **Custom Language File** from the [template](TOOLS/customlang.lua) and then adding it as a regular ADD-ON together with MM

If you wanna edit the code there is a [FOR_DEVELOPERS.txt](SRC/FOR_DEVELOPERS.txt) that explains what each file does. Hope this will make your job easier

### Please read the [READ_BEFORE_HOSTING.txt](SRC/READ_BEFORE_HOSTING.txt) before starting the server with this Add-On for more hosting details and warings