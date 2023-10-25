const express = require('express');
const mysql = require('mysql2');
const session = require('express-session');
const bodyParser = require('body-parser');
const app = express();
const path = require('path');


// Configurar a conexão com o banco de dados MySQL
const db = mysql.createConnection({
host: 'localhost',
user: 'phpmyadmin',
password: '0z0x0c0v0b0n0m',
database: 'spmedicalgroupdb',
});

db.connect((err) => {
if (err) {
console.error('Erro ao conectar ao banco de dados:', err);
throw err;
}
console.log('Conexão com o banco de dados MySQL estabelecida.');
});

// Configurar a sessão
app.use(
session({
secret: '0z0x0c0v0b0n0m',
resave: true,
saveUninitialized: true,
})
);
app.use(express.static(__dirname + '/views'));
app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static(__dirname + '/assets'));
app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static(__dirname + '/admin-pages'));
app.use(bodyParser.urlencoded({ extended: true }));

// Configurar EJS como o motor de visualização
app.set('view engine', 'ejs');

// Rota para a página de login
app.get('/', (req, res) => {
res.render('index');
app.use(express.static(__dirname + '/views'));
app.use(express.static(__dirname + '/'));
});

//app.get('/tables', (req, res) => {
  // Consulta para selecionar todos os registros da tabela
  //connection.query('SELECT * FROM consultas', (error, results) => {
  //  if (error) {
   //   console.error('Erro ao executar a consulta:', error);
  //  } else {
   //   res.render('indexadmin', { rows: results });
   // }
 // });
// });

app.get('/login', (req, res) => {
    res.render('login'); // Renders views/login.ejs
  });
// Rota para processar o formulário de login
app.post('/login', (req, res) => {
  const { username, password } = req.body;
  
  const query = 'SELECT * FROM users WHERE username = ? AND password = ?';
  
  db.query(query, [username, password], (err, results) => {
  if (err) throw err;
  
  if (results.length > 0) {
  req.session.loggedin = true;
  req.session.name = username;
  res.redirect('/agendamento');
  } else {
  res.send('Credenciais incorretas. <a href="/">Tente novamente</a>');
  }
  });
  });

// Rota para a página do painel
app.get('/dashboard', (req, res) => {

if (req.session.loggedin) {
res.send(`Bem-vindo, ${req.session.username}!<br><a href="/agendamento">Entrar na sua página</a><br><a href="/logout">Sair</a>`);
res.sendFile(__dirname + 'view/index');
app.use(express.static(__dirname + '/IMAGENS'));
} else {
res.send('Faça login para acessar esta página. <a href="/">Login</a>');
}
});

// Rota para fazer logout
app.get('/logout', (req, res) => {
req.session.destroy(() => {
res.redirect('/');
});
});

app.get('/agendamento', (req, res) => {
  res.render('agendamento');
});

app.get('/indexadmin', (req, res) => {
  res.render('indexadmin');
});

app.post('/agendamento', (req, res) => {
const {username, date, horario, medico, informacoesamais} = req.body;
  
const query = 'INSERT INTO consultas (username, date, horario, medico, informacoesamais) VALUES (?, ?, ?, ?, ?)';
db.query(query, [username, date, horario, medico, informacoesamais], (err, results) => {
  if (err) {
    console.error('Erro ao agendar a consulta', err);
    res.send('Erro ao agendar a consulta <a href="/agendamento"> Voltar para a página de agendamento</a>.');
  } else {
    res.send('Agendamento feito com sucesso <a href="/agendamento"> Voltar para a página de agendamento</a>');
  }
});
});

app.get('/Cadastro', (req, res) => {
    res.render('Cadastro');
  });
  
  app.post('/Cadastro', (req, res) => {
    const {nomecompleto, cpf, datanascimento, sexo, username, password, email} = req.body;
  
    const query = 'INSERT INTO users (nomecompleto, cpf, datanascimento, sexo, username, password, email) VALUES (?, ?, ?, ?, ?, ?, ?)';
    db.query(query, [nomecompleto, cpf, datanascimento, sexo, username, password, email], (err, results) => {
      if (err) {
        console.error('Erro ao inserir usuário:', err);
        res.send('Erro ao cadastrar o usuário.');
      } else {
        res.send('SP-Medical-Group agradece por sua escolha <a href="/login">Volte para página de login</a>');
      }
    });
  });
  
  app.get('/register', (req, res) => {
    res.render('register');
  });
  
  app.post('/register', (req, res) => {
    const {nomecompleto, cpf, datanascimento, sexo, username, password, email, tipo} = req.body;
  
    const query = 'INSERT INTO users (nomecompleto, cpf, datanascimento, sexo, username, password, email, tipo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
    db.query(query, [nomecompleto, cpf, datanascimento, sexo, username, password, email, tipo], (err, results) => {
      if (err) {
        console.error('Erro ao inserir usuário:', err);
        res.send('Erro ao cadastrar o usuário.');
      } else {
        res.send('SP-Medical-Group agradece por sua escolha <a href="/indexadmin">Volte para página de admin</a>');
      }
    });
  });

app.listen(5321, () => {
console.log('Servidor rodando na porta 5321');
});
