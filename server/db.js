const sql = require('mssql/msnodesqlv8');

const config = {
  user: 'sa',
  password: '1234$',
  database: 'demo',
  server: 'localhost\\SQLEXPRESS',
}

var conn = new sql.ConnectionPool(config).connect().then(pool => {
  return pool;
});

module.exports = {
  sql, 
  conn,
}
