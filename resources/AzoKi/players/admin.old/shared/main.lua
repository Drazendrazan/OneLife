function canUse(permission, playerRank)
    if playerRank == "user" then
        return false
    end
    if type(ConfigAdmin.authorizations[permission]) ~= "table" then
        return true
    end
    for k,rank in pairs(ConfigAdmin.authorizations[permission]) do
        if rank == playerRank then
            return true
        end
    end
    return false
end