const express = require('express');
const router = express.Router();

// get a specific creator
router.get("/creator:id", () => {
    try {
        const { id } = req.params;

        const query = `
        SELECT
            c.id,
            c.username,
            c.display_name,
            c.follower_count,
            u.email,
            u.user_type
        FROM creators
        INNER JOIN users ON creators.user_id = users.id
        WHERE creators.id = $1`;

        const result = await db.query(query, [id]);
        const foundCreator = result.rows[0];


    } catch (error) {
        console.error("Error fetching creator:", error)
    }
});

// get creators based on filters ***

// get all collaborations requests of a creator/brand

// get a collaboration for a specific creator from a brand

// get earnings for a collaborator

// post collaboration request

// put collaboration request from creator/brands