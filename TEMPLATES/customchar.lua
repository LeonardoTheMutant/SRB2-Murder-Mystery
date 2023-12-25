-- SRB2 MURDER MYSTERY Custom Character Config file template
-- THIS FILE MUST BE LOADED AFTER THE MAIN MM .PK3
--
-- You can use this file as a template to add a configuration for 
-- your own custom character to MM
--
-- Character Configuration is requiered for your characters to work
-- in MM. If MMCHARMODE Console Variable is disabled in the game all
-- characters use the same abilities set (except custom chars with custom
-- abilities and buttons). If MMCHARMODE is enabled all characters
-- reacieve their ablities back but in limited form. Custom characters
-- without configs are treated as Sonic and will use limited Thok with
-- the Spindash. Character Configs describe how the abilities will work
-- for your character with MMCHARMODE On.

local configtable={ --define your config table
    ability=CA_THOK, --tell what primary special ability your character will have, must be one of the CA_* constants
    ability2=CA2_SPINDASH, --what secondary special ability it has? Must be one of the CA2_* constants
    actionspd=30*FU, --the speed value of the character's primary special ability.
    charflags=0, --character flags, this is a combination of SF_* constants
    mindash=5*FU, --minimum speed at which the character can spin at after charging a spindash
    maxdash=40*FU --maximum speed at which the character can spin at after charging a spindash
}
--Finally add your character config into the game
--This function has 2 arguments:
-- First is the string of the skin's name as it appears in skins[]
-- if it will be incorect MM will refuse to add it
-- Second argument is the variable with your config table you defined earlier
MM.AddCharStat("sonic", configtable)
--If everyting loads correctly your character will be limited in his
--abilities with MMCHARMODE Enabled
--
--In case this character config is going to be posted on SRB2 Message Board please rename this file like:
-- MML_[full_char_name]_v[this_file_ver].lua
--
--If your character is incompatible with MMCHARMODE disabled please
--don't play MM with it at all.
--Thanks.