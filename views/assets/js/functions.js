        //Function Popup para páginas que inserem dados
        function abrirPopupHome() {
            // Abrir uma nova janela com a página EJS
            window.open('/', 'NomeDaJanela', 'width=1000,height=800');
        }

        function abrirPopupLogin() {
            // Abrir uma nova janela com a página EJS
            window.open('login', 'NomeDaJanela', 'width=1000,height=800');
        }

        function abrirPopupCadastro() {
            // Abrir uma nova janela com a página EJS
            window.open('cadastro', 'NomeDaJanela', 'width=1000,height=800');
        }

        function abrirPopupAgendamento() {
            // Abrir uma nova janela com a página EJS
            window.open('agendamento', 'NomeDaJanela', 'width=1000,height=800');
        }

        function abrirPopupMedico() {
            // Abrir uma nova janela com a página EJS
            window.open('medicopage', 'NomeDaJanela', 'width=1000,height=800');
        }

        function abrirPopupGestor() {
            // Abrir uma nova janela com a página EJS
            window.open('gestorpage', 'NomeDaJanela', 'width=1000,height=800');
        }
        
        function abrirPopupRegister() {
            window.open('register', 'NomeDaJanela', 'width=1000,height=800');
        }

        function abrirPopupEsqueceuSenha() {
            window.open('esqueceu_senha.html', 'NomeDaJanela', 'width=1000,height=800');
        }

        function informacaoMedica() {
            const form = document.getElementById('');

        // Variável para rastrear se o formulário já foi clicado
        let formClicado = false;

        // Adiciona um listener de evento para o clique no formulário
        form.addEventListener('click', function() {
            // Verifica se o formulário ainda não foi clicado
            if (!formClicado) {
                // Exibe um alerta apenas no primeiro clique
                Bootsrap.modal('Caso não esteja logado com a conta médica, faça o login para a página ser exibida ');
                // Define a variável para indicar que o formulário já foi clicado
                formClicado = true;
            }
        });
        
        }

        // Obtém o formulário pelo ID--HOME
        const form = document.getElementById('form');

        // Variável para rastrear se o formulário já foi clicado
        let formClicado = false;

        // Adiciona um listener de evento para o clique no formulário
        form.addEventListener('click', function() {
            // Verifica se o formulário ainda não foi clicado
            if (!formClicado) {
                // Exibe um alerta apenas no primeiro clique
                Bootsrap.modal('Mande uma mensagem para nós!                                   Responderemos em até 48 horas via E-mail');
                // Define a variável para indicar que o formulário já foi clicado
                formClicado = true;
            }
        });


        document.getElementById('telefone').addEventListener('blur', formatarCodigoPais);

function formatarCodigoPais() {
    const inputTelefone = document.getElementById('telefone');
    const valorAtual = inputTelefone.value;

    // Verificar se já possui o código do país, se não, adicionar automaticamente
    if (!/^(\+\d{1,4} )/.test(valorAtual)) {
        inputTelefone.value = '+55 ' + valorAtual;
    }
}