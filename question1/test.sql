-- Creator Outreach Platform Database Schema
-- ============================================

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    user_type VARCHAR(20) NOT NULL CHECK (user_type IN ('creator', 'brand')),
);

CREATE TABLE creators (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    username VARCHAR(100) UNIQUE NOT NULL,
    display_name VARCHAR(255) NOT NULL,
    follower_count INTEGER DEFAULT 0,
    engagement_rate DECIMAL(5,4), -- 0.0850 = 8.5%
    
    categories TEXT[], -- Array of niches: ['fitness', 'lifestyle']
    
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE brands (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    company_name VARCHAR(255) NOT NULL,
    industry VARCHAR(100),

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Collaboration requests/offers
CREATE TABLE collaborations (
    id SERIAL PRIMARY KEY,
    brand_id INTEGER REFERENCES brands(id) ON DELETE CASCADE,
    creator_id INTEGER REFERENCES creators(id) ON DELETE CASCADE,
    
    -- Request details
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    collaboration_type VARCHAR(50) NOT NULL, -- 'post', 'story', 'video', 'package'
    offered_amount DECIMAL(10,2) NOT NULL,
    deadline DATE,
    
    -- Request status
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'accepted', 'declined', 'cancelled')),
    creator_response TEXT,
    
    -- Timestamps
    sent_at TIMESTAMP DEFAULT NOW(),
    responded_at TIMESTAMP,
    completed_at TIMESTAMP,
    
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Creator earnings tracking
CREATE TABLE earnings (
    id SERIAL PRIMARY KEY,
    creator_id INTEGER REFERENCES creators(id) ON DELETE CASCADE,
    collaboration_id INTEGER REFERENCES collaborations(id) ON DELETE CASCADE,
    
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'pending' CHECK (payment_status IN ('pending', 'paid', 'cancelled')),
    payment_date TIMESTAMP,
    
    created_at TIMESTAMP DEFAULT NOW()
);

-- -- Search and discovery optimization
-- CREATE INDEX idx_creators_categories ON creators USING GIN(categories);
-- CREATE INDEX idx_creators_follower_count ON creators(follower_count DESC);
-- CREATE INDEX idx_creators_engagement_rate ON creators(engagement_rate DESC);
-- CREATE INDEX idx_creators_available ON creators(is_available) WHERE is_available = true;

-- -- Collaboration queries
-- CREATE INDEX idx_collaborations_brand_status ON collaborations(brand_id, status);
-- CREATE INDEX idx_collaborations_creator_status ON collaborations(creator_id, status);
-- CREATE INDEX idx_collaborations_sent_at ON collaborations(sent_at DESC);

-- -- Earnings queries
-- CREATE INDEX idx_earnings_creator_date ON earnings(creator_id, created_at DESC);