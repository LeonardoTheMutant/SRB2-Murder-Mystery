--The Backrooms (MAPK6)
--Level script
--Map & code by LeonardoTheMutant

addHook("MapLoad", function(map)
    if (gametype != GT_LTMMURDERMYSTERY) or (map != 466) return end

    local random = P_RandomByte()

    if (MM.debug)
        print("\x82Seed: "..random)
        for i=0,7 do
            if (random & (2^i))
                print("\x85"..(i+1).." "..(random & (2^i)))
            else
                print("\x83"..(i+1).." "..(random & (2^i)))
            end
        end
    end

    for sector in sectors.iterate --iterate through every sector in the map
        for fof in sector.ffloors() --iterate through every FOF in the sector (if it has one)
            if (random & (2^(fof.master.tag - 1)))
                fof.flags = $ & ~FOF_EXISTS --remove the FOF from existence
            end
        end
    end
end)
