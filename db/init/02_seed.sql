-- Seed platforms
INSERT INTO platforms (name, label, color, icon) VALUES
  ('instagram', 'Instagram', '#E1306C', 'instagram'),
  ('facebook',  'Facebook',  '#1877F2', 'facebook'),
  ('twitter',   'Twitter/X', '#1DA1F2', 'twitter'),
  ('reddit',    'Reddit',    '#FF4500', 'reddit'),
  ('snapchat',  'Snapchat',  '#FFDD00', 'snapchat'),
  ('linkedin',  'LinkedIn',  '#0A66C2', 'linkedin'),
  ('youtube',   'YouTube',   '#FF0000', 'youtube'),
  ('tiktok',    'TikTok',    '#69C9D0', 'tiktok'),
  ('pinterest', 'Pinterest', '#E60023', 'pinterest');

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
-- Marcus Venn (id=1): Instagram, Facebook, LinkedIn, YouTube, TikTok
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (1, 1, '@marcusvenn_cph', 'Marcus Venn', 'Photographer. Archive enthusiast. Streets of CPH. 📷', 4821, 312, 187, 'https://instagram.com/marcusvenn_cph', TRUE, '2025-12-10T18:00:00Z'),
  (1, 2, 'Marcus Venn', 'Marcus Venn', 'Photography | Copenhagen | Sharing moments worth keeping.', 892, 540, 634, 'https://facebook.com/marcusvenn', TRUE, '2026-01-03T10:30:00Z'),
  (1, 6, 'Marcus Venn', 'Marcus Venn', 'Street & documentary photographer based in Copenhagen.', 1203, 489, 47, 'https://linkedin.com/in/marcusvenn', TRUE, '2025-11-20T14:00:00Z'),
  (1, 7, 'MarcusVennCPH', 'Marcus Venn Photography', 'Long-form city walks and photography process videos.', 8341, NULL, 62, 'https://youtube.com/@MarcusVennCPH', TRUE, '2025-12-01T16:00:00Z'),
  (1, 8, '@marcusvenn', 'marcusvenn', '📷 streets of CPH | one frame at a time', 2190, 430, 94, 'https://tiktok.com/@marcusvenn', TRUE, '2025-11-28T20:00:00Z');

-- Lena Hartmann (id=2): Twitter, Instagram, Snapchat, Pinterest
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (2, 3, '@lena_hartmann', 'Lena Hartmann', 'Berlin. Writing. Coffee. Mostly offline now.', 1203, 890, 2341, 'https://twitter.com/lena_hartmann', FALSE, '2023-08-14T09:00:00Z'),
  (2, 1, '@lena.h.berlin', 'Lena H.', 'Just here for the aesthetics 🌿', 3412, 654, 89, 'https://instagram.com/lena.h.berlin', FALSE, '2023-07-28T20:00:00Z'),
  (2, 5, 'lena.hartmann', 'Lena', NULL, NULL, NULL, NULL, 'https://snapchat.com/add/lena.hartmann', FALSE, '2023-06-10T11:00:00Z'),
  (2, 9, 'lenahbln', 'Lena Hartmann', 'Interior, plants, slow mornings.', 7821, NULL, 312, 'https://pinterest.com/lenahbln', FALSE, '2023-05-20T09:00:00Z');

-- David Kolberg (id=3): Reddit, Twitter, YouTube, TikTok
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (3, 4, 'd4v1d_99', 'd4v1d_99', 'just a guy on the internet | hates bad UX | lurker turned commenter', 847, NULL, 4103, 'https://reddit.com/u/d4v1d_99', TRUE, '2026-03-18T22:00:00Z'),
  (3, 3, '@d4v1d99hh', 'd4v1d99', 'building things. breaking things. mostly on reddit.', 412, 1023, 8701, 'https://twitter.com/d4v1d99hh', TRUE, '2026-03-17T15:00:00Z'),
  (3, 7, 'd4v1dBuilds', 'd4v1d Builds', 'tutorials nobody asked for | live coding chaos', 3102, NULL, 28, 'https://youtube.com/@d4v1dBuilds', TRUE, '2026-02-10T21:00:00Z'),
  (3, 8, '@d4v1d_99', 'd4v1d_99', 'dev takes + bad opinions', 1890, 234, 156, 'https://tiktok.com/@d4v1d_99', TRUE, '2026-03-15T18:00:00Z');

