const { Pool } = require("pg");

// Again, this should be read from an environment variable
module.exports = new Pool({
  connectionString: "postgresql://aweston:Austin2001!@localhost:5432/top_users"
});
