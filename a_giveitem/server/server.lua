
local function isGroupAllowed(group)
    for _, allowedGroup in ipairs(Config.AllowedGroups) do
        if group == allowedGroup then
            return true
        end
    end
    return false
end

RegisterCommand("giveitem", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local targetId = tonumber(args[1])
        local itemName = args[2]
        local itemCount = tonumber(args[3])

        if targetId and itemName and itemCount then
            local targetPlayer = ESX.GetPlayerFromId(targetId)
            if targetPlayer then
                xPlayer.removeInventoryItem(itemName, itemCount)
                targetPlayer.addInventoryItem(itemName, itemCount)

                
                local group = xPlayer.getGroup() or "Player"
                local playerName = xPlayer.getName()
                local targetName = targetPlayer.getName()

                
                if isGroupAllowed(group) then
                   
                    TriggerClientEvent('chat:addMessage', -1, {
                        template = '<div class="chat-message"><span style="color: #FF0000;">[ ! ] ' .. group .. '</span> <span style="color: #FF0000;">' .. playerName .. ' [' .. source .. ']</span> <span style="color: #FF0000;">gave</span> <span style="color: #FF0000;">' .. targetName .. ' [' .. targetId .. ']</span> <span style="color: #FF0000;"> Items: [' .. itemName .. '] Count: ' .. itemCount .. '</span></div>',
                    })
                else
                    
                    lib.notify({
                        id = 'no_permission',
                        title = 'Access Denied',
                        description = 'Your group does not have permission to broadcast this message.',
                        showDuration = false,
                        position = 'top',
                        style = {
                            backgroundColor = '#141517',
                            color = '#C1C2C5',
                            ['.description'] = {
                                color = '#909296'
                            }
                        },
                        icon = 'ban',
                        iconColor = '#C53030'
                    })
                end
            else
                xPlayer.showNotification("Invalid player ID.")
            end
        else
            xPlayer.showNotification("Usage: /giveitem [ID] [item] [count]")
        end
    end
end)



local function isGroupAllowed(group)
    for _, allowedGroup in ipairs(Config.AllowedGroups) do
        if group == allowedGroup then
            return true
        end
    end
    return false
end

RegisterCommand("removeitem", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local targetId = tonumber(args[1])
        local itemName = args[2]
        local itemCount = tonumber(args[3])

        if targetId and itemName and itemCount then
            local targetPlayer = ESX.GetPlayerFromId(targetId)
            if targetPlayer then
                targetPlayer.removeInventoryItem(itemName, itemCount)

                
                local group = xPlayer.getGroup() or "Player"
                local playerName = xPlayer.getName()
                local targetName = targetPlayer.getName()

                
                if isGroupAllowed(group) then
                    
                    TriggerClientEvent('chat:addMessage', -1, {
                        template = '<div class="chat-message"><span style="color: #FF0000;">[ ! ] ' .. group .. '</span> <span style="color: #FF0000;">' .. playerName .. ' [' .. source .. ']</span> <span style="color: #FF0000;">removed</span> <span style="color: #FF0000;">' .. targetName .. ' [' .. targetId .. ']</span> <span style="color: #FF0000;"> Items: [' .. itemName .. '] Count: ' .. itemCount .. '</span></div>',
                    })
                else
                    
                    lib.notify({
                        id = 'no_permission',
                        title = 'Access Denied',
                        description = 'Your group does not have permission to broadcast this message.',
                        showDuration = false,
                        position = 'top',
                        style = {
                            backgroundColor = '#141517',
                            color = '#C1C2C5',
                            ['.description'] = {
                                color = '#909296'
                            }
                        },
                        icon = 'ban',
                        iconColor = '#C53030'
                    })
                end
            else
                xPlayer.showNotification("Invalid player ID.")
            end
        else
            xPlayer.showNotification("Usage: /removeitem [ID] [item] [count]")
        end
    end
end)
