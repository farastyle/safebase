local MySQL = exports.oxmysql

-- Função para criar personagem no banco de dados
function createCharacter(playerId, characterName)
    local query = 'INSERT INTO characters (player_id, nome_personagem) VALUES (@playerId, @characterName)'
    MySQL.insert(query, {
        ['@playerId'] = playerId,
        ['@characterName'] = characterName
    })
end

-- Função para verificar se o jogador já tem um personagem
function characterExists(playerId, callback)
    local query = 'SELECT id FROM characters WHERE player_id = @playerId LIMIT 1'
    MySQL.query(query, {['@playerId'] = playerId}, function(result)
        callback(result[1] ~= nil)  -- Retorna true se o personagem existir
    end)
end

-- Função para obter dados do personagem
function getCharacter(playerId, callback)
    local query = 'SELECT * FROM characters WHERE player_id = @playerId LIMIT 1'
    MySQL.query(query, {['@playerId'] = playerId}, function(result)
        callback(result[1])  -- Retorna os dados do personagem
    end)
end

-- Função para criar personagem no banco de dados com mais informações (data de nascimento, gênero)
function createCharacter(playerId, characterName, characterData)
    local query = 'INSERT INTO characters (player_id, nome_personagem, data_nascimento, genero, data_criacao) VALUES (@playerId, @characterName, @dataNascimento, @genero, @dataCriacao)'
    MySQL.insert(query, {
        ['@playerId'] = playerId,
        ['@characterName'] = characterName,
        ['@dataNascimento'] = characterData.birthDate,
        ['@genero'] = characterData.gender,
        ['@dataCriacao'] = os.date('%Y-%m-%d %H:%M:%S')
    }, function(affectedRows)
        if affectedRows > 0 then
            print("Personagem criado com sucesso para o jogador " .. playerId)
        else
            print("Erro ao criar personagem para o jogador " .. playerId)
        end
    end)
end