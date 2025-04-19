print("SafeBase Server Started")

-- Função para registrar eventos de conexão de jogadores
AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    deferrals.defer()
    print(playerName .. " está se conectando!")

    local playerId = source  -- Obtém o ID do jogador

    -- Verifica se o jogador já tem um personagem
    MySQL.query('SELECT * FROM characters WHERE player_id = @playerId', {
        ['@playerId'] = playerId
    }, function(result)
        if #result == 0 then
            -- O jogador não tem um personagem, então redireciona para a criação de personagem
            TriggerClientEvent('safeBase:startCharacterCreation', playerId)
            print("Jogador " .. playerName .. " será redirecionado para a criação de personagem.")
        else
            -- O jogador já tem um personagem, continua jogando
            print("Jogador " .. playerName .. " tem um personagem.")
        end
        deferrals.done()  -- Conclui o processo de conexão
    end)
end)