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

app.post('/index', (req, res) => {
  const {nomecompleto, email, assunto, mensagem, telefone} = req.body;
  const query = 'INSERT INTO mensagens (nomecompleto, email, assunto, mensagem, telefone) VALUES (?, ?, ?, ?, ?)';
  db.query(query, [nomecompleto, email, assunto, mensagem, telefone], (err, results) => {
    if (err) {
      console.error('Erro ao mandar mensagem', err);
      res.send('Erro ao mandar mensagem <a href="/"> Voltar para a página principal</a>.');
    } else {
      res.send('Sucesso ao mandar mensagem <a href="/"> Voltar para a página principal</a>');
    }
  });
  });

app.get('/login', (req, res) => {
    res.render('login'); // Renders views/login.ejs
  });
// Rota para processar o formulário de login
app.post('/login', (req, res) => {
  const { username, password } = req.body;
 
  const query = 'SELECT * FROM users WHERE username = ? AND password = SHA1(?) ';
  
  db.query(query, [username, password], (err, results) => {
    if (err) throw err;
  
    if (results.length > 0) {
      // Autenticação bem-sucedida
      req.session.loggedin = true;
      req.session.name = username;

      // Verifique o tipo de usuário
      const tipoUsuario = results[0].tipo;
      
      if (tipoUsuario === 'user') {
           console.log("Usuario Logado");
        res.send('Voce foi logado com sucesso!<a href="/agendamento"> Entre na sua página</a>')
        req.session.loggedin = true;
        req.session.name = username;
      } else if (tipoUsuario === 'Medico') {
       console.log("Usuario Logado");
       res.send('Voce foi logado com sucesso!<a href="/medicopage"> Entre na sua página</a>')
       req.session.loggedin = true;
       req.session.name = username;
      } else if (tipoUsuario === 'Gestor') {
        console.log("Usuario Logado");
        res.send('Voce foi logado com sucesso!<a href="/gestorpage"> Entre na sua página</a>')
        req.session.loggedin = true;
        req.session.name = username;
      } else if (tipoUsuario === 'Administrador') {
console.log("Usuario Logado");
        res.send('Voce foi logado com sucesso!<a href="/indexadmin"> Entre na sua página</a>')
        req.session.loggedin = true;
        req.session.name = username;
      } else {
        // Tratamento para outros tipos de usuário ou tipo desconhecido
        res.send('Tipo de usuário desconhecido. <a href="/">Tente novamente</a>');
      }
    } else {
      // Credenciais incorretas
      res.send('Credenciais incorretas. <a href="/">Tente novamente</a>');
    }
  });
});


// Rota para fazer logout
app.get('/logout', (req, res) => {
req.session.destroy(() => {
res.redirect('/');
});
});

app.get('/agendamento', (req, res) => {
  if (req.session.loggedin && req.session.name) {
  res.render('agendamento');

} else {
  // Se não estiver autenticado, redireciona para a página de login
  res.send('<a algin-items="center" href="/login" color="red">É necessário fazer o login</a>');
}
});

app.get('/gestorpage', (req, res) => {
  if (req.session.loggedin && req.session.name) {
  db.query('SELECT * FROM mensagens', (err, result) => {
    if (err) throw err;
    res.render('gestorpage', { mensagens: result });
  });
} else {
  // Se não estiver autenticado, redireciona para a página de login
  res.send('<a algin-items="center" href="/login" color="red">É necessário fazer o login</a>');
}
});

app.get('/medicopage', (req, res) => {
  if (req.session.loggedin && req.session.name) {
  db.query('SELECT * FROM consultas', (err, result) => {
    if (err) throw err;
    res.render('medicopage', { consultas: result });
  });
} else {
  // Se não estiver autenticado, redireciona para a página de login
  res.send('<a algin-items="center" href="/login" color="red">É necessário fazer o login</a>');
}
});

app.get('/indexadmin', (req, res) => {
  // Verifica se o usuário está autenticado
  if (req.session.loggedin && req.session.name) {
    // Se estiver autenticado, consulta os usuários e renderiza a página
    db.query('SELECT * FROM users', (err, result) => {
      if (err) throw err;
      res.render('indexadmin', { users: result });
    });
  } else {
    // Se não estiver autenticado, redireciona para a página de login
    res.send('<a algin-items="center" href="/login" color="red">É necessário fazer o login</a>');
  }
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
    const {username, cpf, datanascimento, sexo, password, email} = req.body;
  
    const query = 'INSERT INTO users (username, cpf, datanascimento, sexo, password, email, tipo) VALUES (?, ?, ?, ?, SHA1(?), ?, "user")';
    db.query(query, [username, cpf, datanascimento, sexo, password, email], (err, results) => {
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
    const {username, cpf, datanascimento, sexo, password, email, tipo} = req.body;
  
    const query = 'INSERT INTO users (username, cpf, datanascimento, sexo, password, email, tipo) VALUES (?, ?, ?, ?, SHA1(?), ?, ?)';
    db.query(query, [username, cpf, datanascimento, sexo, password, email, tipo], (err, results) => {
      if (err) {
        console.error('Erro ao inserir usuário:', err);
        res.send('Erro ao cadastrar o usuário.');
      } else {
        res.send('SP-Medical-Group agradece por sua escolha <a href="/indexadmin">Volte para página de admin</a>');
      }
    });
  });

  app.get('/estaticas', (req, res) => {
      res.render('estaticas');
    });


app.listen(5321, () => {
console.log('Servidor rodando na porta 5321');
});