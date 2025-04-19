-- Função para atribuir um cargo a um jogador
function assignJob(playerId, jobName)
    local query = 'INSERT INTO jobs (player_id, nome_cargo, tipo_job, data_inicio) VALUES (@playerId, @jobName, @jobType, @dataInicio)'
    MySQL.insert(query, {
        ['@playerId'] = playerId,
        ['@jobName'] = jobName,
        ['@jobType'] = "legal",  -- Aqui você pode definir "legal" ou "ilegal" conforme o cargo
        ['@dataInicio'] = os.date('%Y-%m-%d %H:%M:%S')
    }, function(affectedRows)
        if affectedRows > 0 then
            print("Cargo " .. jobName .. " atribuído com sucesso ao jogador " .. playerId)
        else
            print("Erro ao atribuir cargo para o jogador " .. playerId)
        end
    end)
end
-- Comando para atribuir o cargo de Prefeito
RegisterCommand('setPrefeito', function(source, args, rawCommand)
    local playerId = tonumber(args[1])  -- Obtém o ID do jogador
    if playerId then
        assignJob(playerId, "Prefeito")  -- Atribui o cargo de Prefeito ao jogador
    else
        print("ID do jogador inválido!")
    end
end, true)  -- 'true' indica que apenas administradores podem executar este comando