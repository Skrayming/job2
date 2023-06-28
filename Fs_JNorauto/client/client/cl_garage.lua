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
local mainMenu6 = RageUI.CreateMenu('', 'Garage')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenMenu6()
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
              
              RageUI.Button("Ranger votre véhicule", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                  local playerPed = PlayerPedId()
      
                  if IsPedSittingInAnyVehicle(playerPed) then
                    local vehicle = GetVehiclePedIsIn(playerPed, false)
            
                    if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                      ESX.ShowNotification('La voiture a été mis dans le garage')
                      ESX.Game.DeleteVehicle(vehicle)
                       
                    else
                      ESX.ShowNotification('Mais toi place conducteur, ou sortez de la voiture.')
                    end
                  else
                    local vehicle = ESX.Game.GetVehicleInDirection()
            
                    if DoesEntityExist(vehicle) then
                      ESX.ShowNotification('La voiture à été placer dans le garage.')
                      ESX.Game.DeleteVehicle(vehicle)
            
                    else
                      ESX.ShowNotification('Aucune voitures autours')
                    end
                  end
              end,})
              
              RageUI.Button("Berlingo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                      local model = GetHashKey("norauto1")
                      RequestModel(model)
                      while not HasModelLoaded(model) do Citizen.Wait(10) end
                      local pos = GetEntityCoords(PlayerPedId())
                      local vehicle = CreateVehicle(model, 1022.8977050781,-2493.5004882813,28.503322601318, 149.9558563232422, true, true)
                      RageUI.CloseAll()
                    end
                })

                RageUI.Button("Chevrolet Silverado", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                      local model = GetHashKey("17silv")
                      RequestModel(model)
                      while not HasModelLoaded(model) do Citizen.Wait(10) end
                      local pos = GetEntityCoords(PlayerPedId())
                      local vehicle = CreateVehicle(model, 1022.8977050781,-2493.5004882813,28.503322601318, 149.9558563232422, true, true)
                      RageUI.CloseAll()
                    end
                })

                RageUI.Button("Chevrolet Silverado 2", nil, {RightLabel = "→"}, true , {
                  onSelected = function()
                    local model = GetHashKey("no1")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, 1022.8977050781,-2493.5004882813,28.503322601318, 149.9558563232422, true, true)
                    RageUI.CloseAll()
                  end
              })

              RageUI.Button("Remorque Silverado 2", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                  local model = GetHashKey("20fttrailer")
                  RequestModel(model)
                  while not HasModelLoaded(model) do Citizen.Wait(10) end
                  local pos = GetEntityCoords(PlayerPedId())
                  local vehicle = CreateVehicle(model, 1022.8977050781,-2493.5004882813,28.503322601318, 149.9558563232422, true, true)
                  RageUI.CloseAll()
                end
            })

                RageUI.Button("Dépanneuse f450s", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                      local model = GetHashKey("f450s")
                      RequestModel(model)
                      while not HasModelLoaded(model) do Citizen.Wait(10) end
                      local pos = GetEntityCoords(PlayerPedId())
                      local vehicle = CreateVehicle(model, -1022.8977050781,-2493.5004882813,28.503322601318, 149.9558563232422, true, true)
                      RageUI.CloseAll()
                    end
                })

                RageUI.Button("Dépanneuse f450", nil, {RightLabel = "→"}, true , {
                  onSelected = function()
                    local model = GetHashKey("no5")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, -1022.8977050781,-2493.5004882813,28.503322601318, 149.9558563232422, true, true)
                    RageUI.CloseAll()
                  end
              })

                RageUI.Button("Dépanneuse f550rbc", nil, {RightLabel = "→"}, true , {
                  onSelected = function()
                    local model = GetHashKey("f550rbc")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, 1022.8977050781,-2493.5004882813,28.503322601318, 149.9558563232422, true, true)
                    RageUI.CloseAll()
                  end
              })

              RageUI.Button("Dépanneuse Renault", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                  local model = GetHashKey("no4")
                  RequestModel(model)
                  while not HasModelLoaded(model) do Citizen.Wait(10) end
                  local pos = GetEntityCoords(PlayerPedId())
                  local vehicle = CreateVehicle(model, 1022.8977050781,-2493.5004882813,28.503322601318, 149.9558563232422, true, true)
                  RageUI.CloseAll()
                end
            })

              RageUI.Button("Ford Transit", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                  local model = GetHashKey("no2")
                  RequestModel(model)
                  while not HasModelLoaded(model) do Citizen.Wait(10) end
                  local pos = GetEntityCoords(PlayerPedId())
                  local vehicle = CreateVehicle(model, 1022.8977050781,-2493.5004882813,28.503322601318, 149.9558563232422, true, true)
                  RageUI.CloseAll()
                end
            })

            RageUI.Button("Mercedes Sprinter", nil, {RightLabel = "→"}, true , {
              onSelected = function()
                local model = GetHashKey("no6")
                RequestModel(model)
                while not HasModelLoaded(model) do Citizen.Wait(10) end
                local pos = GetEntityCoords(PlayerPedId())
                local vehicle = CreateVehicle(model, 1022.8977050781,-2493.5004882813,28.503322601318, 149.9558563232422, true, true)
                RageUI.CloseAll()
              end
          })

            RageUI.Button("Renault Clio", nil, {RightLabel = "→"}, true , {
              onSelected = function()
                local model = GetHashKey("no3")
                RequestModel(model)
                while not HasModelLoaded(model) do Citizen.Wait(10) end
                local pos = GetEntityCoords(PlayerPedId())
                local vehicle = CreateVehicle(model, 1022.8977050781,-2493.5004882813,28.503322601318, 149.9558563232422, true, true)
                RageUI.CloseAll()
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
	{x = 1022.8977050781, y = -2493.5004882813, z = 28.503322601318}
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
            DrawMarker(22, 1022.8977050781,-2493.5004882813,28.503322601318, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 142, 36, 170, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ~p~intéragir", 1) 
                if IsControlJustPressed(1,51) then
                  OpenMenu6()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)

--- BLIPS ---

Citizen.CreateThread(function()

    local blip = AddBlipForCoord(991.0107421875, -2482.6694335938, 28.290494918823)

    SetBlipSprite (blip, 72) -- Model du blip
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 1.00) -- Taille du blip
    SetBlipColour (blip, 4) -- Couleur du blip
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Norauto') -- Nom du blip
    EndTextCommandSetBlipName(blip)
end)
