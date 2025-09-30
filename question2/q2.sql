-- q2

CREATE TABLE brands (
    id SERIAL PRIMARY KEY,
    brand_name VARCHAR(100),
    industry VARCHAR(100)
);

CREATE TABLE creators (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100),
);

CREATE TABLE creator_platform (
    id SERIAL PRIMARY KEY,
    creator_id INTEGER REFERENCES creators(id) ON DELETE CASCADE,
    platform VARCHAR(50),
    username VARCHAR(100),
    followers INTEGER DEFAULT 0,
    engagement DECIMAL(3, 2) DEFAULT 0,
    UNIQUE(creator_id, platform) -- one account per platform?
);

CREATE TABLE campaigns (
    id SERIAL PRIMARY KEY,
    brand_id INTEGER REFERENCES brands(id) ON DELETE CASCADE,
    campaign_name VARCHAR(50)
);

CREATE TABLE campaign_creators (
    id SERIAL PRIMARY KEY,
    INTEGER REFERENCES campaigns(id) on DELETE CASCADE,
    creator_platform_id INTEGER REFERENCES creator_platform(id) ON DELETE CASCADE,
    revenue DECIMAL (10,2),
    UNIQUE(campaign_id, creator_platform_id) -- one creator platform per campaign?
);