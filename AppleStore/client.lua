ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)


RMenu.Add('example', 'main', RageUI.CreateMenu("Ammunation", "~o~~h~Boutique Ammunation"))
RMenu.Add('example', 'tel', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "Téléphone", "~o~~h~Armes Blanches"))
RMenu.Add('example', 'ordi', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "Ordinateur", "~o~~h~Armes Létales"))
RMenu.Add('example', 'divers', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "Objet Divers", "~o~~h~diverssoires d'armes"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('example', 'main'), true, true, true, function()

            RageUI.Button("Téléphone", "Vous pourrez trouver des téléphone a bas prix ici !", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('example', 'tel'))

            RageUI.Button("Ordinateur", "Nos oridnateur d'occasion , il sont un peu bizzare mais font l'affaire !", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('example', 'ordi'))

            RageUI.Button("Objet Divers", "Vous pourrez tout objet divers !", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('example', 'divers'))
        end, function()
        end)

-------------------------------------------------------------------------------
---------------------------- Apple store -------------------------------------
-------------------------------------------------------------------------------

        RageUI.IsVisible(RMenu:Get('example', 'tel'), true, true, true, function()

            RageUI.Button("Iphone", "Top qualité avec la coque fournis", {RightLabel = "~o~550$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('baby_lua:BuyTel')
                      end
                end)

        end, function()
        end)

-------------------------------------------------------------------------------
-------------------------diverssoires-------------------------------------------
-------------------------------------------------------------------------------

               RageUI.IsVisible(RMenu:Get('example', 'divers'), true, true, true, function()

            RageUI.Button("Clé usb", "Une clé usb vierge parfait avec un sotcakge de 32go", {RightLabel = "~o~1000$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('baby_lua:BuyUsb')
                      end
                end)


        end, function()
        end)
-------------------------------------------------------------------------------
-------------------------Armes à feu-------------------------------------------
-------------------------------------------------------------------------------

            RageUI.IsVisible(RMenu:Get('example', 'ordi'), true, true, true, function()

                RageUI.Button("Ordinateur portable", "Un petite ordinateur d'occasion qui prennais la poussière ", {RightLabel = "~o~20 000$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('baby_lua:BuyOrdinateur1')
                    end
                end)
                        
            end, function()

                ---Panels
            end, 1)
    
            Citizen.Wait(0)
        end
    end)



    ---------------------------------------- Position du Menu --------------------------------------------

    local position = {
        {x = 22.07 , y = -1107.16, z = 29.8, },
    }   
    
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 1.0 then

                   RageUI.Text({
                        message = "Appuyez sur [~o~E~w~] pour parler à ~o~Baby",
                        time_display = 1
                    })
                   -- ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour acceder au ~b~Shop")
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('example', 'main'), not RageUI.Visible(RMenu:Get('example', 'main')))
                    end
                end
            end
        end
    end)

    Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_prolhost_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "a_m_m_prolhost_01", 149.05, -234.6, 54.42, 337.61, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)

local blips = {
        {title="Apple store", colour=55, id=619, x = 149.04, y = -234.62, z = 53.42}
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)