local VORPcore = {}

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

local VORPutils = {}

TriggerEvent("getUtils", function(utils)
    VORPutils = utils
end)


--Evento para abrir o Menu
RegisterNetEvent('ldev_jobs:abrirMenu')
AddEventHandler('ldev_jobs:abrirMenu', function()
    SendNUIMessage({
        type = 'open'
    })
    SetNuiFocus(true, true)
end)

--Comando caso aja bug fechar o menu
RegisterCommand('fecharmenu', function()
    SendNUIMessage({
        type = 'close'
    })
    SetNuiFocus(false, false)
end)

--Evento de alteração da NUI
RegisterNUICallback('update', function(args, cb)
    print('status', args.status)
    
    if args.status == false then
        SetNuiFocus(false, false)
    end

    cb('ok')
end)

--Update da mensagem da NUI
RegisterNUICallback('updatemessage', function(args, cb)
    print('Message', args.message)
    cb('ok')
end)



--Evento de Click da NUI
RegisterNUICallback('buttonClick', function(data, cb)
  
  
  local source = PlayerPedId()
  local buttonId = tonumber(data.buttonId)
  local playerId = source -- Obter o ID do jogador

  if buttonId == 1 then
    TriggerServerEvent('ldev_jobs:buttonClick', GetPlayerServerId(PlayerId()), buttonId)
  elseif buttonId == 2 then
    TriggerServerEvent('ldev_jobs:buttonClick', GetPlayerServerId(PlayerId()), buttonId)
  elseif buttonId == 3 then
    TriggerServerEvent('ldev_jobs:buttonClick', GetPlayerServerId(PlayerId()), buttonId)
  elseif buttonId == 4 then
    TriggerServerEvent('ldev_jobs:buttonClick', GetPlayerServerId(PlayerId()), buttonId)
  elseif buttonId == 5 then
    TriggerServerEvent('ldev_jobs:buttonClick', GetPlayerServerId(PlayerId()), buttonId)
  end

  cb('ok')
end)

--------------------------------CODIGO---------------------------------

Citizen.CreateThread(function()
    local PromptGroup = VORPutils.Prompts:SetupPromptGroup()
    local firstprompt = PromptGroup:RegisterPrompt("Acessar", 0x4CC0E2FE, 1, 1, true, 'hold', {timedeventhash = "MEDIUM_TIMED_EVENT"})


    
    local blipName = 'Trabalhos' -- Nome do blip (pode ser qualquer string)
    local blipSprite = 'blip_mp_game_treasure_hunt' -- Nome do sprite do blip
    local blipScale = 0.2 -- Escala do blip

    local blipCoords = { -183.75, 630.27, 114.09 } -- Coordenadas do blip
    local referenceCoords = {
        vector3(-183.75, 630.27, 114.09),
    }
    local maxDistance = 1.5
    local blip = VORPutils.Blips:SetBlip(blipName, blipSprite, blipScale, blipCoords[1], blipCoords[2], blipCoords[3])


    while true do
        Citizen.Wait(0)

        local playerCoords = GetEntityCoords(PlayerPedId())
        local nearReferenceCoord = false

        for _, coord in ipairs(referenceCoords) do
            local distance = #(playerCoords - coord)
            if distance <= maxDistance then
                nearReferenceCoord = true
                break
            end
        end

        if nearReferenceCoord then
            PromptGroup:ShowGroup("Bancada de trabalhos")
            if firstprompt:HasCompleted() then
                TriggerServerEvent('ldev_jobs:abrirMenu', GetPlayerServerId(PlayerId()))
            end
        else
        end
    end
end)

RegisterNetEvent('enviarJogadoresAtivos')
AddEventHandler('enviarJogadoresAtivos', function(players)
    TriggerServerEvent('processarJogadoresAtivos', players)
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(30 * 60000)
        local players = {}

        for _, player in ipairs(GetActivePlayers()) do
            table.insert(players, GetPlayerServerId(player))
        end
        TriggerEvent('enviarJogadoresAtivos', players)
        end

end)