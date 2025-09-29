/*

GET
    brand
    creator
        platform_creator_id's
    creators of a specific platform
    campaign
        creators
        sales
        engagement
    platform_creator performance of campaign
    

POST
    brand
    creator
    campaign
    platform_creator
    platform_creator performance

PUT
    brand performance
    platform_creator performance

DELETE
    brand
    creator
    campaign
        platform_creator performance
    platform_creator

*/

const express = require("express");
const 