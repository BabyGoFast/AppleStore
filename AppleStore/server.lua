ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- Armes Blanches --

RegisterNetEvent('baby_lua:tel')
AddEventHandler('baby_lua:tel', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 550
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('tel', 1)
        TriggerClientEvent('esx:showNotification', source, "Vous avez ~g~acheté~w~ un ~r~Téléphone~w~")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

-- Ordinateur

RegisterNetEvent('baby_lua:ordi')
AddEventHandler('baby_lua:ordi', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 20000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('net_cracker', 1)
        TriggerClientEvent('esx:showNotification', source, "Vous avez ~g~acheté~w~ un ~r~Un Ordinateur~w~")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)


RegisterNetEvent('baby_lua:BuyUsb')
AddEventHandler('baby_lua:BuyUsb', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 1000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('usb', 1)
        TriggerClientEvent('esx:showNotification', source, "Vous avez ~g~acheté~w~ une ~r~Un clé Usb~w~")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)