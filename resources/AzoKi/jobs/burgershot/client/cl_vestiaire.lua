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

-- Function --

function Vestiaireburgershot()

  local model = GetEntityModel(GetPlayerPed(-1))

  TriggerEvent('skinchanger:getSkin', function(skin)

      if model == GetHashKey("mp_m_freemode_01") then

          clothesSkin = {

            ['bags_1'] = 0, ['bags_2'] = 0,
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['torso_1'] = 43, ['torso_2'] = 0,
            ['arms'] = 26,
            ['pants_1'] = 130, ['pants_2'] = 0,
            ['shoes_1'] = 96, ['shoes_2'] = 0,

          }

      else

          clothesSkin = {

            ['bags_1'] = 0, ['bags_2'] = 0,
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['torso_1'] = 43, ['torso_2'] = 0,
            ['arms'] = 26,
            ['pants_1'] = 130, ['pants_2'] = 0,
            ['shoes_1'] = 96, ['shoes_2'] = 0,

          }

      end

      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

  end)

end



function vcivil()

ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

TriggerEvent('skinchanger:loadSkin', skin)

end)

end

-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('~b~Vestaire', '~b~Ouverture du casier..')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenVestiaireburgershotron()
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

              RageUI.Separator("↓ ~p~   Vestiaire  ~s~↓")

              RageUI.Button("Mettre sa tenue : ~r~Civile", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                    vcivil()
                    ExecuteCommand("e adjusttie")
                  end
                })	

                RageUI.Button("Mettre sa tenue : ~p~BurgerShot", nil, {RightLabel = "→→"}, true , {
                  onSelected = function()
                    Vestiaireburgershot()
                    ExecuteCommand("e adjust")
                    end
                  })	
            
            end)
          Wait(0)
         end
      end)
   end
end

----OUVRIR LE MENU------------

local position = {
	{x = -1197.63, y = -902.88, z = 14.0}
}

Citizen.CreateThread(function()
    while true do
      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 5.0 then
            wait = 0
            DrawMarker(22, -1197.63, -902.88, 14.0, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 3, 169, 244, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour intéragir", 1) 
                if IsControlJustPressed(1,51) then
                  OpenVestiaireburgershotron()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)


