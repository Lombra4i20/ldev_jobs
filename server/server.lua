local VORPcore = {}

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

local VORPInv = {}

VORPInv = exports.vorp_inventory:vorp_inventoryApi()

local buttonJobs = {
  [1] = { job = 'medic', grade = 1 },           -- Botão 1: Job "medic", grade 1
  [2] = { job = 'police', grade = 1 },          -- Botão 2: Job "police", grade 1
  [3] = { job = 'miner', grade = 1 },           -- Botão 3: Job "miner", grade 1
  [4] = { job = 'lumberjack', grade = 1 },      -- Botão 4: Job "lumberjack", grade 1
  [5] = { job = 'fisherman', grade = 1 }        -- Botão 5: Job "fisherman", grade 1
}

RegisterNetEvent('ldev_jobs:abrirMenu')
AddEventHandler('ldev_jobs:abrirMenu', function(playerId)
    TriggerClientEvent('ldev_jobs:abrirMenu', source)
end)

-- Aqui você pode usar o ID do jogador (playerId) e o ID do botão (buttonId) que foram passados do client-side
RegisterNetEvent('ldev_jobs:buttonClick')
AddEventHandler('ldev_jobs:buttonClick', function(playerId, buttonId)
    local source = playerId
    local itemName = ""
    local metadata = {}

    if buttonId == 1 then
        itemName = "corn"
        metadata = {} -- Metadados para o item "corn"

        local item = VORPInv.getItem(source, itemName, metadata)

        if item then
            -- Lógica específica para o primeiro emprego
            TriggerEvent('ldev_jobs:setarJob', playerId, buttonId)
            VORPcore.NotifyTip(source, "Parabens, voce tem um novo emprego!", 4000)
        else
            VORPcore.NotifyTip(source, "Voce nao tem uma licenca.", 4000)
        end
    elseif buttonId == 2 then
        itemName = "acid"
        metadata = {} -- Metadados para o item "acid"

        local item = VORPInv.getItem(source, itemName, metadata)

        if item then
            -- Lógica específica para o segundo emprego
            TriggerEvent('ldev_jobs:setarJob', playerId, buttonId)
            VORPcore.NotifyTip(source, "Parabens, voce tem um novo emprego!", 4000)
        else
            VORPcore.NotifyTip(source, "Voce nao tem uma licenca.", 4000)
        end
    elseif buttonId == 3 then
        itemName = "item3"
        metadata = {} -- Metadados para o item "acid"

        local item = VORPInv.getItem(source, itemName, metadata)

        if item then
            -- Lógica específica para o segundo emprego
            TriggerEvent('ldev_jobs:setarJob', playerId, buttonId)
            VORPcore.NotifyTip(source, "Parabens, voce tem um novo emprego!", 4000)
        else
            VORPcore.NotifyTip(source, "Voce nao tem uma licenca.", 4000)
        end
    elseif buttonId == 4 then
        itemName = "item4"
        metadata = {} -- Metadados para o item "acid"

        local item = VORPInv.getItem(source, itemName, metadata)

        if item then
            -- Lógica específica para o segundo emprego
            TriggerEvent('ldev_jobs:setarJob', playerId, buttonId)
            VORPcore.NotifyTip(source, "Parabens, voce tem um novo emprego!", 4000)
        else
            VORPcore.NotifyTip(source, "Voce nao tem uma licenca.", 4000)
        end
    elseif buttonId == 5 then
        itemName = "item5"
        metadata = {} -- Metadados para o item "acid"

        local item = VORPInv.getItem(source, itemName, metadata)

        if item then
            -- Lógica específica para o segundo emprego
            TriggerEvent('ldev_jobs:setarJob', playerId, buttonId)
            VORPcore.NotifyTip(source, "Parabens, voce tem um novo emprego!", 4000)
        else
            VORPcore.NotifyTip(source, "Voce nao tem uma licenca.", 4000)
        end
    -- Adicione condicionais para os outros botões (empregos) aqui
    -- elseif buttonId == 3 then
    --     ...
    -- elseif buttonId == 4 then
    --     ...
    -- elseif buttonId == 5 then
    --     ...
    end
end)




--Evento para pegar o job e setar o job se disponivel

RegisterNetEvent('ldev_jobs:setarJob')
AddEventHandler('ldev_jobs:setarJob', function(playerId, buttonId)
    local _source = playerId -- player source
    local User = VORPcore.getUser(_source)
    local Character = VORPcore.getUser(_source).getUsedCharacter

    local selectedJob = buttonJobs[buttonId]

    if selectedJob then
        local job = selectedJob.job
        local grade = selectedJob.grade

        if Character.job == job then
            
        else
            Character.setJob(job)
            Character.setJobGrade(grade)
        end
    end
end)

RegisterServerEvent('processarJogadoresAtivos')
AddEventHandler('processarJogadoresAtivos', function(players)
    local playerList = {table.unpack(players)}

    for _, playerId in ipairs(playerList) do
        local player = VORPcore.getUser(playerId)

        if player ~= nil then
            local character = player.getUsedCharacter

            if character.job == 'medic' then
                VORPcore.NotifyTip(source, "Voce recebeu seu salario!", 4000)
                character.addCurrency(0, 30)
            elseif character.job == 'police' then
                VORPcore.NotifyTip(source, "Voce recebeu seu salario!", 4000)
                character.addCurrency(0, 30)
            elseif character.job == 'job3' then
                VORPcore.NotifyTip(source, "Voce recebeu seu salario!", 4000)
                character.addCurrency(0, 30)
            elseif character.job == 'job4' then
                VORPcore.NotifyTip(source, "Voce recebeu seu salario!", 4000)
                character.addCurrency(0, 30)
            elseif character.job == 'job5' then
                VORPcore.NotifyTip(source, "Voce recebeu seu salario!", 4000)
                character.addCurrency(0, 30)
            end
        end
    end
end)


