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


//scripts para inserimento de dados
function formatarCPF(input) {
    let cpfLimpo = input.value.replace(/\D/g, "");
    
    if (cpfLimpo.length > 11) {
        cpfLimpo = cpfLimpo.substring(0, 11);
    }

    let cpfFormatado = "";

    if (cpfLimpo.length <= 3) {
        cpfFormatado = cpfLimpo;
    } else if (cpfLimpo.length <= 6) {
        cpfFormatado = cpfLimpo.replace(/(\d{3})(\d{0,3})/, "$1.$2");
    } else if (cpfLimpo.length <= 9) {
        cpfFormatado = cpfLimpo.replace(/(\d{3})(\d{3})(\d{0,3})/, "$1.$2.$3");
    } else {
        cpfFormatado = cpfLimpo.replace(/(\d{3})(\d{3})(\d{3})(\d{0,2})/, "$1.$2.$3-$4");
    }

    input.value = cpfFormatado;

    if (cpfLimpo.length >= 11) {
        input.setCustomValidity(""); // CPF completo, sem erro de validação
    } else {
        input.setCustomValidity("Informe um CPF válido com 11 dígitos"); // Mensagem de erro de validação
    }
}


function validarNomeCompleto(input) {
    const nome = input.value;
    
    // Verificar se o nome contém apenas letras (a-zA-Z) e pelo menos um espaço em branco
    const regex = /^[a-zA-Z]+ [a-zA-Z]+$/;

    if (!regex.test(nome)) {
        // Nome completo inválido
        input.setCustomValidity("Por favor, insira um nome completo válido contendo apenas letras e pelo menos um espaço.");
    } else {
        // Nome completo válido
        input.setCustomValidity("");
    }
}


function validarEmail(input) {
const email = input.value;

// Expressão regular para validar o formato de email
const regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

if (regex.test(email)) {
input.setCustomValidity(""); // Email válido, sem erro de validação
} else {
input.setCustomValidity("Informe um email válido"); // Mensagem de erro de validação
}
}

function validarSenha(input) {
const senha = document.getElementById("senha").value;
const confirmarSenha = document.getElementById("confirmarSenha").value;

if (senha === confirmarSenha) {
    document.getElementById("senha").setCustomValidity(""); // Senhas iguais, sem erro de validação
    document.getElementById("confirmarSenha").setCustomValidity(""); // Senhas iguais, sem erro de validação
} else {
    document.getElementById("senha").setCustomValidity("As senhas não coincidem"); // Mensagem de erro de validação para a senha
    document.getElementById("confirmarSenha").setCustomValidity("As senhas não coincidem"); // Mensagem de erro de validação para a confirmação de senha
}
}


//Função myDateTime

function MyDateTime() {
    // Obter a data atual
    var currentDate = new Date();

    // Extrair horas, minutos e segundos
    var hours = currentDate.getHours();
    var minutes = currentDate.getMinutes();
    var seconds = currentDate.getSeconds();

    // Formatar os valores para ter dois dígitos
    hours = (hours < 10) ? "0" + hours : hours;
    minutes = (minutes < 10) ? "0" + minutes : minutes;
    seconds = (seconds < 10) ? "0" + seconds : seconds;

    // Criar a string de tempo no formato desejado (HH:MM:SS)
    var timeString = hours + ":" + minutes + ":" + seconds;

    // Atualizar o conteúdo do elemento span
    document.getElementById("current-time").innerText = timeString;
}

// Atualizar a hora a cada segundo
setInterval(MyDateTime, 1000);
