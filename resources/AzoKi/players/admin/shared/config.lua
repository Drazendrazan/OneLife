ConfigAdminMenu = {
    --[[
        -1  ->  Tous les groupes (sauf user)
    --]]
    authorizations = {
        ["vehicles"] = -1,
        ["vehicles2"] = -1,
        ["ped"] = -1,
        ["kick"] = -1,
        ["mess"] = -1,
        ["jail"] = -1,
        ["unjail"] = -1,
        ["teleport"] = -1,
        ["revive"] = -1,
        ["heal"] = -1,
        ["tppc"] = -1,
        ["warn"] = -1,
        ["permInventaire"] = {"_dev", "superadmin", "admin", "responsable", "modo", "helper"},
        ["clearInventory"] = {"_dev", "superadmin", "responsable", "admin"},
        ["clearLoadout"] = {"_dev", "superadmin", "responsable", "admin"},
        ["setGroup"] = {"_dev", "responsable"},
        ["setJob"] = {"_dev", "superadmin", "responsable", "admin"},
        ["give"] = {"_dev", "superadmin", "responsable", "superadmin", "admin", "modo"},
        ["giveMoney"] = {"_dev", "responsable"},
        ["wipe"] = {"_dev", "responsable"},
        ["clearvéhicules"] = {"_dev", "responsable"},
    },

    webhook = {
        onTeleport = "https://discord.com/api/webhooks/970524218481573898/pcsGNHkhqRR-hFtzRS3MhhVoyo0Cu_5OQ1Fb2-Z-ZlBrvV747tsnRSBpODBtEab1rg6p",
        onBan = "https://discord.com/api/webhooks/970524218481573898/pcsGNHkhqRR-hFtzRS3MhhVoyo0Cu_5OQ1Fb2-Z-ZlBrvV747tsnRSBpODBtEab1rg6p",
        onKick = "https://discord.com/api/webhooks/970524218481573898/pcsGNHkhqRR-hFtzRS3MhhVoyo0Cu_5OQ1Fb2-Z-ZlBrvV747tsnRSBpODBtEab1rg6p",
        onMessage = "https://discord.com/api/webhooks/970524218481573898/pcsGNHkhqRR-hFtzRS3MhhVoyo0Cu_5OQ1Fb2-Z-ZlBrvV747tsnRSBpODBtEab1rg6p",
        onMoneyGive = "https://discord.com/api/webhooks/970524218481573898/pcsGNHkhqRR-hFtzRS3MhhVoyo0Cu_5OQ1Fb2-Z-ZlBrvV747tsnRSBpODBtEab1rg6p",
        onItemGive = "https://discord.com/api/webhooks/970524218481573898/pcsGNHkhqRR-hFtzRS3MhhVoyo0Cu_5OQ1Fb2-Z-ZlBrvV747tsnRSBpODBtEab1rg6p",
        onClear = "https://discord.com/api/webhooks/970524218481573898/pcsGNHkhqRR-hFtzRS3MhhVoyo0Cu_5OQ1Fb2-Z-ZlBrvV747tsnRSBpODBtEab1rg6p",
        onGroupChange = "https://discord.com/api/webhooks/970524218481573898/pcsGNHkhqRR-hFtzRS3MhhVoyo0Cu_5OQ1Fb2-Z-ZlBrvV747tsnRSBpODBtEab1rg6p",
        onRevive = "https://discord.com/api/webhooks/970524218481573898/pcsGNHkhqRR-hFtzRS3MhhVoyo0Cu_5OQ1Fb2-Z-ZlBrvV747tsnRSBpODBtEab1rg6p",
        onHeal = "https://discord.com/api/webhooks/970524218481573898/pcsGNHkhqRR-hFtzRS3MhhVoyo0Cu_5OQ1Fb2-Z-ZlBrvV747tsnRSBpODBtEab1rg6p",
        onWipe = "https://discord.com/api/webhooks/970524137007226901/iEW67ULe8sJsTBJVj-cD4S_rGpn_L1ReU4ay9hAjN8g0aI6459aC2tJ4BqRKLgMiaUPL"
    }
}