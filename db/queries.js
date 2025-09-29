const pool = require("./pool");

async function getAllUsernames() {
  const { rows } = await pool.query("SELECT * FROM usernames");
  return rows;
}

async function insertUsername(username) {
  await pool.query("INSERT INTO usernames (username) VALUES ($1)", [username]);
}

async function deleteUsername(username) {
  await pool.query("DELETE FROM usernames WHERE id = $1", [username]);
}

async function searchUsername(username) {
  const result = await pool.query("SELECT * FROM usernames WHERE id = $1", [
    username,
  ]);
  const user = result.rows[0]; // Get the first matching record
}

module.exports = {
  getAllUsernames,
  insertUsername,
  deleteUsername,
  searchUsername,
};
