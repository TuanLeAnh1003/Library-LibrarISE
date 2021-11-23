const sql = require('mssql/msnodesqlv8');

const config = {
  user: 'sa',
<<<<<<< HEAD
  password: '123456',
  database: 'QLTV',
  server: 'localhost\\TUANLESERVER',
=======
  password: '1234$',
  database: 'QLTV',
  server: 'localhost\\SQLEXPRESS',
>>>>>>> HungPho
}

var conn = new sql.ConnectionPool(config).connect().then(pool => {
  return pool;
});

module.exports = {
  sql, 
  conn,
}

