AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    local playerIP = GetPlayerEndpoint(source)  -- Obtém o IP do jogador

    -- Verifica se o IP já foi registrado, caso contrário, armazena no banco de dados
    -- (Lógica de banco de dados já implementada em server/database.lua)
    print("Jogador " .. playerName .. " se conectou de " .. playerIP)
end)