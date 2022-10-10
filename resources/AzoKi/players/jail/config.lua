JailConfig = {}
JailConfig = setmetatable(JailConfig, {})


jurors = {}
jailedPlayers = {}

JailConfig.courtStartTime = 5

JailConfig.prisonLocation = { x = 1642.34, y = 2570.52, z = 45.56 }
JailConfig.prisonEntraceLocation = { x = 1852.50, y = 2586.00, z = 45.05}

function shuffle(tbl)
  size = #tbl
  for i = size, 1, -1 do
    local rand = math.random(i)
    tbl[i], tbl[rand] = tbl[rand], tbl[i]
  end
  return tbl
end

function getPlayerID(source)
  local identifiers = GetPlayerIdentifiers(source)
  local player = getIdentifiant(identifiers)
  return player
end

function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

function isJailed(permId)
  for i, jailedPlayer in ipairs(jailedPlayers) do
    if permId == jailedPlayer[1] then
      return jailedPlayer
    end
  end
  return false
end

function updateJailTime(permId, newTime)
  for i, jailedPlayer in ipairs(jailedPlayers) do
    if permId == jailedPlayer[1] then
      jailedPlayer[2] = newTime
    end
  end
end

function removedJailedPlayer(permId)
  for i, jailedPlayer in ipairs(jailedPlayers) do
    if permId == jailedPlayer[1] then
      table.remove(jailedPlayers, i)
    end
  end
end

function updateTrialRequest(permId, boolean)
  for i, jailedPlayer in ipairs(jailedPlayers) do
    if permId == jailedPlayer[1] then
      jailedPlayer[4] = boolean
    end
  end
end

function getJuror()
  shuffle(jurors)
  return jurors[1]
end

function inJurorPool(id)
  for i, juror in ipairs(jurors) do
    if id == juror then
      return true
    end
  end
  return false
end

function removeJuror(id)
  for i, juror in ipairs(jurors) do
    if id == juror then
      jurors[i] = nil
    end
  end
end