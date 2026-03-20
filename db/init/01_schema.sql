-- Digital Footprint Archive — Schema

CREATE TABLE persons (
  id             SERIAL PRIMARY KEY,
  full_name      TEXT NOT NULL,
  birth_date     DATE,
  is_deceased    BOOLEAN NOT NULL DEFAULT FALSE,
  death_date     DATE,
  location       TEXT,
  avatar_url     TEXT,
  digital_status TEXT NOT NULL DEFAULT 'active'
                 CHECK (digital_status IN ('active', 'absent', 'deceased')),
  archived_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  notes          TEXT,
  gender         TEXT CHECK (gender IN ('male', 'female', 'non-binary')),
  last_active    DATE,
  personal_url   TEXT
);

CREATE TABLE platforms (
  id    SERIAL PRIMARY KEY,
  name  TEXT NOT NULL UNIQUE,
  label TEXT NOT NULL,
  color TEXT,
  icon  TEXT
);

CREATE TABLE platform_profiles (
  id              SERIAL PRIMARY KEY,
  person_id       INTEGER NOT NULL REFERENCES persons(id) ON DELETE CASCADE,
  platform_id     INTEGER NOT NULL REFERENCES platforms(id),
  username        TEXT NOT NULL,
  display_name    TEXT,
  bio             TEXT,
  avatar_url      TEXT,
  follower_count  INTEGER,
  following_count INTEGER,
  post_count      INTEGER,
  profile_url     TEXT,
  is_active       BOOLEAN NOT NULL DEFAULT TRUE,
  last_seen_at    TIMESTAMPTZ,
  scraped_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE (person_id, platform_id)
);

CREATE TABLE posts (
  id               SERIAL PRIMARY KEY,
  profile_id       INTEGER NOT NULL REFERENCES platform_profiles(id) ON DELETE CASCADE,
  platform_post_id TEXT,
  content          TEXT,
  image_url        TEXT,
  likes_count      INTEGER DEFAULT 0,
  comments_count   INTEGER DEFAULT 0,
  posted_at        TIMESTAMPTZ,
  archived_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  post_type        TEXT DEFAULT 'post'
                   CHECK (post_type IN ('post', 'comment', 'story', 'reel'))
);
