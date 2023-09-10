# SRB2 Murder Mystery
Murder Mystery Add-On gametype for the Sonic Robo Blast 2

A port of the popular multiplayer game in SRB2

## How to build your **MurderMystery.PK3** from this repository
### If you have `git` installed in your OS
1. Clone this repository with `git clone https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery`
2. Go to the cloned repository folder (`cd SRB2-MurderMystery`)
3. Run the `MAKE` script for your OS ([MAKE.BAT](MAKE.BAT) for Windows and [MAKE.SH](MAKE.SH) for macOS/Linux)

### You don't have `git` in your OS
1. Download the contents of this repository as a .ZIP archive
2. Unarchive the downloaded .ZIP wherever you want on your machine
3. Go to the unarchived folder and run the `MAKE` script for your OS (use [MAKE.BAT](MAKE.BAT) for Windows and [MAKE.SH](MAKE.SH) for macOS/Linux)
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
- `rejoimtimeout` must be disabled (value set to `0`) for Murder Mystery to work properly, otherwise your console is going to be spammed with warnings (Yes this is serious)

## Open assets used in this project
- [ShutUp Chatbug!](https://mb.srb2.org/addons/shut-up-chatbug.5046/) by [Jiskster](https://github.com/Jiskster) - Small script for handling chatbugs and some player lags;
- Heavily modified ModernSonic's footsteps engine, [original fork of the script](https://mb.srb2.org/addons/footsteps.1378/) by Gomynola - Used to make footstep sounds and marks when players walk.

## For developers and translators
This gametype supports language translations. You can add your own language to the project by either
1. Modifying the source code you have access to
2. Making a **Custom Language File** from the [template](ASSETS/customlang.lua) and then adding it as a regular ADD-ON together with MM (Main Add-On must be loaded first)

If you wanna edit the code there is a [FOR_DEVELOPERS.txt](SRC/FOR_DEVELOPERS.txt) that explains what each file does. Hope this will make your job easier

### Please read the [READ_BEFORE_HOSTING.txt](SRC/READ_BEFORE_HOSTING.txt) before starting the server with this Add-On for more hosting details and warings