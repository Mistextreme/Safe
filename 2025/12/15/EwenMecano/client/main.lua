ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(0)
    end
end)

RegisterCommand("mecano", function(source, args, rawCommand)
	exports.fivem_ui:loadApplication("mechanic", {
		color = "#FF0000",
	})
end)

print('DISCORD.GG/MADEINLEAK')
print('BY MADEINLEAK')