
RegisterServerEvent('saveCharacterData')
AddEventHandler('saveCharacterData', function(data)
    local _source = source
    local nome = data.nome
    local idade = data.idade
    local cabelo = data.cabelo
    local olhos = data.olhos
    local peso = data.peso
    local altura = data.altura

    MySQL.Async.execute('INSERT INTO characters (player_id, nome, idade, cabelo, olhos, peso, altura) VALUES (@playerId, @nome, @idade, @cabelo, @olhos, @peso, @altura)', {
        ['@playerId'] = _source,
        ['@nome'] = nome,
        ['@idade'] = idade,
        ['@cabelo'] = cabelo,
        ['@olhos'] = olhos,
        ['@peso'] = peso,
        ['@altura'] = altura
    })

    TriggerClientEvent('chat:addMessage', _source, {
        args = { 'Sistema', 'Personagem criado com sucesso!' }
    })
end)
