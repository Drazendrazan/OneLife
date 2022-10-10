---@author Pablo Z.
---@version 1.0
--[[
  This file is part of AzoKi RolePlay.
  
  File [Robbery] created at [11/05/2021 20:35]

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

---@class Robbery
---@field public interior number
---@field public possibleObjects table
---@field public possibleOponents table
---@field public id number
---@field public name string

---@field protected savedInfos table
---@field protected isActive boolean


---@field protected entryZone number
---@field protected exitZone number
---@field protected exitBlip number

---@field protected blip number
---@field protected difficultyIndex number


Robbery = {}
Robbery.__index = Robbery

setmetatable(Robbery, {
    __call = function(_, receivedId, robberyInfos)
        local self = setmetatable({}, Robbery);
        self.isActive = true
        self.id = receivedId
        self.difficultyIndex = robberyInfos.difficultyIndex
        self.interior = robberyInfos.interior
        self.possibleObjects = robberyInfos.possibleObjects
        self.possibleOponents = robberyInfos.possibleOponents
        self.name = robberyInfos.name
        self.savedInfos = robberyInfos
        self.blip = AzoKiSBlipsManager.createPublic(robberyInfos.entry, 171, 47, 0.8, "Cambriolage", true)
        self.entryZone = AzoKiSZonesManager.createPublic(robberyInfos.entry, 22, { r = 255, g = 0, b = 0, a = 255 }, function(source)
            self:openMenu(source)
        end, "Appuyez sur ~INPUT_CONTEXT~ pour vérifier la serrure", 25.0, 1.0)
        self.exitZone = AzoKiSZonesManager.createPrivate(AzoKiSharedRobberiesInteriors[self.interior].out, 22, { r = 255, g = 0, b = 0, a = 255 }, function(source)
            self:exitRobbery(source, false)
        end, "Appuyez sur ~INPUT_CONTEXT~ pour sortir de cette propriétée", 150.0, 1.0, {})
        self.exitBlip = AzoKiSBlipsManager.createPrivate(AzoKiSharedRobberiesInteriors[self.interior].out, 126, 69, 0.8, "Sortie", false)
        return self;
    end
})

---openMenu
---@public
---@return void
function Robbery:openMenu(source)
    AzoKiServerUtils.toClient("robberiesOpenMenu", source, self.id, self.isActive, self.difficultyIndex)
end

---startCooldown
---@public
---@return void
function Robbery:startCooldown()
    AzoKi.newWaitingThread(AzoKi.second(60 * 15), function()
        self.entryZone = AzoKiSZonesManager.createPublic(self.savedInfos.entry, 22, { r = 255, g = 0, b = 0, a = 255 }, function(source)
            self:openMenu(source)
        end, "Appuyez sur ~INPUT_CONTEXT~ pour vérifier la serrure", 25.0, 1.0)
        self.blip = AzoKiSBlipsManager.createPublic(self.savedInfos.entry, 171, 47, 0.6, "Cambriolage", true)
        self.isActive = true
    end)
end

---handleStart
---@public
---@return void
function Robbery:handleStart(source)
    if not self.isActive then
        TriggerClientEvent("esx:showNotification", source, "~b~Cette propriétée se fait déjà cambrioler")
        return
    end
    AzoKiSRobberiesManager.players[source] = { id = self.id, bag = {} }
    SetPlayerRoutingBucket(source, (15000 + source))
    AzoKiSBlipsManager.delete(self.blip)
    AzoKiSZonesManager.delete(self.entryZone)
    AzoKiServerUtils.toClient("robberiesStart", source)
    AzoKiServerUtils.toClient("playScenario", source, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", AzoKi.second(30), true)
    self.isActive = false
    AzoKi.newWaitingThread(AzoKi.second(30), function()
        self:startCooldown()
        AzoKiServerUtils.toClient("robberiesEnter", source, { outSideRobbery = self.savedInfos.entry, entryRobbery = AzoKiSharedRobberiesInteriors[self.interior].entry, possibleOponents = self.possibleOponents, objects = self.possibleObjects, itemsTable = AzoKiSharedRobberiesItems, special = self.savedInfos.specialTaskOnPed or 0 })
        AzoKiSZonesManager.addAllowed(self.exitZone, source)
        AzoKiSBlipsManager.addAllowed(self.exitBlip, source)
    end)
end

---exitRobbery
---@public
---@return void
function Robbery:exitRobbery(source, failed)
    if not failed then
        local total = 0
        for k, v in pairs(AzoKiSRobberiesManager.players[source].bag) do
            total = total + v.price
        end
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addAccountMoney("cash", total)
        TriggerClientEvent("esx:showNotification", source, ("~p~Bravo ! Vous remportez ~y~%s$~p~ pour votre cambriolage !"):format(total))
        if total > 0 then
            AzoKiServerUtils.webhook(("%s a réussi le cambriolage \"__%s__\" pour __%s__$"):format(GetPlayerName(source), self.name, total), "green", "https://discord.com/api/webhooks/830047199051251722/O-Ru6RMHdxcnt_M5fENbaZ-bJDSm0jWXuYEggR5JLnj8vMS0sudrzVdi1LXNcKA8-_NO")
        else
            AzoKiServerUtils.webhook(("%s a réussi le cambriolage \"__%s__\" sans rien emporter"):format(GetPlayerName(source), self.name), "orange", "https://discord.com/api/webhooks/830047199051251722/O-Ru6RMHdxcnt_M5fENbaZ-bJDSm0jWXuYEggR5JLnj8vMS0sudrzVdi1LXNcKA8-_NO")
        end
    end
    AzoKiSRobberiesManager.players[source] = nil
    SetPlayerRoutingBucket(source, 0)
    AzoKiSZonesManager.removeAllowed(self.exitZone, source)
    AzoKiSBlipsManager.removeAllowed(self.exitBlip, source)
    AzoKiServerUtils.toClient("destroy", source, "robb")
    AzoKiServerUtils.toClient("robberiesExit", source, self.savedInfos.entry)
    if failed then
        AzoKiServerUtils.webhook(("%s est mort dans le cambriolage \"__%s__\""):format(GetPlayerName(source),self.name), "red", "https://discord.com/api/webhooks/830047199051251722/O-Ru6RMHdxcnt_M5fENbaZ-bJDSm0jWXuYEggR5JLnj8vMS0sudrzVdi1LXNcKA8-_NO")
    end
end
