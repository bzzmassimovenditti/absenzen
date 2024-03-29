/* *******************************************************************************************
* Autor: V. Demir, 1/2024
* *******************************************************************************************
* Beschreibung:
* Express-Server, um CRUD-Operationen vom Browser entgegen zunehmen an der DB durchzuführen
* *******************************************************************************************
* Hinweise
* npm install node
* npm init -y
* npm install mysql
* npm install body-parser
* npm install express
** ***************************************************************************************** */
// Referenz: www.npmjs.com/package/mysql

const mysql = require("mysql");
const express = require('express');
var app = express();
const path = require('path');
const bodyParser = require('body-parser');

const port = 3421;

app.use(bodyParser.json());

const config = {
    host: 'localhost',
    database: 'absenzen',
    user: "absenzenApp",
    password: 'bzz123'
}

const connection = mysql.createConnection(config)

connection.connect(function(err) {
    if (err) throw err;
    console.log('Connected to MySQL database:', connection.config.database);
   /*
    var sqlstmt = 'SELECT * from user';
    // Das SQL-Statement wird vorbereitetet
    connection.query(sqlstmt, function (err, result) {
        if (err) throw err;
        // console.log('Data from MySQL:');
        //console.log(result); //
    });
    */
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

app.get('/Lernende', (req, res) => {
    connection.query('SELECT * FROM Lernende', [req.params.id], (err, rows, fields) => {
        if (!err) {
            console.log(rows);
            res.send(rows);
        } else {
            console.log(err);
        }

    })
});
app.get('/Lernende/LernendeID/:LernendeID', (req, res) => {
    connection.query('SELECT * FROM Lernende WHERE LernendeID = 2', [req.params.id], (err, rows, fields) => {
        if (!err) {
            console.log(rows);
            res.send(rows);
        } else {
            console.log(err);
        }

    })
});

app.delete('/Lernende/LernendeID/:LernendeID', (req, res) => {
    connection.query(' DELETE FROM Lernende WHERE LernendeID = ? ', [req.params.id], (err, rows, fields) => {
        if (!err) {
            res.send('Delete operation was successful')
            // res.send(rows)
        } else {
            console.log(err);
        }

    })
});


