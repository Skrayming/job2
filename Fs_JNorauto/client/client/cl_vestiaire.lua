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

-- Tenue mechanic --

function vcivil()

  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
  TriggerEvent('skinchanger:loadSkin', skin)
  
  end)
  
  end


function mechanic()

  local model = GetEntityModel(GetPlayerPed(-1))

  TriggerEvent('skinchanger:getSkin', function(skin)

      if model == GetHashKey("mp_m_freemode_01") then

          clothesSkin = {

            ['bags_1'] = 0, ['bags_2'] = 0,
            ['tshirt_1'] = 15, ['tshirt_2'] = 2,
            ['torso_1'] = 2, ['torso_2'] = 0,
            ['arms'] = 30,
            ['pants_1'] = 22, ['pants_2'] = 0,
            ['shoes_1'] = 12, ['shoes_2'] = 6,
            ['mask_1'] = 0, ['mask_2'] = 0,
            ['bproof_1'] = 0,
            ['chain_1'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,

          }

      else

          clothesSkin = {

            ['bags_1'] = 0, ['bags_2'] = 0,
            ['tshirt_1'] = 15,['tshirt_2'] = 2,
            ['torso_1'] = 65, ['torso_2'] = 2,
            ['arms'] = 36, ['arms_2'] = 0,
            ['pants_1'] = 38, ['pants_2'] = 2,
            ['shoes_1'] = 12, ['shoes_2'] = 6,
            ['mask_1'] = 0, ['mask_2'] = 0,
            ['bproof_1'] = 0,
            ['chain_1'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,

          }

      end

      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

  end)

end

-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('', 'Vestaire')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenVestiaire()
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

              RageUI.Separator("↓ ~y~   Vestiaire  ~s~↓")

              RageUI.Button("Mettre sa tenue : ~b~Civile", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                    vcivil()
                  end
                })	

                RageUI.Button("Mettre sa tenue : ~g~Mecano", nil, {RightLabel = "→→"}, true , {
                  onSelected = function()
                    mechanic()
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
	{x = 1028.3857421875, y = -2542.1279296875, z = 28.29144859314}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'norauto' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 5.0 then
            wait = 0
            DrawMarker(22,1028.3857421875,-2542.1279296875,28.29144859314, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 79, 195, 247, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour intéragir avec les ~b~vestiaire", 1) 
                if IsControlJustPressed(1,51) then
                  OpenVestiaire()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)


