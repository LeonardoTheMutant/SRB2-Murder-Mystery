## List of Murder Mystery Functions and Constants
### For Murder Mystery `9.0-BETA` 
---
I think you have wondered at least once what some functions and constants in our LUA code do and so we present a full list of functions and constants in MM with the proper description for each of them (comments in code may be not enough sometimes).

<font color="red">Please note that this project is in __BETA__ state and everything you see here can change in the future release</font>

| Table of Contents |
| --- |
| [Functions](#functions) |
| 1. [`INIT.LUA`](#initlua)
| 1.1 [Customisatiion API](#customisation-api) |
| 1.2 [Miscelaneous](#miscalaneous)
| 2. [`FUNCTIONS.LUA`](#functionslua) |
| 2.1 [`GAME.LUA`](#gamelua) |
| 2.2 [`HUD.LUA`](#hudlua) |
| 2.3 [`CHAT.LUA`](#chatlua) |
| 2.4 [`CCMD.LUA`](#ccmdlua) |
| 2.5 [Globaly used functions](#globaly-used-functions) |
| [Constants](#constants) |
| 1. [Role constants (`ROLE_*`)](#role-constants-role)
| 2. [`chatprintGlobal()` messages](#possible-messages-for-chatprintglobal)
| 3. [Win reasons (`WIN_*`)](#win-reasons-win) |
| 4. [The core `MM` table](#the-core-mm-table) |

# Functions

## `INIT.LUA`
### Customisation API
There are the functions that allow the creattion of MM mods. There are only 2 of them and both are defined in `MM` which is defined in `INIT.LUA`.

| Name | Description |
| --- | --- |
| <code>**MM.AddLang**(*string* index, *table* lang)</code> | Add a language translation into MM. `index` is usually a 2 or 3 characters long name of the language. For example `"EN"` shows that the language is English. `table` is the language data itself. The format of the `table` can be found [here](https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery/blob/main/ASSETS/customlang.lua).<br>*Note:* Index should be all characters **UPPERCASE** otherwise it won't be accesible!
| <code>**MM.AddCharStat**(*string* skin, *table* abilities)</code> | Add a character configuration for custom character in `MMCHARMODE 1` in-game option. In this mode all characters have their abilities back but in limited form.<br>There is a table for vanilla characters which contains their character configs for this mode (`actionspd`, `ability`, `ability2`, `charflags`, etc.). If custom character has no such configuration it is threated as a Sonic (limited Thok, slower spindash and more).<br>`skin` is the name of the skin that is actually used in `skins[]` table. `table` is the config data itself. The format of `table` can be found [here](https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery/blob/main/ASSETS/customchar.lua).

### Miscalaneous
| Name |  Description |
| --- | --- |
| <code>**VarChange**(*consvar_t* var)</code> | A callback function for `mmcharmode` and `mmsprint` console variables. Both are using this function to display their new values.

## `FUNCTIONS.LUA`
There is a dedicated LUA file which contains all MM functions. Everything outside Customisation API is defined here. Some of those functions are used in only one LUA file but some are used globaly.
### `GAME.LUA`
These are the functions which are used in [`GAME.LUA`](/LUA/MAIN//GAME.LUA):
| Name | Description |
| --- | --- |
| <code>**AssignRoles**()</code> | The main role assigner function. Called at `MapLoad` hook or when 2nd player joins the game with one player.<br>Iterates through all players and makes them **Murderer**, **Sheriff** or **Innocent** randomly. Then it personally tells to the player the role.<br>If splitscreen game is loaded it switches the game to MATCH and prints a warning message.<br>*In Debug Mode*: Prints the results of the function execution in console to every player. |
| <code>**chatprintGlobal**(*string* message_id, * var)</code>  | Works similarly to `chatprint()` but prints the message in player's language. Unlike `chatprint()` this function can print only the MM game messages. Possible values for the arguments of this function are shown [here](#possible-messages-for-chatprintglobal) |
| <code>**KillPlayer**(*mobj_t* player, [*mobj_t* atacker])</code> | Make `player` *DEAD*. `atacker` is a player who killed the `player`, it is used to print killer's name for `player`. If `atacker` is not specified the killer's name is "your stupidity" instead.<br>*Note:* Both `player` and `atacker` have to be `mobj_t`! |
| <code>**endRound**(*int* win, * var, [*int* winreason])</code> | Finish the round. `w` specifies the winner, possible values are: 0 - Tie, 1 - Murderers, 2 - Civilians (Sheriffs, Heros & Innocents). `winreason` is optional but can be one of the [`WIN_*` constants](#win-reasons-win). |
| <code>**CheckPlayers**()</code> | A very small function to check the current state of the game. It can announce Murderers as winners when everyone is dead or enable the music for Showdown Duel. |
| <code>**SetRandomInnoAs**(*int* role)</code> | Similar to `AssignRoles()` but works for Innocents only in the middle of the game. In some gameplay situations there has to be a replacement of some inportant `role` and this functions selects random Innocent to give the `role` to it. Any of the `ROLE_*` constants (except `ROLE_INNOCENT`) can act as a possible value for the `role` argument. |

### `HUD.LUA`
Functions for HUD rendering code
| Name | Return value | Description |
| --- | --- | --- |
| <code>**drawStrCentered**(*drawer* v, *int* y, *string* str, [*int* videoflags, [*string* font]])</code> | *nil* | Same as `v.drawString()` but draws the string centered on the screen. |
| <code>**wep2rw**(*int* wep) | `RW_*` constant | Conerts `WEP_*` to `RW_*` constant |

### `CHAT.LUA`
The only function for chat script
| Name | Description |
| --- | --- |
| <code>**chatplaySFX**(*int* sfx)</code> | Start the SFX by `sfx` id for everyone. |

### `CCMD.LUA`
The only function for Console Commands script
| Name | Description |
| --- | --- |
| <code>**printContents**(*player_t* player, *string* lang)</code> | Prints the contents of the `MM.text[lang]["MMHELP_CMD"]["CONTENTS"]` to `player`'s console |

### Globaly used functions
Functions which are used in more than one script
| Name | Return value | Description |
| --- | --- | --- |
| <code>**PlayerCount**([*int* role])</code> | *int* | Get the total number of players online. If `role` is specified return the total number of players with `role`. |
| <code>**PlayersAlive**()</code> | *int* | Get the number of players who are still alive (`player.spectator==false`).

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

### Possible messages for `chatprintGlobal()`
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
Win reasons for `endRound("WIN")` and `chatprintGlobal("WIN")` functions

| Constant | Value | Description |
| --- | --- | --- |
| `WIN_MURD` | 1 | Murderers killed everyone |
| `WIN_SHERI` | 2 | Sheriffs eliminated all Murderers |
| `WIN_INNOSHERI` | 3 | Sheriff killed the last Innocent |
| `WIN_INNOHERO` | 4 | Hero killed the last Innocent |
| `WIN_DEFENDERS` | 5 | All Sheriffs and Heros are dead |

### The core `MM` table
The description of each value in `MM` table. The `MM` constant itself is defined in [INIT.LUA](../INIT.LUA)
| Name | Type | Description | Example value |
| --- | --- | --- | --- |
| `version` | *string* | Version number of the build | `"9.0-BETA"` |
| `devbuild` | *string* | Date of the build compilation, if not `nil` this variable enables the *Debug Mode* | `"dev021023"` |
| `releasedate` | *string* | The release date of the version. If the version is not released it can be `"Not released yet"` | `"October 2nd 2023"` |
| `text` | *table* | Collection of all text used in **Murder Mystery** with all translations. This variable is **netsynced** | [*See the example file*](https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery/blob/main/ASSETS/customlang.lua) |
| `SEMJ_info` | multiple *strings* | The Sound Emoji description table for ***MMHELP CHAT*** console command | [*See `INIT.LUA`*](../INIT.LUA) |
| `CharStats` | *table* | The character configurations for ***MMCHARMODE 1*** character mode. This variable is **netsynced** | [*See `INIT.LUA`*](../INIT.LUA) |
| `RoleColor` | multiple *strings* | The text colors for roles | [*See `INIT.LUA`*](../INIT.LUA) |
| `winner` | *int* | The winner of the round, can be one of the 3 possible values: *0* - Tie, *1* - Murderer, *2* - Civilians (Sheriffs, Heros & Innocents). This variable is **netsynced** | 0 |
| `winreason` | *int* | The win reason, can be one of the [`WIN_*` constants](#win-reasons-win). This variable is **netsynced** | 1 |
| `timelimit` | *int* | Works as SRB2's vanilla ***timelimit*** but MM uses its own. The value is measured in Minutes. This variable is **netsynced** | 5 |
| `shreml_dropped` | *int* | The current number of *Sheriff Emeralds* dropped | 0 |

# That's all folks!