-- Rina Okafor (id=4): Facebook only (memorialized)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (4, 2, 'Rina Okafor', 'Rina Okafor ✨ Remembering', 'This account has been memorialized. Rina passed away in April 2022. She is dearly missed.', 2341, 1102, 1847, 'https://facebook.com/rinaokafor', FALSE, '2022-04-10T13:00:00Z');

-- Søren Bundgaard (id=5): Facebook, LinkedIn
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (5, 2, 'Søren Bundgaard', 'Søren Bundgaard', NULL, NULL, NULL, 312, 'https://facebook.com/sorenbundgaard', FALSE, '2021-11-03T17:00:00Z'),
  (5, 6, 'Søren Bundgaard', 'Søren Bundgaard', 'Project manager. Based in Aarhus.', 203, 178, 14, 'https://linkedin.com/in/sorenbundgaard', FALSE, '2021-10-15T10:00:00Z');

-- Priya Anand (id=6): Instagram, Facebook, Reddit, LinkedIn, YouTube, TikTok, Pinterest
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (6, 1, '@priya.codes', 'Priya Anand', '🛠 Building in public | Tech & dev content | London | she/her', 28400, 1843, 412, 'https://instagram.com/priya.codes', TRUE, '2026-03-15T11:00:00Z'),
  (6, 2, 'Priya Anand', 'Priya Anand', 'Tech creator. Helping people learn to build things on the internet.', 9812, 2341, 1203, 'https://facebook.com/priyaanand', TRUE, '2026-03-10T09:00:00Z'),
  (6, 4, 'PriyaBuilds', 'PriyaBuilds', 'I post about tech, dev tools, and occasionally my cat. AMA.', 14200, NULL, 892, 'https://reddit.com/u/PriyaBuilds', TRUE, '2026-03-19T08:00:00Z'),
  (6, 6, 'Priya Anand', 'Priya Anand', 'Software engineer & tech content creator. Building in public.', 34100, 1200, 289, 'https://linkedin.com/in/priyaanand', TRUE, '2026-03-18T10:00:00Z'),
  (6, 7, 'PriyaCodes', 'Priya Codes', 'Dev tutorials, build-in-public vlogs, and weekly tea opinions.', 51200, NULL, 134, 'https://youtube.com/@PriyaCodes', TRUE, '2026-03-12T14:00:00Z'),
  (6, 8, '@priya.codes', 'priya.codes', 'tech for humans | coding tips | london life', 82300, 912, 341, 'https://tiktok.com/@priya.codes', TRUE, '2026-03-19T09:00:00Z'),
  (6, 9, 'priyacodes', 'Priya Anand', 'Dev tools, workspace setups, and things that spark joy.', 6200, NULL, 178, 'https://pinterest.com/priyacodes', TRUE, '2026-03-10T08:00:00Z');

-- Posts for Marcus Venn — Instagram (profile_id=1)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (1, 'Wandered through Meatpacking District at 6am before anyone else showed up. The light does something different to old brick. 📷', 213, 14, '2025-12-10T06:45:00Z', 'post'),
  (1, 'Finally found a decent shawarma place near Nørreport. It''s not fancy but it''s honest. That''s the kind of thing I want to remember about this city.', 89, 7, '2025-11-22T19:30:00Z', 'post'),
  (1, 'Three years of shooting the same canal. Every season, every weather. Archiving isn''t dramatic — it''s just showing up.', 341, 28, '2025-10-14T14:00:00Z', 'post');

-- Posts for Marcus Venn — Facebook (profile_id=2)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (2, 'Had the most interesting conversation with an old man at Assistens Cemetery today. He visits every Sunday. Has been for 40 years. Some archives are just people.', 67, 12, '2026-01-03T10:30:00Z', 'post'),
  (2, 'Happy new year, CPH. Still here. Still shooting.', 142, 34, '2026-01-01T00:15:00Z', 'post');

