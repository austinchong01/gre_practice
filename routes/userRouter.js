const express = require('express');
const router = express.Router();
const userController = require("../controllers/userController");

router.get("/", (req, res) => {
    console.log("usernames willbe logged here - wip");
    userController.getUsernames(req, res);
});

router.get("/new", (req, res) => {
    userController.createUsernameGet(req, res);
});

router.post("/new", (req, res) => {
    console.log("username to be saved: ", req.body.username);
    userController.createUsernamePost(req, res)
});

module.exports = router;