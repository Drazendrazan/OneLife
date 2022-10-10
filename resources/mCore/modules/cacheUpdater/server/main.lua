--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

AzoKiSCache = {}

AzoKiSCache.caches = {}
AzoKiSCache.relativesDb = {}

AzoKiSCache.getCache = function(index)
    return AzoKiSCache.caches[index] or {}
end

AzoKiSCache.addCacheRule = function(index, sqlTable, updateFrequency)
    AzoKiSCache.caches[index] = {}
    AzoKiSCache.relativesDb[sqlTable] = { index = index, interval = updateFrequency }
    AzoKiServerUtils.trace(("Ajout d'une règle de cache: ^2%s ^7sur ^3%s"):format(index,sqlTable), AzoKiPrefixes.sync)
end

AzoKiSCache.removeCacheRule = function(sql)
    AzoKiSCache.caches[AzoKiSCache.relativesDb[sql]] = nil
    AzoKi.cancelTaskNow(AzoKiSCache.relativesDb[sql].processId)
    AzoKiServerUtils.trace(("Retrait d'une règle de cache: ^2%s"):format(AzoKiSCache.relativesDb[sql].index), AzoKiPrefixes.sync)
    AzoKiSCache.relativesDb[sql] = nil
end

AzoKi.netHandle("esxloaded", function()
    while true do
        for sqlTable, infos in pairs(AzoKiSCache.relativesDb) do
            if not infos.processId then
                infos.processId = AzoKi.newRepeatingTask(function()
                    MySQL.Async.fetchAll(("SELECT * FROM %s"):format(sqlTable), {}, function(result)
                        if AzoKiSCache.caches[infos.index] ~= nil then
                            AzoKiSCache.caches[infos.index] = result
                        end
                    end)
                end, nil, 0, infos.interval)
            end
        end
        Wait(AzoKi.second(1))
    end
end)

