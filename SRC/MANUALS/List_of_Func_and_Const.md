## List of Murder Mystery Functions and Constants
### For Murder Mystery `10.0-BETA` 
---
This document contains the description of some important functions and constants which are used in Murder Mystery's LUA source code.

<font color="red">Please note that this project is in ***BETA*** state and everything you see here can be completely changed in the next release</font>

## Table of Contents
- [Functions](#functions)
    - [`INIT.LUA`](#initlua)
        - [Customisation API](#customisation-api)
    - [`FUNCTIONS.LUA`](#functionslua)
        - [`GAME.LUA`](#gamelua)
        - [`HUD.LUA`](#hudlua)
        - [`CHAT.LUA`](#chatlua)
        - [`CCMD.LUA`](#ccmdlua)
        - [`WEAPONS.LUA`](#weaponslua)
        - [`MINIGAME.LUA`](#minigamelua)
        - [Globaly used functions](#globaly-used-functions)
- [Constants](#constants)
    - [Role constants (`ROLE_*`)](#role-constants-role)
    - [`MM_ChatprintGlobal()` messages](#possible-messages-for-mmchatprintglobal)
    - [Win reasons (`WIN_*`)](#win-reasons-win)
    - [The core `MM` table](#the-core-mm-table)

# Functions

## `INIT.LUA`
### Customisation API
There are two customization functions in initialization script that allow you create your own mods for the Murder Mystery gametype. Both functions are defined in `MM` table inside the code.

| Name | Description |
| --- | --- |
| <code>**MM.AddLang**(*string* index, *table* lang)</code> | Add a translation into MM. `index` is usually a 2 or 3 characters long name of the language. For example `"EN"` shows that the language is English. `table` is the translation data itself. The format of the `table` can be found [here](https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery/blob/main/ASSETS/customlang.lua).<br>*Note:* Index should be all characters **UPPERCASE** otherwise it won't be accesible!
| <code>**MM.AddCharConf**(*string* skin, *table* abilities)</code> | Add an add-on character configuration for `MMCHARMODE 1` in-game option. In this mode all characters have their abilities back but in limited form.<br>There is a built-in table in MM for vanilla characters which contains their character configs for this mode (`actionspd`, `ability`, `ability2`, `charflags`, etc.). If custom character has no such configuration it is threated as a Sonic (limited Thok, slower spindash and more).<br><code>skin</code> is the name of the skin that is actually used in `skins[]` table. <code>table</code> is the config data itself. The format of <code>table</code> can be found [here](https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery/blob/main/ASSETS/customchar.lua).

## `FUNCTIONS.LUA`
There is a dedicated LUA script that contains the code of some MM functions. Some of those functions are used in only one LUA script and some are used globally.

### `GAME.LUA`
These are the functions that are used in [`GAME.LUA`](../LUA/MAIN//GAME.LUA):
| Name | Return value | Description |
| --- | --- | --- |
| <code>**MM_AssignRoles**()</code> | nil | The main role assigner function. Called durring `MapLoad` hook and when another player joins the game with a single player online.<br>Iterates through all players and makes them **Murderers**, **Sheriffs**, **Innocent** randomly. Then it tells the assigned role to each player personally.<br>If the splitscreen game is loaded it switches the game to MATCH and prints a warning message.<br>*In Debug Mode*: Prints the results of the function execution globally in the console. |
| <code>**MM_GetRoleMultiplier**()</code> | nil | Get the number of role duplicates. It is primarily used in `MM_AssignRoles()` to understand how many players should share **Murderer** or **Sheriff** role. It is also used to adjust the map timelimit when a level starts. |
| <code>**MM_ChatprintGlobal**(*string* message_id, * var)</code> | nil | Works similarly to `chatprint()` but prints the message in player's language. Unlike `chatprint()` this function can print only the MM game messages. Possible values for the arguments of this function are shown [here](#possible-messages-for-mmchatprintglobal) |
| <code>**MM_KillPlayer**(*mobj_t* player, [*mobj_t* attacker])</code> | nil | Make <code>player</code> *DEAD*. <code>attacker</code> is a player who killed the <code>player</code>, it is used to print the killer's name for the <code>player</code>. If the <code>attacker</code> is not specified the killer's name is `"your stupidity"` instead.<br>*Note:* Both <code>player</code> and <code>attacker</code> have to be `mobj_t`! |
| <code>**MM_HitTeammate**(*player_t* victim, *player_t* attacker)</code> | nil | Make <code>victim</code> being hit by a teammate <code>attacker</code>. This function prints personal messages to both <code>victim</code> and <code>attacker</code> to let them know that they are in one team and they should not hit each other next time. |
| <code>**MM_EndRound**(*int* win, * var, [*int* winreason])</code> | nil | Finish the round. `w` specifies the winner, possible values are: 0 - Tie, 1 - Murderers, 2 - Civilians (Sheriffs, Heros & Innocents). `winreason` is optional but can be one of the [`WIN_*` constants](#win-reasons-win). |
| <code>**MM_CheckPlayers**()</code> | nil | A very small function to check the current state of the game. It can announce Murderers as winners when everyone is dead or enable the music for Showdown Duel. |
| <code>**MM_SetRandomInnoAs**(*int* role)</code> | nil | Similar to `MM_AssignRoles()` but works for only for Innocents. In some gameplay situations, there has to be a replacement of the player with some important <code>role</code> and this function selects random Innocent to give the <code>role</code> to it. Any of the `ROLE_*` constants (except `ROLE_INNOCENT`) can act as a possible value for the <code>role</code> argument. |
| <code>**MM_GetMMSHREMLinterval**(*int* distance)</code> | *int* | Get the interval time in tics between each radar beep depending on the `dist` distance. Used for Innocents' Sheriff Emerald radar. |

### `HUD.LUA`
Functions for HUD rendering code
| Name | Return value | Description |
| --- | --- | --- |
| <code>**V_DrawStrASCII**(*drawer* v, *int* x, *int* y, *string* lang_index, *string* str, [*int* videoflags, [*fixed_t* scale]]) | nil | An alternative to `v.drawString()`. This function supports text rendering in different character encodings. `lang_index` specifies the language to use (takes the `"CHARSET"` value from the language data). <code>str</code> is the string to render. <code>scale</code> sets the scale of the letters, for example, `FRACUNIT/2` is half a size and `FRACUNIT*4` is four times larger than normal<br>*Note:* Each character from the Extended ASCII range (0x80-0xFF) should be typed as an escape code of the character in `str` string|
| <code>**V_DrawStrASCIIcentered**(*drawer* v, *int* x, *int* y, *string* lang_index, *string* str, [*int* videoflags, [*fixed_t* scale]]) | nil | Same as `V_DrawStrASCII()` but renders the string relatively centered to the <code>x</code> coordinate |
| <code>**V_StrWidthASCII**(*string* str, [*int* videoflags, [*fixed_t* scale]]) | *int* | Alternative to the `v.stringWidth()` but for `V_DrawStrASCII()` drawing function. Get the width of the string in pixels, arguments like <code>videoflags</code> or <code>scale</code> are also accounted in the final size. |
| <code>**V_ConvertStringColor**(*string* str) | *string* | Converts the SRB2 text coloring symbols in `str` to MM format. Used for `V_DrawStrASCII()` function as it uses a different text coloring format. **Murder Mystery string format** is explained [here](/SRC/DOCS/MM_String_Format.md). |
| <code>**V_ConvertStringColor2**(*string* str) | *string* | Converts the MM text coloring symbols in `str` to SRB2 format. Used for `v.drawString()` to render the MM-formatted strings. **Murder Mystery string format** is explained [here](/SRC/DOCS/MM_String_Format.md). |
| <code>**V_DrawTextPatch**(*drawer* v, *int* x, *int* y, *string[]* data) | nil | Draws a patch using the `data` in a text form. `data` is a table of strings, each table element represents a row and each symbol in `data[row]` corresponds to the color value from the SRB2's palette. |
| <code>**V_TextPatchWidth**(*string[]* data) | *int* | Returns the width of the Text Patch in pixels |
| <code>**V_TextPatch_SwapColor**(*string[]* data, *int* sourceColor, *int* targetColor) | *string[]* | Swaps each `sourceColor` pixel to `targetColor` in a Patch. This function returns the Patch with the swapped colors |
| <code>**wep2rw**(*int* wep) | *`RW_*` constant* | Conerts `WEP_*` to `RW_*` constant |
| <code>**V_GetSHREMLiconID**(*int* dist)</code> | *int* | Get the Emerald Radar icon ID based on the `dist` distance. Used for Innocets' Sheriff Emerald radar. |

### `CHAT.LUA`
The only function for chat script
| Name | Description |
| --- | --- |
| <code>**MM_ChatPlaySFX**(*int* sfx)</code> | Start the SFX by `sfx` id for everyone. |

### `CCMD.LUA`
The only function for Console Commands script
| Name | Description |
| --- | --- |
| <code>**MM_PrintContents**(*player_t* player, *string* lang)</code> | Prints the contents of the `MM.text[lang]["MMHELP_CMD"]["CONTENTS"]` to `player`'s console |

### `WEAPONS.LUA`
Functions used for vanilla weapon ring recreation. **Functions from this section are ported directly from SRB2 C source code**
| Name | Description |
| --- | --- |
| <code>**P_DrainWeaponAmmo**(*player_t* player, *int* weapon)</code> | Drain weapon ring ammo from the player. |
| <code>**P_SetWeaponDelay**(*player_t* player, *int* delay)</code> | Make `player` unable to shoot for `delay` tics. Knuckles has a special exception here and has only 2/3 of the regular delay time. |

### `MINIGAME.LUA`
Functions of global visibility for Pong 2-player Minigame
| Name | Description |
| --- | --- |
| <code>**PONG_SetVelocity**(*int* side) </code> | Set the Pong Ball's velocity. `side` determines the ball's direction, accepted values are:<table><tr><th><code>side</code> value</th> <th>Direction</th></tr><tr><td><code>< 0</code></td> <td>Left</td></tr><tr><td><code>0</code></td> <td>Random</td></tr><tr> <td><code>> 0</code></td> <td>Right</td></tr></table> |
| <code>**PONG_Reset**()</code> | Reset the PONG minigame |

### Globally used functions
Functions that are used in more than one script
| Name | Return value | Description |
| --- | --- | --- |
| <code>**PlayerCount**([*int* role])</code> | *int* | Get the total number of players online. If the `role` is specified return the total number of players who have the `role`. |
| <code>**PlayersAlive**()</code> | *int* | Get the number of players who are still alive (aren't spectators). |
| <code>**MM_SpawnSHREML**(*int* x, *int* y, *int* z)</code> | nil | Spawn the Sheriff's Emerald at (x, y, z) position
| <code>**P_GetSectorFloorZAt**(*sector_t* sector, *int* x, *int* y)</code> | *fixed_t* | Returns the height of the sector floor at (x, y), works both for regular sectors and slopes. Ported from SRB2 source code. |
| <code>**P_GetSectorCeilingZAt**(*sector_t* sector, *int* x, *int* y)</code> | *fixed_t* | Returns the height of the sector ceiling at (x, y), works both for regular sectors and slopes. Ported from SRB2 source code. |
| <code>**P_GetFOFTopZAt**(*ffloor_t* fof, *int* x, *int* y)</code> | *fixed_t* | Returns the top height of the FOF at (x, y). Ported from SRB2 source code. |
| <code>**P_GetFOFBottomZAt**(*ffloor_t* fof, *int* x, *int* y)</code> | *fixed_t* | Returns the bottom height of the FOF at (x, y). Ported from SRB2 source code. |


# Constants
Here is the full list of MM constants:

### Role constants (`ROLE_*`)

| Constant | Value | Role |
| --- | --- | --- |
| `ROLE_NONE` | 0 | No role |
| `ROLE_MURDERER` | 1 | Murderer |
| `ROLE_SHERIFF` | 2 | Sheriff |
| `ROLE_INNOCENT` | 3 | Innocent |
| `ROLE_HERO` | 4 | Hero |

### Possible messages for `MM_ChatprintGlobal()`
| `message_id` | possible value(s) for `var` | Description |
| --- | --- | --- |
| `"MURD_KILLED"`, `"SHERI_KILLED"`, `"HERO_KILLED"` | *string* | "Murderer/Sheriff/Hero by the name of `var` is killed!". For `"SHERI_KILLED"` it also says that *Sheriff's Emerald* is dropped
| `"SHERI_KILLED_NODROP"` | *string* | Same as `"SHERI_KILLED"` but without a drop info |
| `"LAST_LEFT"` | One of the [`ROLE_*`](#role-constants-role) constants (except `ROLE_INNOCENT`) | "The last player with `var` role has left the game!" |
| `"ONE_LEFT"` | One of the [`ROLE_*`](#role-constants-role) constants (except `ROLE_INNOCENT`) | "One of the players with `var` role has left the game!" |
| `"REPLACE_LEFT"` | One of the [`ROLE_*`](#role-constants-role) constants (except `ROLE_INNOCENT`) | "Player with the `var` role left the game! Some random Innocent will take his role!" |
| `"INNO_HURT"` | *1* or *2* | "Innocent is hurt" global notice. The context of the message is different depending on who hit the Civilian: 1 - Sheriff, 2 - Hero. |
| `"WIN"` | One of the [`WIN_*`](#win-reasons-win) constants | The end round message. `var` is the reason of the round end. |

### Win reasons (`WIN_*`)
Win reasons for `MM_EndRound("WIN")` and `MM_ChatprintGlobal("WIN")` functions

| Constant | Value | Description |
| --- | --- | --- |
| `WIN_MURD` | 1 | Murderers killed everyone |
| `WIN_CIVILS` | 2 | Sheriffs & Heroes  eliminated all Murderers |
| `WIN_SHERIKILLINNO` | 3 | Sheriff killed the last Innocent |
| `WIN_HEROKILLINNO` | 4 | Hero killed the last Innocent |
| `WIN_NODEFENDERS` | 5 | All Sheriffs and Heros are dead |

### The core `MM` table
The description of each value in the `MM` table. The `MM` constant itself is defined in [INIT.LUA](../INIT.LUA)
| Name | Type | Description | Example value |
| --- | --- | --- | --- |
| `version` | *string* | Version number of the build | `"10.0-BETA"` |
| `devbuild` | *boolean* | Mark add-on build as a *Developer Build*, when set to `true` it enables the *Debug Mode* in the add-on | `true` |
| `releasedate` | *string* | The release date of the version. If the version is not released it can be `"Not released yet"` | `"December 28th 2023"` |
| `text` | *table* | Collection of all text used in **Murder Mystery** with all translations. This variable is **netsynced** | [*See the template file*](https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery/blob/main/ASSETS/customlang.lua) |
| `SEMJ_info` | *string[]* | The Sound Emoji description table for ***MMHELP CHAT*** console command | [*See `INIT.LUA`*](../INIT.LUA) |
| `CharStats` | *table* | The character configurations for ***MMCHARMODE 1*** character mode. This variable is **netsynced** | *See [`INIT.LUA`](../INIT.LUA) and [`LUA/MAIN/ABILITIES.LUA`](../LUA/MAIN/ABILITIES.LUA)* |
| `RoleColor` | *string[]* | The text colors for roles | [*See `INIT.LUA`*](../INIT.LUA) |
| `RoleColor` | *string[]* | The HUD text colors for roles | [*See `INIT.LUA`*](../INIT.LUA) |
| `winner` | *int* | The winner of the round, can be one of the 3 possible values: *0* - Tie, *1* - Murderer, *2* - Civilians (Sheriffs, Heros & Innocents). This variable is **netsynced** | 0 |
| `winreason` | *int* | The win reason, can be one of the [`WIN_*` constants](#win-reasons-win). This variable is **netsynced** | 1 |
| `timelimit` | *int* | Works just like SRB2's vanilla ***timelimit*** but MM uses its own. The value is measured in Minutes. This variable is **netsynced** | 5 |
| `shremls` | *mobj_t[]* | The table containing all dropped *Sheriff Emerald* objects | none |
| `pong` | *table* | Variables for Pong 2-player minigame. This variable is **netsynced** | *See [`INIT.LUA`](../INIT.LUA) and [`LUA/MAIN/MINIGAME.LUA`](../LUA/MAIN/MINIGAME.LUA)*|

# That's all folks!