-- Posts for Marcus Venn — YouTube (profile_id=4)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (4, 'Walking Copenhagen at Dawn — 1 hour of street photography, no talking, no music. Just the city.', 4102, 312, '2025-12-01T16:00:00Z', 'post'),
  (4, 'How I choose what to keep and what to delete (the archivist mindset)', 2891, 198, '2025-10-20T14:00:00Z', 'post');

-- Posts for Lena Hartmann — Twitter (profile_id=5)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (5, 'taking a break from here. maybe a long one. the internet feels too loud lately', 892, 103, '2023-08-14T09:12:00Z', 'post'),
  (5, 'Berlin summer. Everyone you know is at a lake you''ve never heard of. Thermometer says 34°. Ice cream says more.', 1203, 67, '2023-07-01T13:00:00Z', 'post');

-- Posts for Lena Hartmann — Instagram (profile_id=6)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (6, 'Morning light through the kitchen window. That''s it. That''s the post. 🌿', 2341, 45, '2023-07-28T08:30:00Z', 'post');

-- Posts for David Kolberg — Reddit (profile_id=9)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (9, 'Hot take: most productivity apps are just procrastination with a better UI. Fight me.', 4102, 312, '2026-03-18T22:15:00Z', 'post'),
  (9, 'Spent 3 hours debugging what turned out to be a missing semicolon. I''m fine. Everything is fine.', 8923, 543, '2026-02-14T23:45:00Z', 'post'),
  (9, 'Nobody talks about how the early internet smelled. You know what I mean.', 12043, 891, '2026-01-30T02:00:00Z', 'comment');

-- Posts for David Kolberg — Twitter (profile_id=10)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (10, 'me: I''ll just fix this one small thing\nalso me at 3am: so anyway I rewrote the entire authentication system', 3421, 189, '2026-03-17T03:12:00Z', 'post'),
  (10, 'the correct way to name a variable is to describe exactly what it holds. "data" is not a name. "data" is a cry for help.', 5891, 412, '2026-02-28T11:00:00Z', 'post');

-- Posts for Rina Okafor — Facebook (profile_id=13)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (13, 'We remember Rina on what would have been her birthday. She loved this platform, loved staying connected. — The Okafor family', 1847, 312, '2022-11-30T10:00:00Z', 'post'),
  (13, 'Lagos marathon tomorrow!! Who''s running? I''ve been training for three months and I''m absolutely not ready but showing up anyway 😂💪', 234, 67, '2022-04-09T19:00:00Z', 'post');

-- Posts for Priya Anand — Instagram (profile_id=15)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (15, 'Three years of building in public. Some things worked. Most didn''t. The ratio is fine. 🛠✨', 4821, 312, '2026-03-15T11:30:00Z', 'post'),
  (15, 'Tutorial dropped: how I built my personal archive tool in a weekend — link in bio', 7203, 541, '2026-02-20T10:00:00Z', 'post'),
  (15, 'My cat deleted my draft post by walking on the keyboard. Honestly the feedback I deserved.', 9823, 892, '2025-12-01T21:00:00Z', 'post');

-- Posts for Priya Anand — Reddit (profile_id=17)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (17, 'I built a tool that archives your own digital footprint before platforms delete it. Thought this community might find it interesting.', 2341, 189, '2026-03-19T08:30:00Z', 'post'),
  (17, 'AMA: I''ve shipped 12 side projects in 3 years. 2 made money. 10 taught me something. Ask me anything.', 5670, 423, '2026-02-10T14:00:00Z', 'post');

-- Posts for Priya Anand — YouTube (profile_id=19)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (19, 'I spent a week using only open source tools. Here''s what broke immediately.', 18200, 1203, '2026-03-12T14:00:00Z', 'post'),
  (19, 'Build with me: a personal archive app from scratch (full stack, live)', 24100, 1891, '2026-02-01T10:00:00Z', 'post');

-- Posts for Priya Anand — TikTok (profile_id=20)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (20, 'POV: you''re a developer who just found a bug in production at 11pm', 92300, 4102, '2026-03-19T09:00:00Z', 'post'),
  (20, 'Things nobody tells you before you start building in public', 67800, 3201, '2026-03-01T12:00:00Z', 'post');
