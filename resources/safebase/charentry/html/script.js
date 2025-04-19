
document.getElementById('salvar').addEventListener('click', function() {
    const nome = document.getElementById('nome').value;
    const idade = document.getElementById('idade').value;
    const cabelo = document.getElementById('cabelo').value;
    const olhos = document.getElementById('olhos').value;
    const peso = document.getElementById('peso').value;
    const altura = document.getElementById('altura').value;

    if (nome && idade) {
        fetch(`https://${GetParentResourceName()}/salvarPersonagem`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ nome, idade, cabelo, olhos, peso, altura })
        }).then(() => {
            window.close();
        });
    } else {
        alert('Por favor, preencha todos os campos.');
    }
});
