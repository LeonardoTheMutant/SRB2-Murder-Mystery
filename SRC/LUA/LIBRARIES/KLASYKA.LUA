-- KLASYKA.LUA
-- Code by LeonardoTheMutant
--
-- A compatibility layer for mods to run under vanilla SRB2 and SRB2 Classic
-- Library name comes from the ukrainian word "Classic" (orig. "Класика")

rawset(_G, "srb2classic", MODVERSION == 58)

rawset(_G, "KLASYKA", {})

--P_RandomKey()
KLASYKA.RandomKey = function(a)
	local returnValue
	if (srb2classic) then
		returnValue = random.key(a)
	else
		returnValue = P_RandomKey(a)
	end
	return returnValue
end

--v.RandomKey()
KLASYKA.V_RandomKey = function(v)
	local returnValue
	if (srb2classic) then
		returnValue = random.key(a)
	else
		returnValue = v.RandomKey(a)
	end
	return returnValue
end

--P_RandomRange()
KLASYKA.RandomRange = function(a, b)
	local returnValue
	if (srb2classic) then
		returnValue = random.key(a)
	else
		returnValue = P_RandomKey(a)
	end
	return returnValue
end

--v.RandomRange()
KLASYKA.V_RandomRange = function(v, a, b)
	local returnValue
	if (srb2classic) then
		returnValue = random.localRange(a, b)
	else
		returnValue = v.RandomRange(a, b)
	end
	return returnValue
end
