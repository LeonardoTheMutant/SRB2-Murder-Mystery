# SRB2 Murder Mystery
Murder Mystery Add-On gametype for the Sonic Robo Blast 2

A port of the popular multiplayer game in SRB2

## How to build your **MurderMystery.PK3** from this repository
### If you have `git` installed in your OS
1. Open your *Terminal* (*Command Prompt* in Windows)
2. Clone this repository with `git clone https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery` command
3. Go to the cloned repository folder (`cd SRB2-MurderMystery`)
4. Run the `MAKE` script for your OS ([MAKE.BAT](MAKE.BAT) for Windows and [MAKE.SH](MAKE.SH) for macOS/Linux)

### You don't have `git` in your OS
1. Download the contents of this repository as a .ZIP archive
2. Unarchive the downloaded .ZIP wherever you want on your machine
3. Go to the unarchived folder and run the `MAKE` script for your OS (use [MAKE.BAT](MAKE.BAT) for Windows and [MAKE.SH](MAKE.SH) for macOS/Linux)

## How to start the multiplayer server with Murder Mystery
### From command line
1. Add the `-server` parameter to your prompt to make SRB2 start as Listen Server host
1. Add `-file` with a path to the add-on file you wanna use like `-file [path_to_the_addon]`
2. Use `-gametype` parameter to specify the gametype you want to start server with. In case of Murder Mystery it must be `-gametype "Murder Mystery"`
3. You probably don't want to start from Greenflower 1 so use `-warp` to start the game from the specified level. To start from "Abandoned Shelter" map use `-warp MAPK0`

This is what your SRB2 launch prompt should look like (I use Windows here): `srb2win.exe -server (-dedicated) -file [place_where_addon_located]/MurderMystery-packname].pk3 -gametype "Murder Mystery" -warp MAPK0`

Don't forget to replace `[]` brackets with your path and the name of your .PK3 file you use respectively. Add `-dedicated` if you want to start a dedicated server (A server type where host is not a player and console appears instead of a game window).
### From in-game console
`MAP [MMmapnum] -GAMETYPE "Murder Mystery"`

Brackets are important in `"Murder Mystery"`! As a `[MMmapnum]` you can use **MAPK0** (Abandoned Shelter)

## Open assets used in this project
- [ShutUp Chatbug!](https://mb.srb2.org/addons/shut-up-chatbug.5046/) by [Jiskster](https://github.com/Jiskster) - Small script for handling chatbugs and some player lags;
- Heavily modified ModernSonic's footsteps engine, [original fork of the script](https://mb.srb2.org/addons/footsteps.1378/) by Gomynola - Used to make footstep sounds and marks when players walk.

## For people who might want to translate this gametype
Yes you read it right, this gametype supports language translations. You can add your own language to the project by either
1. Modifying the source code you are watching right now
2. Making a **Custom Language File** from the [template](ASSETS/customlang.lua) and then add it as a regular ADD-ON together with MM (Main Add-On has to be loaded first)

## For modders who want to mod this
If you wanna edit the code there is a [FOR_DEVELOPERS.txt](SRC/FOR_DEVELOPERS.txt) which explains what each LUA code file does. Hope this will help you spend less time on such things here as a programmer. You also might want to read the [functions and constants documentation](/SRC/DOCS/List_of_Func_and_Const.md) for even better understanding of the code.

## Please read the [READ_BEFORE_HOSTING.txt](SRC/READ_BEFORE_HOSTING.txt) before starting the server with Murder Mystery for more hosting details and warings