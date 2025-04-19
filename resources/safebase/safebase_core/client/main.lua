-- Eventos de conexão do jogador
AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    deferrals.defer()

    -- Você pode usar isso para verificar se o jogador já tem um personagem, se necessário
    local playerId = source  -- Obtém o ID do jogador
    print(playerName .. " está tentando se conectar!")

    -- Verifica se o jogador já tem um personagem
    MySQL.query('SELECT * FROM characters WHERE player_id = @playerId', {
        ['@playerId'] = playerId
    }, function(result)
        if #result == 0 then
            -- O jogador não tem um personagem, então podemos redirecioná-lo para a criação de personagem
            TriggerClientEvent('safeBase:startCharacterCreation', playerId)
            print("Jogador " .. playerName .. " será redirecionado para a criação de personagem.")
        else
            -- O jogador já tem um personagem, continua no servidor
            print("Jogador " .. playerName .. " tem um personagem e pode continuar jogando.")
        end
        deferrals.done()
    end)
end)
