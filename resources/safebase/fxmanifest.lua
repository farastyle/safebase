fx_version 'cerulean'
game 'gta5'

author 'farastyle'
description 'SafeBase - Framework customizado para FiveM'

-- Dependencies
dependencies {
    'oxmysql',  -- Make sure oxmysql is a dependency here
}

-- Requisitos do recurso
server_script {
    'safebase_core/server/main.lua',         -- Lógica principal do servidor
    'safebase_core/server/database.lua',     -- Arquivo de banco de dados
    'safebase_core/server/jobs.lua',         -- Lógica de cargos
    'safebase_core/server/security.lua',     -- Lógica de segurança (por exemplo, controle de IPs)
    'charentry/server.lua'                   -- Lógica do servidor da criação de personagens
}

client_script {
    'safebase_core/client/main.lua',         -- Lógica do cliente do core (se necessário)
    'charentry/client.lua'                   -- Interface de criação de personagem no cliente
}

-- Dependências de outros recursos
dependencies {
    'oxmysql',  -- Conexão com MySQL
}

files {
    'charentry/html/index.html',    -- Arquivo HTML da criação de personagem
    'charentry/html/style.css',     -- Arquivo CSS para estilizar
    'charentry/html/script.js',     -- Script JS para interação do front-end da criação de personagem
}
