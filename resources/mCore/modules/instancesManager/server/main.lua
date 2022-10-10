--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local playerRestrictedBuckets = 5000

AzoKi.netRegisterAndHandle("setBucket", function(bucketID)
    local source = source
    SetPlayerRoutingBucket(source, bucketID)
    AzoKiServerUtils.trace(("Le joueur %s est désormais sur le bucket %s"):format(GetPlayerName(source), bucketID), AzoKiPrefixes.sync)
end)

AzoKi.netRegisterAndHandle("genPlayerBucket", function()
    local source = source
    local bucketID = (playerRestrictedBuckets+source)
    SetPlayerRoutingBucket(source, bucketID)
    AzoKiServerUtils.trace(("Le joueur %s est désormais sur le bucket %s"):format(GetPlayerName(source), bucketID), AzoKiPrefixes.sync)
end)

AzoKi.netRegisterAndHandle("setOnPublicBucket", function()
    local source = source
    SetPlayerRoutingBucket(source, 0)
    AzoKiServerUtils.trace(("Le joueur %s est désormais sur le bucket ^2public"):format(GetPlayerName(source)), AzoKiPrefixes.sync)
end)