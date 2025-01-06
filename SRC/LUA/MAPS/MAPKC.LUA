--Stauf's Mansion (MAPKC)
--Level script
--Original map idea by Trilobyte Inc.
--SRB2 map port & code by LeonardoTheMutant

freeslot('sfx_clktic', 'sfx_clkstr')
sfxinfo[sfx_clktic].caption = "Clock tick"
sfxinfo[sfx_clkstr].caption = "Clock strikes"

local currMinute, finished, timeout, strike, notset

addHook("MapLoad", function(mapnum)
    if (mapnum != 472) return end
    if ((os.date("%M") == "00") or (os.date("%M") == "30")) then notset = true end
end)

addHook("ThinkFrame", do
    if (gamemap != 472) return end
    if ((os.date("%M") == "00") or (os.date("%M") == "30")) --it's time to strike
        if (notset) or (os.date("%S") == "00")
            strike = tonumber(os.date("%I")) - 1 --get the number of strikes by reading the current hour
            notset = false
        end
        if (strike) and (not timeout)
            S_StartSound(nil, sfx_clkstr)
            strike = $ - 1
            timeout = 70 --2 seconds
        end
        if (timeout)
            timeout = $ - 1
        end
    end
end)