fx_version 'cerulean'
game 'gta5'

author 'farastyle'
description 'SafeBase - Framework customizado para FiveM'

-- Requisitos do recurso
server_script {
    'server/server.lua',
    'server/main.lua',
    'server/database.lua',  -- Arquivo do banco de dados
    'server/jobs.lua',
    'server/security.lua',
}

client_script 'client/main.lua'

-- Dependências de outros recursos
dependencies {
    'oxmysql',  -- Conexão com MySQL
}