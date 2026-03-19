-- Seed platforms
INSERT INTO platforms (name, label, color, icon) VALUES
  ('instagram', 'Instagram', '#E1306C', 'instagram'),
  ('facebook',  'Facebook',  '#1877F2', 'facebook'),
  ('twitter',   'Twitter/X', '#1DA1F2', 'twitter'),
  ('reddit',    'Reddit',    '#FF4500', 'reddit');

-- Seed persons
INSERT INTO persons (full_name, birth_date, is_deceased, death_date, location, avatar_url, digital_status, archived_at, notes) VALUES
  (
    'Marcus Venn',
    '1991-03-14',
    FALSE, NULL,
    'Copenhagen, Denmark',
    'https://api.dicebear.com/7.x/personas/svg?seed=MarcusVenn',
    'active',
    '2024-11-01T10:00:00Z',
    'Active photographer and urban explorer. Regularly posts across platforms.'
  ),
  (
    'Lena Hartmann',
    '1996-07-22',
    FALSE, NULL,
    'Berlin, Germany',
    'https://api.dicebear.com/7.x/personas/svg?seed=LenaHartmann',
    'absent',
    '2024-09-15T08:30:00Z',
    'Last online activity detected in mid-2023. Accounts remain public but silent.'
  ),
  (
    'David Kolberg',
    '2003-01-05',
    FALSE, NULL,
    'Hamburg, Germany',
    'https://api.dicebear.com/7.x/personas/svg?seed=d4v1d99',
    'active',
    '2025-01-20T14:00:00Z',
    'Pseudonymous online presence. Heavy commenter and forum participant.'
  ),
  (
    'Rina Okafor',
    '1985-11-30',
    TRUE, '2022-04-17',
    'Lagos, Nigeria',
    'https://api.dicebear.com/7.x/personas/svg?seed=RinaOkafor',
    'deceased',
    '2023-06-01T00:00:00Z',
    'Passed away April 2022. Facebook profile memorialized by family. Instagram was deleted by family request shortly after.'
  ),
  (
    'Søren Bundgaard',
    '1984-05-19',
    FALSE, NULL,
    'Aarhus, Denmark',
    'https://api.dicebear.com/7.x/personas/svg?seed=SorenBundgaard',
    'absent',
    '2024-03-10T11:00:00Z',
    'Facebook account privacy-locked since 2021. No public activity since then. Status unknown.'
  ),
  (
    'Priya Anand',
    '1998-09-03',
    FALSE, NULL,
    'London, United Kingdom',
    'https://api.dicebear.com/7.x/personas/svg?seed=PriyaAnand',
    'active',
    '2025-02-28T09:00:00Z',
    'Tech content creator. Maintains active presence across multiple platforms.'
  );

-- Seed platform profiles
-- Marcus Venn (id=1)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (1, 1, '@marcusvenn_cph', 'Marcus Venn', 'Photographer. Archive enthusiast. Streets of CPH. 📷', 4821, 312, 187, 'https://instagram.com/marcusvenn_cph', TRUE, '2025-12-10T18:00:00Z'),
  (1, 2, 'Marcus Venn', 'Marcus Venn', 'Photography | Copenhagen | Sharing moments worth keeping.', 892, 540, 634, 'https://facebook.com/marcusvenn', TRUE, '2026-01-03T10:30:00Z');

-- Lena Hartmann (id=2)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (2, 3, '@lena_hartmann', 'Lena Hartmann', 'Berlin. Writing. Coffee. Mostly offline now.', 1203, 890, 2341, 'https://twitter.com/lena_hartmann', FALSE, '2023-08-14T09:00:00Z'),
  (2, 1, '@lena.h.berlin', 'Lena H.', 'Just here for the aesthetics 🌿', 3412, 654, 89, 'https://instagram.com/lena.h.berlin', FALSE, '2023-07-28T20:00:00Z');

-- David Kolberg (id=3)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (3, 4, 'd4v1d_99', 'd4v1d_99', 'just a guy on the internet | hates bad UX | lurker turned commenter', 847, NULL, 4103, 'https://reddit.com/u/d4v1d_99', TRUE, '2026-03-18T22:00:00Z'),
  (3, 3, '@d4v1d99hh', 'd4v1d99', 'building things. breaking things. mostly on reddit.', 412, 1023, 8701, 'https://twitter.com/d4v1d99hh', TRUE, '2026-03-17T15:00:00Z');

-- Rina Okafor (id=4)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (4, 2, 'Rina Okafor', 'Rina Okafor ✨ Remembering', 'This account has been memorialized. Rina passed away in April 2022. She is dearly missed.', 2341, 1102, 1847, 'https://facebook.com/rinaokafor', FALSE, '2022-04-10T13:00:00Z');

-- Søren Bundgaard (id=5)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (5, 2, 'Søren Bundgaard', 'Søren Bundgaard', NULL, NULL, NULL, 312, 'https://facebook.com/sorenbundgaard', FALSE, '2021-11-03T17:00:00Z');

-- Priya Anand (id=6)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (6, 1, '@priya.codes', 'Priya Anand', '🛠 Building in public | Tech & dev content | London | she/her', 28400, 1843, 412, 'https://instagram.com/priya.codes', TRUE, '2026-03-15T11:00:00Z'),
  (6, 2, 'Priya Anand', 'Priya Anand', 'Tech creator. Helping people learn to build things on the internet.', 9812, 2341, 1203, 'https://facebook.com/priyaanand', TRUE, '2026-03-10T09:00:00Z'),
  (6, 4, 'PriyaBuilds', 'PriyaBuilds', 'I post about tech, dev tools, and occasionally my cat. AMA.', 14200, NULL, 892, 'https://reddit.com/u/PriyaBuilds', TRUE, '2026-03-19T08:00:00Z');

