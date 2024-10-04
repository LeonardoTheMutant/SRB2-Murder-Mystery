# SRB2 Murder Mystery

Murder Mystery gametype add-on for [Sonic Robo Blast 2](https://www.srb2.org)

A port of the popular multiplayer game in SRB2

***Not to be confused with the [Saxashitter's Murder Mystery](https://github.com/Saxashitter/murder-mystery) add-on, which tries to acomplish the same goal but is an entirely different project***

<a href="https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery/graphs/contributors" alt="Contributors">
  <img src="https://img.shields.io/github/contributors/LeonardoTheMutant/SRB2-Murder-Mystery"></a>
<a href="https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery/pulse" alt="Activity">
  <img src="https://img.shields.io/github/commit-activity/m/LeonardoTheMutant/SRB2-Murder-Mystery"></a>
<a href="https://srb2.org">
  <img src="https://img.shields.io/badge/SRB2_compatibility-v2.2.13-darkblue"></a>
<a href="https://discord.gg/UgG8h2djFE">
  <img src="https://img.shields.io/discord/1075825170658381926?logo=discord" alt="chat on Discord"></a>

## How to build your **MurderMystery.PK3** from this repository

**Please note that MAKE scripts generate the Debug (Test) versions of the Add-On and it is highly recomended to HOST THESE BUILDS ONLY ON PRIVATE SERVERS.**
Release versions of the Add-On, which are tested and approved to be showcased publicly, are available in **Releases**

### If you have `git` installed

1. Open your *Terminal* (*Command Prompt* in Windows)
2. Clone this repository with `git clone https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery` command
3. Go to the folder of the cloned repository (`cd SRB2-MurderMystery`)
4. Launch one of the `MAKE` scripts ([MAKE.BAT](MAKE.BAT) for Windows or [MAKE.SH](MAKE.SH) for macOS/Linux) to generate the **Debug version** of the Add-On

### In case you don't have `git`

1. Download the contents of this repository as a .ZIP archive
2. Unarchive the downloaded .ZIP wherever you want on your machine
3. Go to the unarchived folder and run one of the `MAKE` ([MAKE.BAT](MAKE.BAT) for Windows or [MAKE.SH](MAKE.SH) for macOS/Linux) scripts to generate the **Debug version** of the SRB2-MM Add-On

## How to start the server with Murder Mystery Add-On

### From command line

1. Add the `-server` parameter to your prompt to make SRB2 start as Listen Server or `-dedicated` to start a dedicated server instead;
2. Add `-file` parameter with a path to the add-on file you wanna use like this:`-file [path_to_the_addon]`;
3. Use `-gametype` parameter to specify the gametype you want to start server with. In case of Murder Mystery it must be `-gametype "Murder Mystery"`;
4. You probably don't want to start from Greenflower 1 so don't forget to add `-warp` to start the game from the specified level. To start from "Abandoned Shelter" map use `-warp MAPK0`

This is what your SRB2 launch prompt should look like at the end (I use Windows build here): `srb2win.exe -server (-dedicated) -file [place_where_addon_located]/[MurderMystery-packname].pk3 -gametype "Murder Mystery" -warp MAPK0`

Don't forget to replace `[]` brackets with your path and the name of your .PK3 file you are going to use respectively.

### From in-game console

`MAP [MMmapnum] -GAMETYPE "Murder Mystery"`

Brackets are important in `"Murder Mystery"`! As a `[MMmapnum]` you can use **MAPK0** (Abandoned Shelter)

## Open assets used in this project

- Heavily modified ModernSonic's footsteps engine, [original fork of the script](https://mb.srb2.org/addons/footsteps.1378/) by Gomynola - Used to make footstep sounds and marks when players walk.

## For people who want to contribute to the project

All contributions would be greatly appreciated especially maps, music, graphics, ideas, bug fixes or even translations! Yes you read it right, this gametype supports localisations on different languages. You can add your own language to the project by either

1. Modifying the source code you are having right now
2. Making a **Custom Language File** from the [template](TEMPLATES/customlang.lua) and then adding it as a regular ADD-ON together with MM (Main Add-On has to be loaded first)

### Also check out the [Saxashitter's Murder Mystery](https://github.com/Saxashitter/murder-mystery) project