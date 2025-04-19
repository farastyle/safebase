print("SafeBase Server Started")
local MySQL = exports.oxmysql

-- Make sure the MySQL export is available before using it
if not MySQL then
    print("Error: MySQL not initialized")
else
    print("MySQL successfully initialized")
end

-- Example of using MySQL
MySQL.query("SELECT * FROM players", {}, function(result)
    print("Players:", result)
end)
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