-- Posts for Marcus Venn — Instagram profile (profile_id=1)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (1, 'Wandered through Meatpacking District at 6am before anyone else showed up. The light does something different to old brick. 📷', 213, 14, '2025-12-10T06:45:00Z', 'post'),
  (1, 'Finally found a decent shawarma place near Nørreport. It''s not fancy but it''s honest. That''s the kind of thing I want to remember about this city.', 89, 7, '2025-11-22T19:30:00Z', 'post'),
  (1, 'Three years of shooting the same canal. Every season, every weather. Archiving isn''t dramatic — it''s just showing up.', 341, 28, '2025-10-14T14:00:00Z', 'post'),
  (1, 'Weekend market at Israels Plads. Same vendors as always. Same regulars. There''s a quiet kind of continuity in that.', 156, 9, '2025-09-28T11:00:00Z', 'post');

-- Posts for Marcus Venn — Facebook profile (profile_id=2)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (2, 'Had the most interesting conversation with an old man at Assistens Cemetery today. He visits every Sunday. Has been for 40 years. Some archives are just people.', 67, 12, '2026-01-03T10:30:00Z', 'post'),
  (2, 'Happy new year, CPH. Still here. Still shooting.', 142, 34, '2026-01-01T00:15:00Z', 'post'),
  (2, 'Reminder that street photography is not surveillance. It''s the opposite. It''s preservation.', 203, 41, '2025-12-05T16:00:00Z', 'post');

-- Posts for Lena Hartmann — Twitter profile (profile_id=3)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (3, 'taking a break from here. maybe a long one. the internet feels too loud lately', 892, 103, '2023-08-14T09:12:00Z', 'post'),
  (3, 'Berlin summer. Everyone you know is at a lake you''ve never heard of. Thermometer says 34°. Ice cream says more.', 1203, 67, '2023-07-01T13:00:00Z', 'post');

-- Posts for Lena Hartmann — Instagram profile (profile_id=4)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (4, 'Morning light through the kitchen window. That''s it. That''s the post. 🌿', 2341, 45, '2023-07-28T08:30:00Z', 'post');

-- Posts for David Kolberg — Reddit profile (profile_id=5)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (5, 'Hot take: most productivity apps are just procrastination with a better UI. Fight me.', 4102, 312, '2026-03-18T22:15:00Z', 'post'),
  (5, 'Spent 3 hours debugging what turned out to be a missing semicolon. I''m fine. Everything is fine.', 8923, 543, '2026-02-14T23:45:00Z', 'post'),
  (5, 'Nobody talks about how the early internet smelled. You know what I mean. That specific late night, dim monitor, instant messenger energy.', 12043, 891, '2026-01-30T02:00:00Z', 'comment'),
  (5, 'Why do login forms still ask for username OR email and then reject one without telling you which one you signed up with?', 6712, 234, '2025-12-20T19:30:00Z', 'post');

-- Posts for David Kolberg — Twitter profile (profile_id=6)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (6, 'me: I''ll just fix this one small thing\nalso me at 3am: so anyway I rewrote the entire authentication system', 3421, 189, '2026-03-17T03:12:00Z', 'post'),
  (6, 'the correct way to name a variable is to describe exactly what it holds in plain language. "data" is not a name. "data" is a cry for help.', 5891, 412, '2026-02-28T11:00:00Z', 'post');

-- Posts for Rina Okafor — Facebook profile (profile_id=7)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (7, 'We remember Rina on what would have been her birthday. She loved this platform, loved staying connected, loved knowing what everyone was up to. Some things she posted here feel like she''s still talking to us. We''re glad they''re still here. — The Okafor family', 1847, 312, '2022-11-30T10:00:00Z', 'post'),
  (7, 'Lagos marathon tomorrow!! Who''s running? I''ve been training for three months and I''m absolutely not ready but showing up anyway 😂💪', 234, 67, '2022-04-09T19:00:00Z', 'post');

-- Posts for Priya Anand — Instagram profile (profile_id=8)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (8, 'Three years of building in public. Some things worked. Most didn''t. The ratio is fine. 🛠✨', 4821, 312, '2026-03-15T11:30:00Z', 'post'),
  (8, 'Tutorial dropped: how I built my personal archive tool in a weekend (and why everyone should have one) — link in bio', 7203, 541, '2026-02-20T10:00:00Z', 'post'),
  (8, 'Hot London take: the best coffee is in the places that don''t have a website. Unverifiable but feels true.', 3412, 178, '2026-01-28T08:45:00Z', 'post'),
  (8, 'My cat deleted my draft post by walking on the keyboard. Honestly the feedback I deserved.', 9823, 892, '2025-12-01T21:00:00Z', 'post');

-- Posts for Priya Anand — Reddit profile (profile_id=10)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (10, 'I built a tool that archives your own digital footprint before platforms delete it. Thought this community might find it interesting.', 2341, 189, '2026-03-19T08:30:00Z', 'post'),
  (10, 'AMA: I''ve shipped 12 side projects in 3 years. 2 made money. 10 taught me something. Ask me anything.', 5670, 423, '2026-02-10T14:00:00Z', 'post');
