Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('', 'Interaction')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  FreezeEntityPosition(PlayerPedId(), false)
  open = false
end

function OpenArmuriePolice()
     if open then 
         open = false
         RageUI.Visible(mainMenu6, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu6, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mainMenu6,function() 
              
              RageUI.Separator("↓ ~y~   Déposer ses armes  ~s~↓")

              RageUI.Button("~g~Déposer ses armes", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                  --RemoveAllPedWeapons(PlayerPedId(), true)
                  
                    TriggerServerEvent('sheriff:removeweapons', source)
                    ESX.ShowNotification("Vous avez ~g~déposé ~s~toutes vos ~b~armes ~s~!")
                end,
                })
              

                RageUI.Separator("↓ Récupèrer un équipement ↓")
                if servicesheriff then
                for k,v in pairs(cfg_sheriff.armurie) do
                    RageUI.Button("Équipement ~b~"..v.grade, nil, { RightLabel = "→→" }, ESX.PlayerData.job.grade >= v.minimum_grade, {
                        onSelected = function()
                            --local pPed = GetPlayerPed(-1)
                              --for k,v in pairs(v.weapons) do
                              --  GiveWeaponToPed(pPed, GetHashKey(v), 255, 1, 0)
                              --end
                              TriggerServerEvent('sheriff:addweapon', v.weapons)
                              ESX.ShowNotification("Armes de service récupéré.")
                        end,
                    })
                end
              else
                RageUI.Separator("~b~Vous n\'êtes pas en service")
              end

                end)
                Wait(0)
               end
            end)
         end
      end
      

----OUVRIR LE MENU------------

local position = {
	  {x = 367.11, y = -1606.96, z = 29.29}
  --{x = -449.75, y = 6010.76, z = 31.72}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sheriff' then 
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 5.0 then
            wait = 0
            DrawMarker(22, 479.0859, -996.757,  30.69, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 40, 53, 147, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyez sur ~b~[E] ~s~pour parler a l'armurier ~s~!", 1) 
                if IsControlJustPressed(1,51) then
                  FreezeEntityPosition(PlayerPedId(), true)
                    OpenArmuriePolice()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)

