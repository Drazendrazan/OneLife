--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

AzoKi.netRegisterAndHandle("depositHouse", function(houseId, itemName, depositCount)
    if not AzoKiSHousesManager.list[houseId] then
        return
    end
    local source = source
    local license = AzoKiServerUtils.getLicense(source)
    ---@type House
    local house = AzoKiSHousesManager.list[houseId]
    if not house:isOwner(source) then
        return
    end
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemCount = xPlayer.getInventoryItem(itemName).count
    if itemCount < depositCount then
        AzoKiServerUtils.toClient("houseDepositFailed", source, "Erreur: Une erreur est survenue")
        return
    end
    local itemsAddedInHouse = house:addItem(itemName, depositCount, source)
    if not itemsAddedInHouse then
        AzoKiServerUtils.toClient("houseDepositFailed", source, "Erreur: Capacité maximale dépassée")
        return
    end
    xPlayer.removeInventoryItem(itemName, depositCount)
    itemCount = xPlayer.getInventoryItem(itemName).count
    AzoKiServerUtils.toClient("houseDepositSucceed", source, itemName, itemCount, depositCount)
end)

AzoKi.netRegisterAndHandle("removeFromHouse", function(houseId, itemName, removalCount)
    if not AzoKiSHousesManager.list[houseId] then
        return
    end
    local source = source
    local license = AzoKiServerUtils.getLicense(source)
    ---@type House
    local house = AzoKiSHousesManager.list[houseId]
    if not house:isOwner(source) then
        AzoKiServerUtils.toClient("houseDepositFailed", source, "Erreur: Une erreur est survenue")
        return
    end
    local xPlayer = ESX.GetPlayerFromId(source)
    if house.inventory[itemName] == nil then
        return
    end
    local avaibleCount = house.inventory[itemName]
    if removalCount > avaibleCount then
        AzoKiServerUtils.toClient("houseDepositFailed", source, "Erreur: Une erreur est survenue")
        return
    end
    house:removeItem(itemName, removalCount, source)
    xPlayer.addInventoryItem(itemName, removalCount)
    itemCount = xPlayer.getInventoryItem(itemName).count
    AzoKiServerUtils.toClient("houseRemovalSucceed", source, itemName, itemCount, removalCount)
end)