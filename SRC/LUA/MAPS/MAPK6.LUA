--The Backrooms (MAPK6)
--Level script
--Map & code by LeonardoTheMutant

addHook("MapLoad", function(map)
    if (gametype ~= GT_LTMMURDERMYSTERY) or (map ~= 466) then return end

    local random = P_RandomByte()

    if (MM.debug) then
        printf("\x82Seed: %d", random)
        for i=0,7 do
            local rand = random & (2^i)
            if (rand) then
                printf("\x85%d %d", (i+1), rand)
            else
                printf("\x83%d %d", (i+1), rand)
            end
        end
    end

    for sector in sectors.iterate do --iterate through every sector in the map
        for fof in sector.ffloors() do --iterate through every FOF in the sector (if it has one)
            if (random & (2^(fof.master.tag - 1))) then
                fof.flags = fof.flags & ~FOF_EXISTS --remove the FOF from existence
            end
        end
    end
end)
