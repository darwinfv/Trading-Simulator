
	module.exports = {
		connect,
		useOnce,
		use,
		register,
		login,
		addValue,
		graph,
		getUser,
		trade,
		latestValue,
		reset,
		clear,
		headlines,
		makeNews
	}

	var mysql = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'tradingsim.cj7tvixlpjsb.us-east-2.rds.amazonaws.com',
	  user     : 'dvaz',
	  password : 'simonanoodles',
	  database : 'tradingsim'
	});

	function connect() {
		connection.connect(function(err) {
			if (err) console.log("Failed to connect");
			else console.log("Connected!");
		});
	}

	function useOnce(sql, callback) {
		connection.connect(function(err) {
			if (err) throw err;
			connection.query(sql, function(err, result) {
				if(err) throw err;
				callback(result);
			});
		});
	}

	function use(sql, callback) {
		connection.query(sql, function(err, result) {
			if(err) throw err;
			// console.log(result);
			callback(result);
		});
	}

	function register(email, password, callback) {
		var sql = "SELECT * FROM Users WHERE email = \"" + email + "\"";
		use(sql, (x) => {
			if(x.length == 1) {
				console.log("Register: Email already exists");
				callback("FAILURE");
			}
			else {
				sql = "INSERT INTO Users(email, pass) VALUES(\"" + email + "\", \"" + password + "\")";
				use(sql, (y) => {
					console.log("Register: Success");
					callback("SUCCESS");
				});
			}
		});
	}

	function login(email, password, callback) {
		var sql = "SELECT * FROM Users WHERE email = \"" + email + "\"";
		use(sql, (x) => {
			if(x.length == 0) {
				console.log("Login: No such user");
				callback("INCORRECT-EMAIL");
			}
			else if(password == x[0].pass) {
				console.log("Login: Success");
				callback("SUCCESS");
			}
			else {
				console.log("Login: Incorrect password");
				callback("INCORRECT-PASSWORD");
			}
		});
	}

	function addValue(currency, value) {
		var sql = "SELECT * FROM " + currency.toUpperCase() + " WHERE NUMBER = (SELECT MAX(NUMBER) FROM " + currency.toUpperCase() + ")";
		use(sql, (x) => {
			var number = x[0].number + 1;
			var percent = (value / x[0].value) * 100 - 100;
			var diff = value - x[0].value;
			sql = "INSERT INTO " + currency.toUpperCase() + "(number, value, diff, percent) VALUES(" + number + ", " + value + ", " + diff + "," + percent + ")";
			use(sql, (y) => { console.log("Add Value: Add success"); });
			if(number > 200) {
				sql = "DELETE FROM " + currency.toUpperCase() + " ORDER BY number LIMIT 1";
				use(sql, (z) => { console.log("Add Value: Delete success"); });
			}
		});
	}

	function graph(currency, callback) {
		var sql = "SELECT value FROM " + currency.toUpperCase();
		use(sql, (x) => {
			console.log("Graph: Success");
			callback(x);
		});
	}

	function getUser(email, callback) {
		var sql = "SELECT * FROM Users WHERE email = \"" + email + "\"";
		use(sql, (x) => {
			var size = Object.keys(x[0]).length;
			Object.keys(x[0]).forEach(function(key) {
				if(x[0].hasOwnProperty(key) && x[0][key] == 0)
					delete x[0][key];
			});
			delete x[0]["email"];
			delete x[0]["pass"];
			console.log("Get User: Success");
			callback(x);
		});
	}

	function trade(email, currency, value) {
		var sql = "UPDATE Users SET " + currency.toLowerCase() + " = " + value + " WHERE email = \"" + email + "\"";
		use(sql, (x) => {
			console.log(x);
		});
	}

	function latestValue(callback) {
		var currency = ["eur", "jpy", "gbp", "aud", "cad", "chf", "cny", "sek", "mxn", "nzd", "sgd", "hkd", "nok", "krw", "try", "inr", "rub", "brl", "zar", "dkk", "pln", "twd", "thb", "myr"];
		var result = {};
		var i = 0;
		currency.forEach(function(key) {
			var sql = "SELECT * FROM " + key.toUpperCase() + " WHERE NUMBER = (SELECT MAX(NUMBER) FROM " + key.toUpperCase() + ")";
			use(sql, (x) => {
				result[key] = x[0];
				i++;
				if(i == 24) {
					console.log("Values: Success");
					callback(result);
				}
			});
		});
	}

	function reset(email, newp) {
		var sql = "UPDATE Users SET pass = \"" + newp + "\" WHERE email = \"" + email + "\"";
		use(sql, (x) => {
			console.log(x);
			console.log("Reset: Success");
		});
	}

	function clear() {
		var currency = ["eur", "jpy", "gbp", "aud", "cad", "chf", "cny", "sek", "mxn", "nzd", "sgd", "hkd", "nok", "krw", "try", "inr", "rub", "brl", "zar", "dkk", "pln", "twd", "thb", "myr"];
		currency.forEach(function(key) {
			var sql = "DELETE FROM " + key.toUpperCase();
			use(sql, (x) => {
				var sql2 = "INSERT INTO " + key.toUpperCase() + "(number, value, diff, percent) VALUES(1, 1, 0, 0)";
				use(sql2, (x) => {});
			});
		});
	}

	function headlines(source, callback) {
		var sql = "SELECT * FROM News WHERE source = \"" + source + "\"";
		use(sql, (x) => {
			callback(x);
		});
	}

	function makeNews(source, headline) {
		var sql = "INSERT INTO News VALUES(\"" + new Date().toLocaleString() + "\", \"" + source + "\", \"" + headline + "\")";
		use(sql, (x) => {
			console.log("Make News: Success");
		});
	}

	function test() {
		connection.connect(function(err) {
			if (err) throw err;
			connection.query("SELECT * FROM Users", function (err, result, fields) {
				if (err) throw err;
				console.log(result);
			});
		});
	}

