ConfigAdmin = {
    --[[
        -1  ->  Tous les groupes (sauf user)
    --]]
    authorizations = {
        ["vehicles"] = {"_dev", "superadmin", "admin", "responsable", "modo", "helper"},
        ["vehicles2"] = {"_dev", "superadmin", "admin", "responsable", "modo", "helper"},
        ["kick"] = {"_dev", "superadmin", "admin", "responsable", "modo", "helper"},
        ["mess"] = {"_dev", "superadmin", "admin", "responsable", "modo", "helper"},
        ["jail"] = {"_dev", "superadmin", "admin", "responsable", "modo", "helper"},
        ["unjail"] = {"_dev", "superadmin", "admin", "responsable", "modo", "helper"},
        ["teleport"] = {"_dev", "superadmin", "admin", "responsable", "modo", "helper"},
        ["revive"] = {"_dev", "superadmin", "admin", "responsable", "modo", "helper"},
        ["heal"] = {"_dev", "superadmin", "admin", "responsable", "modo", "helper"},
        ["tppc"] = {"_dev", "superadmin", "admin", "responsable", "modo", "helper"},
        ["warn"] = {"_dev", "superadmin", "admin", "responsable", "modo", "helper"},
        ["permInventaire"] = {"_dev", "superadmin", "admin", "responsable", "modo", "helper"},
        ----
        ["clearInventory"] = {"_dev", "superadmin", "responsable", "admin"},
        ["clearLoadout"] = {"_dev", "superadmin", "responsable", "admin"},
        ["setGroup"] = {"_dev", "responsable"},
        ["setJob"] = {"_dev", "superadmin", "responsable", "admin"},
        ["give"] = {"_dev", "superadmin", "responsable", "admin"},
        ["giveMoney"] = {"_dev", "superadmin", "responsable", "admin"},
        ["wipe"] = {"_dev", "superadmin", "responsable", "admin"},
        ["clearvéhicules"] = {"_dev", "superadmin", "responsable", "admin"},
        ["ped"] = {"_dev"},
    },

    webhook = {
        onTeleport = "https://discord.com/api/webhooks/952365202576384090/zNThHSl5n_4viuvTunMyP7HhHWX2Yz8crM1mjhRalefvKsQ-zAyL8spbekjDtmC6QLBw",
        onBan = "https://discord.com/api/webhooks/952365202576384090/zNThHSl5n_4viuvTunMyP7HhHWX2Yz8crM1mjhRalefvKsQ-zAyL8spbekjDtmC6QLBw",
        onKick = "https://discord.com/api/webhooks/952365202576384090/zNThHSl5n_4viuvTunMyP7HhHWX2Yz8crM1mjhRalefvKsQ-zAyL8spbekjDtmC6QLBw",
        onMessage = "https://discord.com/api/webhooks/952365202576384090/zNThHSl5n_4viuvTunMyP7HhHWX2Yz8crM1mjhRalefvKsQ-zAyL8spbekjDtmC6QLBw",
        onMoneyGive = "https://discord.com/api/webhooks/952365202576384090/zNThHSl5n_4viuvTunMyP7HhHWX2Yz8crM1mjhRalefvKsQ-zAyL8spbekjDtmC6QLBw",
        onItemGive = "https://discord.com/api/webhooks/952365202576384090/zNThHSl5n_4viuvTunMyP7HhHWX2Yz8crM1mjhRalefvKsQ-zAyL8spbekjDtmC6QLBw",
        onClear = "https://discord.com/api/webhooks/952365202576384090/zNThHSl5n_4viuvTunMyP7HhHWX2Yz8crM1mjhRalefvKsQ-zAyL8spbekjDtmC6QLBw",
        onGroupChange = "https://discord.com/api/webhooks/952365202576384090/zNThHSl5n_4viuvTunMyP7HhHWX2Yz8crM1mjhRalefvKsQ-zAyL8spbekjDtmC6QLBw",
        onRevive = "https://discord.com/api/webhooks/952365202576384090/zNThHSl5n_4viuvTunMyP7HhHWX2Yz8crM1mjhRalefvKsQ-zAyL8spbekjDtmC6QLBw",
        onHeal = "https://discord.com/api/webhooks/952365202576384090/zNThHSl5n_4viuvTunMyP7HhHWX2Yz8crM1mjhRalefvKsQ-zAyL8spbekjDtmC6QLBw",
        onWipe = "https://discord.com/api/webhooks/952365202576384090/zNThHSl5n_4viuvTunMyP7HhHWX2Yz8crM1mjhRalefvKsQ-zAyL8spbekjDtmC6QLBw"
    }
}