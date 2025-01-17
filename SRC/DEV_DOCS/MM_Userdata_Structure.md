# MM Userdata structure for LTM's Murder Mystery `1.0`

This document describes the structure of the MM data

## Table of contents
- [player_t.mm](#player_tmm)
- [MT_SHREMD](#mt_shremd)
- [Global <code>MM</code> table](#the-core-mm-table)

### player_t.mm

MM userdata related to the player. In the examples below, <code>p</code> is used as the name of the <code>player_t</code> variable. **An access to the MM-related variable <code>var</code> of <code>player_t</code> is written as <code>p.mm.var</code>**.

| Name | Type | Description |
| --- | --- | --- |
| **role** | *int*, one of the <code>ROLE_*</code> constants | Specifies the player's current role in the game. See the [documentation](./MM_Func&Const_List.md#constants) for the details on the constants for this variable. |
| **kills** | *int* | The number of kills the player has made. In **PONG** 2-player minigame this variable acts as the score per-player. |
| **killername** | *string* | The name of the player who killed player <code>p</code>.<br>***Note:*** The code has a special exception for the killer player's name set as `"your stupidity"` as it sometimes is used to identify the players who died by the map hazard (crusher, pit, drowned in water, etc.). This name will be also translated on HUD. |
| **lang** | *string* | The player's currently set language. Translates all the game messages and HUD-related text into the specified language. For example, <code>p.mm.lang = "EN"</code> will set the player's language to English. |
| **weapondelay** | *tic_t* | It is very similar to the <code>p.weapondelay</code>, but this one (<code>p.mm.weapondelay</code>) is used for the MM recreation of the weapons since the vanilla variable is always set to 0 to prevent the vanilla weapons from firing. |
| **sneak** | *boolean* | This variable tells whether or not the player is currently sneaking. While sneaking, the player makes no footstep sounds and leaves no footmarks on the ground. |
| **afk** | *tic_t* | The player's AFK timer. Depending on the value of the `mm_afk` Console Variable, it is used to calculate and kick the innactive players. |
| **camping** | *tic_t* | "Camping timer" for players with the **Murderer** role. Depending on the value of the `mm_camping` Console Variable, it is used to kick players with <code>p.mm.role == ROLE_MURDERER</code> who are sitting near the dropped *Sheriff's Emerald* for longer than 30 seconds. |
| **chatdelay** | *tic_t* | The player's delay timer which controls the time interval the player must wait before sending another message. |
| **shremd_dist** | *fixed_t* | The distance to the closest dropped *Sheriff's Emerald*. It is calcualted only for the **Murderers** (for calculating <code>p.mm.camping</code>) and **Innocents**. (for Emerald Radar). |
| **hud** | *userdata table* | The table with the player's HUD related data: <table><tr><th>Name</th><th>Type</th><th>Description</th></tr><tr><td>**fx_translucency**</td><td>*int*</td><td>The translucency of the fullscreen flash/spark effect. The effect is inactive when the value is set to 0 or >=10.</td></tr><tr><td>**fx_duration**</td><td>*int*</td><td>The duration of the effect's animation frame. </td></tr><tr><td>**fx_color**</td><td>*int*</td><td>The SRB2's pallet color used for the effect.</td></tr><tr><td>**roleflicker**</td><td>*tic_t*</td><td>The amount of time (in tics) the role label on HUD should flicker.</td></tr></table> |
| **timetravel** | *userdata table* | The table with the player's Time Travel related data: <table><tr><th>Name</th><th>Type</th><th>Description</th></tr><tr><td>**timezone**</td><td>*int*, one of the <code>TIMEZONE_*</code>* constants</td><td>The time zone the player is currently in. For maps that do not utilize the time travel mechanic the value of this variable will always be <code>TIMEZONE_PRESENT</code>. See [the documentation](./MM_Func&Const_List.md#constants) for the details on the constants for this variable.</td></tr><tr><td>**timesign**</td><td>*int*, one of the <code>TWS_*</code>* constants</td><td>The time warp sign (Past/Future sign) the player is currently holding. This variable is set back to <code>TWS_NONE</code> when the player succesfully warps into another time zone or has failed to keep enough speed for the warp. See [the documentation](./MM_Func&Const_List.md#constants) for the details on the constants for this variable.</td></tr><tr><td>**warptimer**</td><td>*tic_t*</td><td>The amount of time (in tics) player is in the warping state.</td></tr></table> |
| **help** | *userdata table* | The table with the player's GUI manual related data: <table><tr><th>Name</th><th>Type</th><th>Description</th></tr><tr><td>**active**</td><td>*boolean*</td><td>Tells whether or not the help manual is activated at the moment. It can be activated by the player by activating the `mmhelp` Console Command.</td></tr><tr><td>**buffer**</td><td>*boolean*</td><td>The text buffer storing the text (formated in MM string format) for the Video Renderer</td></tr><tr><td>**page**</td><td>*int*</td><td>The number of the manual page the player is currently looking at.</td></tr><tr><td>**pos**</td><td>*int*</td><td>The current possition on the page.</td></tr></table> |

### <code>MT_SHREMD</code>
The userdata of the dropped Sheriff Emerald's object (<code>MT_SHREMD</code>)

| Name | Type | Description |
| --- | --- | --- |
| **x** | *fixed_t* | The Emerald's X possition |
| **y** | *fixed_t* | The Emerald's Y possition |
| **z** | *fixed_t* | The Emerald's Z possition |
| **timezone** | *int*, one of the <code>TIMEZONE_*</code> constants | The timezone the emerald is dropped in |

### The core `MM` table

The description of each value in the `MM` table. The `MM` constant itself is defined in [INIT.LUA](../INIT.LUA)

| Name | Type | Description |
| --- | --- | --- |
| <code>**version**</code> | *string* | Version number of the add-on. |
| <code>**debug**</code> | *boolean* | Enable/Disable the add-on's *Debug Mode* functionality<br>*Note:* **The add-on must boot with this variable set to <code>true</code> to use the Debug in any form.** |
| <code>**builddate**</code> | *string* | The build date of the add-on. |
| <code>**text**</code> | *table* | Collection of all text used in **Murder Mystery** with all translations. This variable is **netsynced**. See the [source code](../LUA/) for details. |
| <code>**RoleColor**</code> | *string[5]* | The vanilla text colors for roles, use one of the <code>ROLE_*</code> constants as index to get the color for the specified role. For the dead player color access <code>MM.RoleColor[5]</code>.|
| <code>**RoleColorHUD**</code> | *string[5]* | The MM text colors for roles, use one of the <code>ROLE_*</code> constants as index to get the color for the specified role. For the dead player color access <code>MM.RoleColorHUD[5]</code>. |
| <code>**hud**</code> | *table* | HUD control variables for each sub-renderer (<code>MM.hud.game</code>, <code>MM.hud.scores</code>, <code>MM.hud.intermission</code>). Each sub-renderer has two attributes: <code>**enabled**</code> (custom scripts can disable MM's HUD renderers by setting this to <code>false</code>) and <code>pos</code> (coordinates of the different HUD elements). |
| <code>**graphics**</code> | *patch_t* | Table acting as the Video RAM that holds all loaded (cached) patches. Patches cane be loaded into this table with <code>V_LoadPatch()</code> before rendering them and unloaded with <code>V_UnloadPatch()</code> when they are not longer needed. Access the patches in this table by their name (ex. <code>MM.graphics["CHAOS3"]</code>). |
| <code>**graphics.charset**</code> | *patch_t[256]* | A sub-table dedicated to storing the character patches. The character set can be loaded into this table with <code>V_LoadCharset()</code> and unloaded with <code>V_ClearCharset()</code> (See the [Functions and Constants list](./MM_Func&Const_List.md) for details on using this function).<br>*Note*: Slots `0`-`31` are reserved for control characters (chars `16`-`31` are used for color) and cannot be occupied. |
| <code>**graphics.pixel**</code> | *patch_t[256]* | A sub-table dedicated to storing the pixel patches which can be used for various purpouses. In MM, they are used to create fullscreen flash/spark effects and transparent background for the `MMHELP` Console Command. The patches stored in this table are 1x1 graphics, each pointing to a specific color in SRB2's palette. |
| <code>**CharsetStandardReady**</code> | *boolean* | Is the Standard ASCII part (characters `33-127`) of the Character (Video) Memory loaded and ready to be used? If not, the HUD code will try to load the `"STCFN"`character set. |
| <code>**CharsetExtendedReady**</code> | *boolean* | Is the Extended ASCII part (characters `128-255`) of the Character (Video) Memory loaded and ready to be used? If not, the HUD code will try to load the character set specified in the <code>CHARSET</code> entry of the Language File,  by the player's chosen language (<code>player.mm.lang</code>). |
| <code>**weaponconfig**</code> | *int[4]* | Table to contain the Weapon Configurations. Updated by the `mm_wepconfig` CVAR. See [MM_WEPCONFIG.PNG](MM_WEPCONFIG.PNG) and [INIT.LUA](../INIT.LUA) for details. |
| <code>**death_sfx**</code> | *int[]* | Table containing all Sound Effects (<code>sfx_*</code> lumps) that are used as the death sounds/jingles. |
| <code>**shwdwn_music**</code> | *string[]* | The 6-character strings of the music track names that are used as Showndown Duel themes. Tracks from this list are being randomly selected by <code>MM_StartShowdownMusic()(</code>) function if the map does not have its own Showdown Theme specified with <code>Lua.ShowdownTrack</code> in SOC. |
| <code>**shwdwn**</code> | *string* | The 6-character name of the current Showdown Duel track playing, also marks if the Duel is happening right now or not. |
| <code>**susnce**</code> | *string* | The 6-character name of the current Suspense track playing. |
| <code>**winner**</code> | *int* | The winner of the round, can be one of the 3 possible values: *0* - Tie, *1* - Murderer, *2* - Civilians (Sheriffs, Heros and Innocents). This variable is **netsynced**. |
| <code>**winreason**</code> | *int* | The win reason, can be one of the <code>WIN_*</code> constants. This variable is **netsynced**. |
| <code>**timelimit**</code> | *int* | Works just like SRB2's vanilla `timelimit` but MM uses its own. The value is measured in Minutes. This variable is **netsynced**. |
| <code>**shremds**</code> | *mobj_t[]* | The table containing all dropped *Sheriff Emerald* objects (<code>MT_SHREMD</code>). |
| <code>**pong**</code> | *table* | Variables for Pong 2-player minigame. This variable is **netsynced**. See [INIT.LUA](../INIT.LUA) and [LUA/MINIGAMES/MINIGAMES.LUA](../LUA/MINIGAMES/MINIGAMES.LUA) for details. |
| <code>**MM.AddLang**(*string* index, *table* lang)</code> | *function* | Add a translation into MM. <code>index</code> is usually a 2 or 3 characters long name of the language. For example `"EN"` shows that the language is English. <code>table</code> is the translation data itself. The format of the <code>table</code> can be found [here](../LUA/TEXT/EN.LUA).<br>*Note:* Index should be all characters **UPPERCASE** otherwise it won't be accesible! |

# That's all folks!
