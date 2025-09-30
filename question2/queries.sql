
-- get creator/brand/campaign from id
SELECT * FROM creators WHERE id = $1, [id];
SELECT * FROM brands WHERE id = $1, [id];
SELECT * FROM campaigns WHERE id = $1, [id];

-- get all creator_platform instances from a creator_id
SELECT * FROM creator_platform WHERE creator_id = $1, [id];

-- get all creators from a specific platform
SELECT *
  FROM creators
  JOIN creator_platform
  ON creators.id = creator_platform.creator_id
  WHERE creator_platform.platform = 'instagram';

-- get all creator_platform profiles from a creator_id
SELECT *
  FROM creator_platform
  WHERE creator_id = "test"

-- get all creators from a campaign_id
SELECT *
  FROM creators
  JOIN creator_platform
  ON creators.id = creator_platform.creator_id
  JOIN campaign_creators
  ON creator_platform.id = campaign_creators.creator_platform_id
  WHERE campaign_creators.campaign_id = "test"

-- get total campaign revenue from all creators
SELECT SUM(revenue)
  FROM campaign_creators
  WHERE campaign_id = "id"

-- get total campaign revenue from a creator_id
SELECT SUM(revenue)
  FROM campaign_creators
  JOIN creator_platform
  ON campaign_creators.creator_platform_id = creator_platform.id
  WHERE creator_platform.creator_id = "TEST"



-- create new brand
INSERT INTO brands (brand_name, industry)
  VALUES ("nike", "sports");
-- create new creator
INSERT INTO creators (username)
  VALUES ("test");
-- create new creator_platform given creator_id
INSERT INTO creator_platform (creator_id, platform, username, followers, engagement)
  VALUES ("...");
-- create new campaign given brand_id, campaign_name, multiple creator_platform_id
INSERT INTO campaigns (brand_id, campaign_name)
  VALUES (5, 'Summer Launch 2025')
  RETURNING id;

INSERT INTO campaign_creators (campaign_id, creator_platform_id, revenue)
  VALUES 
      (10, 1, 1000.00),
      (10, 3, 1500.00),
      (10, 5, 2000.00);


-- update campaign_creators revenue
UPDATE campaign_creators
  SET revenue = 100
  WHERE creator_platform_id = "test"

-- update creator_platform followers
UPDATE creator_platform
  SET followers = 1000
  WHERE creator_id = "test"


-- delete brand given id
DELETE FROM brands
  WHERE id = 10

-- delete creator given id
DELETE FROM creators
  WHERE id = 10

-- delete campaign
DELETE FROM campaigns
  WHERE id = 10

DELETE FROM platform_creator
  WHERE id = 10
