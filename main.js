var http = require('http');
const express = require('express');
const fs = require('fs');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql');
const moment = require('moment');
const md5 = require('md5');

var port = 9000;
var app = express();

app.use(bodyParser.json());
app.use(cors());
app.use(express.static(__dirname + '/main'));

app.use((req, res, next) => {
   var now = new Date().toString();
   console.log(req.method, req.url);
   var log = now + ' ' + req.method + ' ' + req.url;
   fs.appendFile('server.log', log+'\n', (err) => {
   	console.log('unable to write to file!');
   });
   next();
});

app.get('/room_types', (req, res) => {
  var qry = 'SELECT id, room_name, room_price, room_description FROM roomtype WHERE isActive = 1';
  var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: 'hotelmaster'
  });

  con.connect(function(err) {
    if (err) res.json(err);
    console.log("Connected!");
    con.query(qry, function (err, result) {
      if (err) res.json(err);
      //console.log(result);
      res.json(result);
      con.end();
    });
  });

});

app.post('/email_check', (req, res) => {
  var body = req.body;
  if (typeof body['email'] !== 'undefined' && body['email'] !== '') {
    var qry = `SELECT id FROM userinfo WHERE email = '${body['email']}'`;
    var con = mysql.createConnection({
      host: "localhost",
      user: "root",
      password: "",
      database: 'hotelmaster'
    });

    con.connect(function(err) {
      if (err) res.json(err);
      //console.log("Connected!");
      con.query(qry, function (err, result) {
        if (err) res.status(500).json(err);
        res.json(result);
        con.end();
      });
    });
  }
  else {
    var err = {
      status: 'error',
      errorMsg: 'Email is required!'
    };
    res.status(400).json(err);
  }

});

app.post('/save_booking', (req, res) => {
  var body = req.body;
  var qry = `INSERT INTO reservations(user_id,checkin_date,checkout_date,room_category_id,status,created_at,updated_at) VALUES(${body['user_id']}, '${body['start_date']}', '${body['end_date']}', '${body['room_id']}','Booked', NOW(), NOW())`;
  var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: 'hotelmaster'
  });

  con.connect(function(err) {
    if (err) res.json(err);
    //console.log("Connected!");
    con.query(qry, function (err, result) {
      if (err) res.status(500).json(err);
      res.json(result);
      con.end();
    });
  });

});

app.post('/save_user', (req, res) => {
  var body = req.body;
  var qry = `INSERT INTO userinfo(email,password,isActive,created_at,updated_at) VALUES('${body['email']}', md5(${body['password']}), '1', NOW(), NOW());`;
  var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: 'hotelmaster'
  });

  con.connect(function(err) {
    if (err) res.json(err);
    //console.log("Connected!");
    con.query(qry, function (err, result) {
      if (err) res.status(500).json(err);
      con.query("SELECT LAST_INSERT_ID() as 'user_id';", function (idErr, idResult) {
        if (idErr) res.status(500).json(idErr);
        res.json(result);
        con.end();
      });
    });
  });

});

app.post('/login', (req, res) => {
  var body = req.body;
  if (typeof body['username'] !== 'undefined' && body['username'] !== '' &&
      typeof body['password'] !== 'undefined' && body['password'] !== '') {
    var qry = `SELECT id FROM userinfo WHERE email = '${body['username']}' AND password = '${md5(body['password'])}'`;
    var con = mysql.createConnection({
      host: "localhost",
      user: "root",
      password: "",
      database: 'hotelmaster'
    });

    con.connect(function(err) {
      if (err) res.json(err);
      console.log("Connected!");
      con.query(qry, function (err, result) {
        if (err) res.json(err);
        //console.log(result);
        if (result.length === 0) {
          var err = {
            status: 'error',
            errorMsg: 'Username and password are Invalid!'
          };
          res.status(401).json(err);
        } else {
          res.json(result);
        }
        con.end();
      });
    });
  }
  else {
    var err = {
      status: 'error',
      errorMsg: 'Username and password are required!'
    };
    res.status(400).json(err);
  }

});

app.get('/user_bookings', (req, res) => {
  if (req.query.userid != null && !isNaN(req.query.userid)) {
    var uId = req.query.userid;
    var qry = `SELECT rt.room_name, rt.room_description, rt.room_price,rc.room_number,rv.checkin_date,
    rv.checkout_date,rv.status FROM reservations rv LEFT JOIN roomcategories rc ON rc.id = rv.room_category_id
    LEFT JOIN roomtype rt ON rt.id = rc.room_id WHERE rv.user_id = ${uId}`;
    var con = mysql.createConnection({
      host: "localhost",
      user: "root",
      password: "",
      database: 'hotelmaster'
    });

    con.connect(function(err) {
      if (err) res.json(err);
      console.log("Connected!");
      con.query(qry, function (err, result) {
        if (err) res.status(500).json(err);
        //console.log(result);
        res.json(result);
        con.end();
      });
    });
  } else {
    var err = {
      status: 'error',
      errorMsg: 'Please Provide the Valid User ID!'
    };
    res.status(400).json(err);
  }

});

app.post('/room_availability', (req, res) => {
  console.log(req.body);
  var body = req.body;
  var sDate = moment(body['start_date'], 'YYYY-MM-DD');
  var eDate = moment(body['end_date'], 'YYYY-MM-DD');
  var roomType = body['room_type'] ? 'rt.id = '+body['room_type']+' AND ' : '';
  if (sDate.isValid() && eDate.isValid()) {
    if (sDate.isSameOrAfter(eDate)) {
      var err = {
        status: 'error',
        errorMsg: 'Start date can not be same or greater than End date'
      };
      res.status(400).json(err);
    } else {
      var today = moment();
      var dur = moment.duration(eDate.diff(today));
      var months = Math.round(dur.as('months'));
      if (months > 6) {
        var err = {
          status: 'error',
          errorMsg: 'Date Range Should be within 6 months!'
        };
        res.status(400).json(err);
      } else {
        var bookingQry = `SELECT rt.room_name, rt.room_description, rc.room_number, rc.id FROM roomtype rt LEFT JOIN
        roomcategories rc ON rc.room_id = rt.id WHERE ${roomType}rc.id NOT IN
        ( SELECT room_category_id from reservations WHERE checkin_date <= '${eDate.format('YYYY-MM-DD')}' AND
        checkout_date >= '${sDate.format('YYYY-MM-DD')}' )`;

        var con = mysql.createConnection({
          host: "localhost",
          user: "root",
          password: "",
          database: 'hotelmaster'
        });

        con.connect(function(err) {
          if (err) res.json(err);
          console.log("Connected!");
          con.query(bookingQry, function (err, result) {
            if (err) res.json(err);
            //console.log(result);
            res.json(result);
            con.end();
          });
        });
      }

    }
  } else {
    var err = {
      status: 'error',
      errorMsg: 'Start and End date should have valid format (YYYY-MM-DD)'
    };
    res.status(400).json(err);
  }
});

app.get('/', (req, res) => {
  res.send('Nothing Here!');
});

app.get('/');
app.listen(port);

console.log('Listening on port', port);
