## List of functions and constants

### For LTM's Murder Mystery `1.0-ALPHA`

---

This document contains the description of some important and globaly defined functions as well as constants which are used in Murder Mystery's LUA source code.

## Table of Contents

- [Functions](#functions)
  - `INIT.LUA`
    - Customisation API
  - FUNCTIONS.LUA`
    - `GAME.LUA`
    - `HUD.LUA`
    - `CHAT.LUA`
    - `MINIGAME.LUA`
    - Globaly used functions
- [Constants](#constants)
  - Roles (`ROLE_*`)
  - Game messages
  - Win reasons (`WIN_*`)
  - Time Zones (`TIMEZONE_*`)
  - Time Warp (`TWS_*`)
- [The core `MM` table](#the-core-mm-table)

# Functions

## `INIT.LUA`

### Customisation API

There is a customization function defined in <code>MM</code> table inside the code which allows you to create your own "sub-mods" for the Murder Mystery gametype. 

| Name | Description |
| --- | --- |
| <code>**MM.AddLang**(*string* index, *table* lang)</code> | Add a translation into MM. <code>index</code> is usually a 2 or 3 characters long name of the language. For example `"EN"` shows that the language is English. <code>table</code> is the translation data itself. The format of the <code>table</code> can be found [here](https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery/blob/main/TEMPLATES/customlang.lua).<br>*Note:* Index should be all characters **UPPERCASE** otherwise it won't be accesible! |

## `FUNCTIONS.LUA`

There is a dedicated LUA script that contains the code of some MM functions. Some of those functions are used in only one LUA script and some are used globally.

### `GAME.LUA`

These are the functions that are used in [`GAME.LUA`](../LUA/MAIN//GAME.LUA) (the main game logic script):

| Name | Return value | Description |
| --- | --- | --- |
| <code>**MM_InitPlayer**(*player_t* player)</code> | nil | Initialize the <code>player.mm</code> table with some MM userdata for the player. |
| <code>**MM_AssignRoles**()</code> | nil | The main role assigner function. Called durring `MapLoad` hook and when another player joins the game with a single player online.<br>Iterates through all players and gives them the role of  **Murderer**, **Sheriff** or **Innocent** randomly. Then it tells the assigned role to each player personally. |
| <code>**MM_GetRoleMultiplier**()</code> | nil | Get the number of the required role duplicates. It is primarily used in <code>**MM_AssignRoles()**</code> to understand how many players should share **Murderer** or **Sheriff** roles. It is also used to adjust the map timelimit when a level starts. |
| <code>**MM_ChatprintGlobal**(*string* message_id, * var)</code> | nil | Works similarly to <code>**chatprint**()</code> but prints the message in player's language. Unlike <code>**chatprint**()</code> this function can print only the messages available in the multilingual <code>MM.text</code> table. Possible values for the arguments of this function are shown below in the [Constants](#constants) section (`WIN_*` constants). |
| <code>**MM_TeammatesCount**(*player_t* player)</code> | *int* | Returns the number of teammates the player has.<br>*Note:* Do not use this function for Innocents as they are technically not in a team. |
| <code>**MM_AreTeammates**(*player_t* player1, *player_t* player2)</code> | *boolean* | Compares if <code>player1</code> and <code>player2</code> are in the same team (Murderer team, Sheriff/Hero team).<br>*Note*: For Innocents this functions returns `false` because such team does not exist in the game. |
| <code>**MM_KillPlayerByPlayer**(*mobj_t* player, [*mobj_t* attacker])</code> | nil | Kill <code>player</code> by making him *DEAD*. <code>attacker</code> is a player who killed the <code>player</code>, it is used to print the killer's name for the <code>player</code>. If the <code>attacker</code> is not specified the killer's name is `"your stupidity"` instead.<br>*Note:* Both <code>player</code> and <code>attacker</code> arguments have to be `mobj_t`! |
| <code>**MM_KillPlayerByHazard**(*mobj_t* player, [*bool* spawnBody])</code> | nil | Similar to <code>MM_KillPlayer()</code> but is used to kill by the level hazard (crusher, death pit, drown). Set <code>spawnBody</code> to `true` to also spawn the dead body (does not spawn one by default).<br>*Note:* <code>player</code> argument has to be `mobj_t`! |
| <code>**MM_HitTeammate**(*player_t* victim, *player_t* attacker)</code> | nil | Make <code>victim</code> being hit by a teammate <code>attacker</code>. This function prints personal messages to both <code>victim</code> and <code>attacker</code> to let them know that they are in one team and they should not hit each other next time. |
| <code>**MM_EndRound**(*int* win, * var, [*int* winreason])</code> | nil | Finish the round. <code>w</code> specifies the winner, possible values are: 0 - Tie, 1 - Murderers, 2 - Civilians (Sheriffs, Heros & Innocents). <code>winreason</code> is optional but can be one of the `WIN_*` constants. |
| <code>**MM_StartSuspenceMusic**()</code> | *boolean* | Starts the Suspence music and returns `true` if there are no Sheriffs and no Heroes alive but one Innocent with at least one Sheriff's Emerald dropped. |
| <code>**MM_StartShowdownMusic**()</code> | *boolean* | Starts one of the Showdown Duel tunes and returns `true` if there are no Innocents in the game.|
| <code>**MM_SetRandomInnoAs**(*int* role, *int* message)</code> | nil | Similar to <code>**MM_AssignRoles()**</code> but works for only for Innocents. In some gameplay situations, there has to be a replacement of the player with some important <code>role</code> and this function selects random Innocent to give the <code>role</code> to it. Any of the `ROLE_*` constants (except `ROLE_INNOCENT`) can act as a possible value for the <code>role</code> argument.<br>Possible values for <code>Message</code>:<table><tr><th>Value</th><th>Message</th></tr><tr><td>1</td><td>*"You became a Murderer"*</td></tr><tr><td>2</td><td>*"You became a Sheriff"*</td></tr><tr><td>3</td><td>*"You became a Hero"*</td></tr><tr><td>4</td><td>*"You were rewarded the role of Hero"*</td></tr></table> |
| <code>**MM_GetMMSHREMLinterval**(*int* distance)</code> | *int* | Get the interval time in tics between each radar beep depending on the <code>dist</code> distance. Used for Innocents' Sheriff Emerald radar. |
| <code>**MM_IsTimelineCorrect**(*int* timezone1, *int* timezone2)</code> | *boolean* | Check if the events from <code>timezone1</code> can happen in <code>timezone2</code>. For example, if the event has happened in the *Past* the consequence of this event can be seen in the *Present*, *Bad Future*, and *Good Future*. But the event from the *Present*, *Bad Future*, or the *Good Future* cannot be seen in the *Past* (because it happened in the future). For easier understanding imagine a one-way road (timeline): `Past > Present > Bad/Good Future`<br>*Note:* Both of the arguments are `TIMEZONE_*` constants. |
| <code>**MM_GetText**(*string* language, *string* line, [*string*/*int* parameter])</code> | *string* | A safe way to extract the strings from the global MM Text Table (<code>MM.text</code>) without crashing/erroring LUA. When all 3 arguments are given this function returns the value at <code>MM.text[language][line][parameter]</code>. If only <code>language</code> and <code>line</code> arguments are given the function returns the value from <code>MM.text[language][line]</code>. If the text is not found or the arguments are invalid a blank string is returned instead.<br>*Note:* Even if the expected return value is table, this function will return an empty string!<br>*In Debug Builds:* If the text can not be reached or invalid arguments are given an error is triggered with the details. |
| <code>**MM_PunishPlayer**(*player_t* player, *string* message, [*boolean* ban?])</code> | *nil* | Kick player from the game or ban if <code>ban?</code> is set. <code>message</code> is the kick/ban message.<br>*Note:* If the player who is going to be punished is the host, SRB2 automatically closes for this player, causing the server to shut down. |
| <code>**MM_WeaponConfigFlags**(*int* role, *int* flags)</code> | *int* | Returns the result of the Logical AND operation between Weapon Configuration CVAR (`mm_wepconfig`) and <code>flags</code> argument for the given <code>role</code>. |

### `HUD.LUA`

Functions for HUD rendering code

| Name | Return value | Description  |
| --- | --- | --- |
| <code>**V_LoadPatch**(*drawer* v, *string* patchName)</code> | nil | Load the Patch into the memory (<code>MM.graphics[patchName]</code>). |
| <code>**V_LoadCharset**(*drawer* v, *string* name)</code> | nil | Load the Character Set into the memory (<code>MM.graphics.charset[chrset_prefix]</code>). <code>name</code> is the 5-sign (no more, no less) patch prefix. This function will try to load 128 (256 for SRB2 built-in sets) patches named as `XXXXX###` where XXXXX is <code>name</code> and ### is a 3-digit number from 0 to 255. |
| <code>**V_DrawStrASCII**(*drawer* v, *int* x, *int* y, *string* charset, *string* str, [*int* videoflags, [*bool* small?]])</code> | nil | An alternative to <code>**v.drawString()**</code>. This function supports text rendering in different character encodings. <code>charset</code> specifies the character set to use (the character set has to be preloaded into the memory with <code>**V_loadCharset()**</code>). <code>str</code> is the string to render. If <code>small?</code> is set to `true`, it will draw the string in half of the normal size<br>*Note:* Each character from the Extended ASCII range (0x80-0xFF) should be typed as an escape code of the character in <code>str</code> string. |
| <code>**V_DrawStrASCII_Center**(*drawer* v, *int* x, *int* y, *string* charset, *string* str, [*int* videoflags, [*bool* small?]])</code> | nil | Alternative to <code>**v.drawString()**</code> with the `"center"` alignment flag. Uses <code>**V_DrawStrASCII()**</code> to render the string relatively centered. The <code>x</code> coordinate is the center. |
| <code>**V_DrawStrASCII_Right**(*drawer* v, *int* x, *int* y, *string* charset, *string* str, [*int* videoflags, [*bool* small?]])</code> | nil | Alternative to <code>**v.drawString()**</code> with the `"right"` alignment flag. Uses <code>**V_DrawStrASCII()**</code> to render the string right-aligned. The <code>x</code> coordinate is the right edge of the string. |
| <code>**V_StrWidthASCII**(*string* str, [*int* videoflags, [*bool* small?]])</code> | *int* | Alternative to the <code>**v.stringWidth**()</code> but for <code>**V_DrawStrASCII**()</code> drawing function. Get the width of the string in pixels, arguments like <code>videoflags</code> or <code>scale</code> are also accounted in the final size. |
| <code>**V_ConvertStringColor**(*string* str)</code> | *string* | Converts the SRB2 text coloring symbols in <code>str</code> to MM format. Used for <code>**V_DrawStrASCII()**</code> function as it uses a different text coloring format. **Murder Mystery string format** is explained [here](./MM_HUD_Library.md). |
| <code>**V_ConvertStringColor2**(*string* str)</code> | *string* | Converts the MM text coloring symbols in <code>str</code> to SRB2 format. Used for <code>**v.drawString()**</code> to render the MM-formatted strings. **Murder Mystery string format** is explained [here](./MM_HUD_Library.md). |
| <code>**V_DrawTextPatch**(*drawer* v, *int* x, *int* y, *int* xoff, *int* yoff, string[]* data, *int* flags)</code> | nil | Draws a patch using the <code>data</code> in a text form at (x, y) coordinates (with the offset set by <code>xoff</code> and <code>yoff</code>). <code>data</code> is a table of strings, each table element represents a row and each symbol in <code>data[row]</code> corresponds to the color value from the SRB2's palette. |
| <code>**V_TextPatchWidth**(*string[]* data)</code> | *int* | Returns the width of the Text Patch in pixels. |
| <code>**V_TextPatch_SwapColor**(*string[]* data, *int* sourceColor, *int* targetColor)</code> | *string[]* | Swaps each <code>sourceColor</code> pixel to <code>targetColor</code> in a Patch. This function returns the Patch with the swapped colors. |
| <code>**V_GetTextPatchOffsetX**(*string* language, *string* patchname)</code> | *int* | Get the Patch's <code>x</code> offset coordinate from <code>MM.text[language][patchname.."_INFO"]</code> field (if exists). |
| <code>**V_GetTextPatchOffsetY**(*string* language, *string* patchname)</code> | *int* | Get the Patch's <code>y</code> offset coordinate from <code>MM.text[language][patchname.."_INFO"]</code> field (if exists). |
| <code>**V_ScrollTextPatch_Vertical**(*string[]* patch, *int* offset, *boolean* side)</code> | *string[]* | Scroll the Text Patch vertically by <code>offset</code> pixels. By default, the patch is scrolled from right to left but if </code>side</code> is set to `true` the scroll happends from left to right istead. |

### `MINIGAME.LUA`

Functions of global visibility for Pong 2-player Minigame

| Name | Description |
| --- | --- |
| <code>**PONG_SetVelocity**(*int* side) </code> | Set the Pong Ball's velocity. <code>side</code> determines the ball's direction, accepted values are:<table><tr><th><code>side</code> value</th><th>Direction</th></tr> <tr><td><code>< 0</code><td>Left</td></tr> <tr><td><code>0</code></td><td>Random</td></tr><tr><td><code>> 0</code></td><td>Right</td></tr></table> |
| <code>**PONG_Reset**()</code> | Reset the PONG minigame |

### Globally used functions

Functions that are used in more than one script

| Name | Return value | Description |
| --- | --- | --- |
| <code>**PlayerCount**([*int* role])</code> | *int* | Get the total number of players online. If the <code>role</code> is specified return the total number of players who have the <code>role</code>. |
| <code>**PlayersAlive**()</code> | *int* | Get the number of players who are still alive (aren't spectators). |
| <code>**MM_SpawnSHREML**(*int* x, *int* y, *int* z, [*int* timezone])</code> | nil | Spawn the Sheriff's Emerald at (x, y, z) position. <code>timezone</code> argument is optional and is used only go get the timezone the Emerald was spawned in. |
| <code>**P_GetSectorCeilingZAt**(*sector_t* sector, *int* x, *int* y)</code> | *fixed_t* | Returns the height of the sector ceiling at (x, y), works both for regular sectors and slopes. Ported from SRB2 source code |
| <code>**P_GetFOFTopZAt**(*ffloor_t* fof, *int* x, *int* y)</code> | *fixed_t* | Returns the top height of the FOF at (x, y). Ported from SRB2 source code |
| <code>**P_GetFOFBottomZAt**(*ffloor_t* fof, *int* x, *int* y)</code> | *fixed_t* | Returns the bottom height of the FOF at (x, y). Ported from SRB2 source code |
| <code>**isExtendedASCII**(*string* str)</code> | *boolean* | Returns `true` if the <code>str</code> contains a symbol from Extended ASCII Range (`0x80` - `0xFF`) |
| <code>**isStandartASCII**(*string* str)</code> | *boolean* | Returns `true` if all characters in <code>str</code> are from Standart (Printable) ASCII range (`0x20` - `0x7F`). |
| <code>**valid**(* arg)</code> | *boolean* | Simply checks if both <code>arg</code> and <code>arg.valid</code> are true. |
| <code>**SOC_IsTrue**(* arg)</code> | *boolean* | Returns `true` if the <code>arg</code> says so (<code>"true"</code> as string will return `true`). Useful only for boolean-based SOC arguments. |

# Constants

Here is the full list of MM constants:

### Roles

| Constant        | Value | Role     |
| --------------- | ----- | -------- |
| `ROLE_NONE`     | 0     | No role  |
| `ROLE_MURDERER` | 1     | Murderer |
| `ROLE_SHERIFF`  | 2     | Sheriff  |
| `ROLE_INNOCENT` | 3     | Innocent |
| `ROLE_HERO`     | 4     | Hero     |

### Game messages (for <code>MM_ChatprintGlobal()</code>)

| `message_id` | Possible value(s) for `var` | Description |
| --- | --- | --- |
| `"MURD_KILLED"`, `"SHERI_KILLED"`, `"HERO_KILLED"` | *string* | "Murderer/Sheriff/Hero by the name of `var` is killed!". For `"SHERI_KILLED"` it just says that the Sheriff is killed |
| `"SHERI_KILLED_DROP"` | *string* | Same as `"SHERI_KILLED"` but also tells that the *Sheriff's Emerald* is dropped |
| `"MURD_DIED"`, `"SHERI_DIED"`, `"HERO_DIED"` | *string* | "Murderer/Sheriff/Hero by the name of `var` has died in an accident (drown, crushed, fell into the pit)!". For `"SHERI_KILLED"` it just says that the Sheriff has died |
| `"SHERI_DIED_DROP"` | *string* | Same as `"SHERI_DIED"` but also tells that the *Sheriff's Emerald* is dropped |
| `"LAST_LEFT"` | One of the [`ROLE_*`](#role-constants-role) constants (except `ROLE_INNOCENT`) | "The last player with `var` role has left the game!" |
| `"ONE_LEFT"` | One of the [`ROLE_*`](#role-constants-role) constants (except `ROLE_INNOCENT`) | "One of the players with `var` role has left the game!" |
| `"REPLACE_LEFT"` | One of the [`ROLE_*`](#role-constants-role) constants (except `ROLE_INNOCENT`) | "Player with the `var` role left the game! Some random Innocent will take his role!" |
| `"INNO_HURT"` | *1* or *2* | "Innocent is hurt" global notice. The context of the message is different depending on who hit the Civilian: 1 - Sheriff, 2 - Hero. |
| `"WIN"` | One of the [`WIN_*`](#win-reasons-win) constants | The end round message. `var` is the reason of the round end. |

### Win reasons

Win reasons for `MM_EndRound("WIN")` and `MM_ChatprintGlobal("WIN")` functions

| Constant            | Value | Description                                 |
| ------------------- | ----- | ------------------------------------------- |
| `WIN_MURD`          | 1     | Murderers killed everyone                   |
| `WIN_CIVILS`        | 2     | Sheriffs & Heroes  eliminated all Murderers |
| `WIN_SHERIKILLINNO` | 3     | Sheriff killed the last Innocent            |
| `WIN_HEROKILLINNO`  | 4     | Hero killed the last Innocent               |
| `WIN_NODEFENDERS`   | 5     | All Sheriffs and Heros are dead             |

### Time Zones

Time Zone constants tell in what timezone the player (or an object) is existing right now

| Constant               | Value | Description |
| ---------------------- | ----- | ----------- |
| `TIMEZONE_PAST`        | 1     | Past        |
| `TIMEZONE_PRESENT`     | 2     | Present     |
| `TIMEZONE_FUTURE_BAD`  | 3     | Bad Future  |
| `TIMEZONE_FUTURE_GOOD` | 4     | Good Future |

### Time Warp Sign

These contants describe in which direction in the timeline player will warp

| Constant      | Value | Description       |
| ------------- | ----- | ----------------- |
| `TWS_NONE`    | 0     | Warp is not set   |
| `TWS_PAST`    | 1     | Warping to Past   |
| `TWS_FUTURE`  | 2     | warping to Future |

### Weapon configurations

The constants for the configurations flag checks. Useful only with the `mm_wepconfig`'s CVAR value (Bitshift it to the right 2, 4 and 6 times)

| Constant | Value | Description |
| --- | --- | --- |
| `WEPCFG_REDONLY` | 1 | Only the Weapon Slot 1 is usable (Red/Infinite rings. Knife)
| `WEPCFG_DISABLERED` | 2 | Weapon Slot 1 is occupied by the Knife only |

# The core `MM` table

The description of each value in the `MM` table. The `MM` constant itself is defined in [INIT.LUA](../INIT.LUA)

| Name | Type | Description | Example value |
| --- | --- | --- | --- |
| <code>version</code> | *string* | Version number of the add-on | <code>"1.0-ALPHA"</code> |
| <code>debug</code> | *boolean* | Enable/Disable the add-on's *Debug Mode* functionality<br>*Note:* **The add-on must boot with this variable set to <code>true</code> to use the Debug in any form.** | <code>true</code> |
| <code>releasedate</code> | *string* | The release date of the add-on version. | <code>"August 19th 2024"</code> |
| <code>text</code> | *table* | Collection of all text used in **Murder Mystery** with all translations. This variable is **netsynced** | *See [the template file](https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery/blob/main/TEMPLATES/customlang.lua)* |
| <code>RoleColor</code> | *string[5]* | The text colors for roles | *See [<code>INIT.LUA</code>](../INIT.LUA)* |
| <code>RoleColorHUD</code> | *string[5]* | The HUD text colors for roles | *See [<code>INIT.LUA</code>](../INIT.LUA)* |
| <code>hud</code>          | *table* | HUD control variables for each sub-renderer (<code>MM.hud.game</code>, <code>MM.hud.scores</code>, <code>MM.hud.intermission</code>). Each sub-renderer has two attributes: <code>enabled</code> (custom scripts can disable MM's HUD renderers by setting this to <code>false</code>) and <code>pos</code> (coordinates of the different HUD elements) | *See [<code>INIT.LUA</code>](../INIT.LUA)* |
| <code>weaponconfig</code> | *int[4]* | Table to contain the Weapon Configurations. Updated by the `mm_wepconfig` CVAR. | *See [MM_WEPCONFIG.PNG](MM_WEPCONFIG.PNG) and [<code>INIT.LUA</code>](../INIT.LUA)* |
| <code>shwdwn</code>       | *string* | The 6-character name of the current Showdown Duel track playing, also marks if the Duel is happening right now or not | "S2MSBS" |
| <code>winner</code>       | *int* | The winner of the round, can be one of the 3 possible values: *0* - Tie, *1* - Murderer, *2* - Civilians (Sheriffs, Heros and Innocents). This variable is **netsynced** | 0 |
| <code>winreason</code> | *int* | The win reason, can be one of the <code>WIN_*</code> constants. This variable is **netsynced** | 1 |
| <code>timelimit</code> | *int* | Works just like SRB2's vanilla `timelimit` but MM uses its own. The value is measured in Minutes. This variable is **netsynced** | 5 |
| <code>shremls</code> | *mobj_t[]* | The table containing all dropped *Sheriff Emerald* objects | *See [<code>LUA/GAME.LUA</code>](../LUA/GAME.LUA)* |
| <code>pong</code> | *table* | Variables for Pong 2-player minigame. This variable is **netsynced** | *See [<code>INIT.LUA</code>](../INIT.LUA) and [<code>LUA/MINIGAMES/MINIGAMES.LUA</code>](../LUA/MINIGAMES/MINIGAMES.LUA)* |

# That's all folks!
