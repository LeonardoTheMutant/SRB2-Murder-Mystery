# LeonardoTheMutant's Murder Mystery
**(Formely "SRB2 Murder Mystery")**

A port of the popular multiplayer game in a form of a new gametype for [Sonic Robo Blast 2](https://www.srb2.org)

***Not to be confused with the [Saxashitter's Murder Mystery](https://github.com/Saxashitter/murder-mystery), which is an entirely different MM project for SRB2***

<a href="https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery/graphs/contributors" alt="Contributors">
  <img src="https://img.shields.io/github/contributors/LeonardoTheMutant/SRB2-Murder-Mystery"></a>
<a href="https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery/pulse" alt="Activity">
  <img src="https://img.shields.io/github/commit-activity/m/LeonardoTheMutant/SRB2-Murder-Mystery"></a>
<a href="https://srb2.org">
  <img src="https://img.shields.io/badge/SRB2_compatibility-v2.2.13-darkblue"></a>
<a href="https://discord.gg/UgG8h2djFE">
  <img src="https://img.shields.io/discord/1075825170658381926?logo=discord" alt="chat on Discord"></a>

## Overview
*(There is supposed to be a short explanation of the game with some gameplay screenshots, feel free to contribute to this section)*

## How to build a **.PK3** file out of this repository

**Please note that MAKE scripts generate the *Debug* (*Test*) versions of the Add-On and it is highly recomended to HOST THESE BUILDS ONLY ON PRIVATE SERVERS.**
Release versions of the Add-On, which are tested and approved to be showcased publicly, are available in [Releases](https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery/releases)

### If you have `git` installed

1. Open your *Terminal* (*Command Prompt* in Windows)
2. Clone this repository
    ```sh
    git clone https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery
    ```
3. Go to the folder of the cloned repository
    ```sh
    cd SRB2-Murder-Mystery
    ```
4. Launch one of the `MAKE` scripts that will generate the `.pk3` file with the **Debug version** of the Add-On:
    - Windows:
      ```batch
      MAKE.BAT
      ```
    - Linux/macOS:
      ```sh
      ./MAKE.SH
      ```

### In case you don't have `git` installed

1. Download the contents of this repository as a .ZIP archive
2. Unarchive the downloaded .ZIP wherever you want on your machine
3. Go to the unarchived folder and run one of the `MAKE` ([MAKE.BAT](MAKE.BAT) for Windows or [MAKE.SH](MAKE.SH) for macOS/Linux) scripts to generate the **Debug version** of the Add-On
4. *(Optional) Find and install the `git` package for your OS so you won't have to download the repository files manually via .ZIP again*

## How to start the server with Murder Mystery Add-On

### From command line
- Add the `-server` parameter to your prompt to make SRB2 start as **Listen Server** (where host is a player) or `-dedicated` to start a **Dedicated Server** (where host is NOT a player and is a dedicated console) instead;
- Add `-file` parameter with the path(s) to the add-on file(s) you want use;
- Use `-gametype` parameter to specify the Type of Level (Gametype) you want your server to start with. In case of Murder Mystery it must be `-gametype LTM_MM`;
- Use `-warp` to start the game from the specified level (otherwise the map will be *Greenflower 1*). To start from the *"Abandoned Shelter"* use `-warp MAPK0`

This is what your SRB2 launch prompt should look like at the end:
- Windows:
    ```batch
    srb2win.exe -server -file [place_where_addon_located]/[MurderMystery].pk3 -gametype LTM_MM -warp MAPK0
    ```
- macOS:
    ```sh
    open /Applications/Sonic\ Robo\ Blast\ 2.app --args -server -file [place_where_addon_located]/[MurderMystery].pk3 -gametype LTM_MM -warp MAPK0
    ```
- Linux:
    ```sh
    ./lsdlsrb2 -server -file [place_where_addon_located]/[MurderMystery].pk3 -gametype LTM_MM -warp MAPK0
    ```

Don't forget to replace `[]` brackets with your path and the name of your .PK3 file you are going to use respectively.

### From in-game console
```
map [mapnum] -gametype LTM_MM
```
As a `[mapnum]` you can use **MAPK0** or **K0** (*"Abandoned Shelter"*)

## Open assets used in this project
- Heavily modified ModernSonic's footsteps engine, [original fork of the script](https://mb.srb2.org/addons/footsteps.1378/) by Gomynola - Used to make footstep sounds and marks when players walk.
- Music & Textures from the [Freedoom](https://github.com/freedoom/freedoom) project.
- MIDI files for the music from [VGMusic](https://vgmusic.com)

## For people who want to contribute to the project
The [Pull Requests](https:github.com/LeonardoTheMutant/SRB2-Murder-Mystery/pulls) are always open! All contributions would be greatly appreciated especially maps, music, graphics, ideas or bug fixes. If you want to make something unique you can even make a translation. Yes you read it right, this gametype supports localisations on different languages. You can add your own language to the project by either

1. Modifying the source code you are having right now and creating a new Pull Request
2. Making a **Custom Language File** from the [template](TEMPLATES/customlang.lua) and then in SRB2 add it as a regular Add-On together with MM (main MM Add-On has to be loaded first)
