---@author Pablo Z.
---@version 1.0
--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local playersJobsCache = {}

AzoKiSJobsManager = {}
AzoKiSJobsManager.list = {}

---getJob
---@public
---@return Job
AzoKiSJobsManager.getJob = function(job)
    return AzoKiSJobsManager.list[job]
end

AzoKi.netHandleBasic("playerDropped", function(reason)
    playersJobsCache[source] = nil
end)

--[[
AzoKi.netHandle("esxloaded", function()
    MySQL.Async.fetchAll("SELECT * FROM jobs WHERE useCutomSystem = 1", {}, function(result)
        for _,job in pairs(result) do
            if not AzoKiSharedCustomJobs[job.name] then
                print(AzoKi.prefix(AzoKiPrefixes.jobs,("Impossible de charger le job %s"):format(job.label)))
            else
                local society = ("society_%s"):format(job.name)
                TriggerEvent('esx_society:registerSociety', job.name, job.label, society, society, society, {type = 'private'})
                print(AzoKi.prefix(AzoKiPrefixes.jobs,("Chargement du job ^4%s ^7!"):format(job.name)))
                Job(job.name, job.label)
                AzoKiSharedCustomJobs[job.name].onThisJobInit(AzoKiSJobsManager.list[job.name])
            end
        end
    end)
end)
--]]

AzoKi.netRegisterAndHandle("jobInitiated", function(job)
    local source = source
    playersJobsCache[source] = {name = job.name, grade = job.grade_name, isCustom = AzoKiSJobsManager.getJob(job.name) ~= nil}
    if not AzoKiSJobsManager.getJob(job.name) then
        return
    end
    ---@type Job
    local AzoKiJob = AzoKiSJobsManager.getJob(job.name)
    AzoKiJob:subscribe(source, job.grade_name)
end)

AzoKi.netRegisterAndHandle("jobUpdated", function(newJob)
    local source = source
    local previousCache = playersJobsCache[source]
    local newCache = {name = newJob.name, grade = newJob.grade_name, isCustom = AzoKiSJobsManager.getJob(newJob.name) ~= nil}

    if previousCache.name ~= newJob.name then
        -- Changement de job
        ---@type Job
        if previousCache.isCustom then
            local previousJob = AzoKiSJobsManager.getJob(previousCache.name)
            previousJob:unsubscribe(source, previousCache.grade)
        end
        if newCache.isCustom then
            local newAzoKiJob = AzoKiSJobsManager.getJob(newCache.name)
            newAzoKiJob:subscribe(source, newCache.grade)
        end
    else
        if newCache.isCustom then
            if previousCache.grade ~= newCache.grade then
                local AzoKiJob = AzoKiSJobsManager.getJob(newCache.name)
                if previousCache.grade == "boss" then
                    AzoKiJob:alterBossAccess(source, false)
                elseif newCache.grade == "boss" then
                    AzoKiJob:alterBossAccess(source, true)
                end
            end
        end
    end

    playersJobsCache[source] = newCache
end)