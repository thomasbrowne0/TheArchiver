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

-- Posts for Lena Hartmann — Twitter (profile_id=6)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (6, 'taking a break from here. maybe a long one. the internet feels too loud lately', 892, 103, '2023-08-14T09:12:00Z', 'post'),
  (6, 'Berlin summer. Everyone you know is at a lake you''ve never heard of. Thermometer says 34°. Ice cream says more.', 1203, 67, '2023-07-01T13:00:00Z', 'post');

-- Posts for Lena Hartmann — Instagram (profile_id=7)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (7, 'Morning light through the kitchen window. That''s it. That''s the post. 🌿', 2341, 45, '2023-07-28T08:30:00Z', 'post');

-- Posts for David Kolberg — Reddit (profile_id=10)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (10, 'Hot take: most productivity apps are just procrastination with a better UI. Fight me.', 4102, 312, '2026-03-18T22:15:00Z', 'post'),
  (10, 'Spent 3 hours debugging what turned out to be a missing semicolon. I''m fine. Everything is fine.', 8923, 543, '2026-02-14T23:45:00Z', 'post'),
  (10, 'Nobody talks about how the early internet smelled. You know what I mean.', 12043, 891, '2026-01-30T02:00:00Z', 'comment');

-- Posts for David Kolberg — Twitter (profile_id=11)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (11, 'me: I''ll just fix this one small thing\nalso me at 3am: so anyway I rewrote the entire authentication system', 3421, 189, '2026-03-17T03:12:00Z', 'post'),
  (11, 'the correct way to name a variable is to describe exactly what it holds. "data" is not a name. "data" is a cry for help.', 5891, 412, '2026-02-28T11:00:00Z', 'post');

-- Posts for Rina Okafor — Facebook (profile_id=14)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (14, 'We remember Rina on what would have been her birthday. She loved this platform, loved staying connected. — The Okafor family', 1847, 312, '2022-11-30T10:00:00Z', 'post'),
  (14, 'Lagos marathon tomorrow!! Who''s running? I''ve been training for three months and I''m absolutely not ready but showing up anyway 😂💪', 234, 67, '2022-04-09T19:00:00Z', 'post');

-- Posts for Priya Anand — Instagram (profile_id=17)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (17, 'Three years of building in public. Some things worked. Most didn''t. The ratio is fine. 🛠✨', 4821, 312, '2026-03-15T11:30:00Z', 'post'),
  (17, 'Tutorial dropped: how I built my personal archive tool in a weekend — link in bio', 7203, 541, '2026-02-20T10:00:00Z', 'post'),
  (17, 'My cat deleted my draft post by walking on the keyboard. Honestly the feedback I deserved.', 9823, 892, '2025-12-01T21:00:00Z', 'post');

-- Posts for Priya Anand — Reddit (profile_id=19)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (19, 'I built a tool that archives your own digital footprint before platforms delete it. Thought this community might find it interesting.', 2341, 189, '2026-03-19T08:30:00Z', 'post'),
  (19, 'AMA: I''ve shipped 12 side projects in 3 years. 2 made money. 10 taught me something. Ask me anything.', 5670, 423, '2026-02-10T14:00:00Z', 'post');

-- Posts for Priya Anand — YouTube (profile_id=21)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (21, 'I spent a week using only open source tools. Here''s what broke immediately.', 18200, 1203, '2026-03-12T14:00:00Z', 'post'),
  (21, 'Build with me: a personal archive app from scratch (full stack, live)', 24100, 1891, '2026-02-01T10:00:00Z', 'post');

-- Posts for Priya Anand — TikTok (profile_id=22)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (22, 'POV: you''re a developer who just found a bug in production at 11pm', 92300, 4102, '2026-03-19T09:00:00Z', 'post'),
  (22, 'Things nobody tells you before you start building in public', 67800, 3201, '2026-03-01T12:00:00Z', 'post');

-- ============================================================
-- BATCH 1 — Persons 7–16  (profiles 24–46)
-- ============================================================

INSERT INTO persons (full_name, birth_date, is_deceased, death_date, location, avatar_url, digital_status, archived_at, notes) VALUES
  ('James Whitfield',   '1978-06-12', TRUE,  '2019-02-28', 'San Francisco, USA',   'https://api.dicebear.com/7.x/personas/svg?seed=JamesWhitfield',  'deceased', '2020-03-01T00:00:00Z', 'Passed away February 2019. Twitter account preserved by his sister. He was a freelance journalist and avid birder.'),
  ('Yuki Tanaka',       '1990-11-03', TRUE,  '2021-09-14', 'Tokyo, Japan',         'https://api.dicebear.com/7.x/personas/svg?seed=YukiTanaka',       'deceased', '2022-01-10T00:00:00Z', 'Passed away September 2021. Instagram memorialized. Known in local illustration communities.'),
  ('Ana Cristina Ferreira','1994-04-18', FALSE, NULL,     'Lisbon, Portugal',     'https://api.dicebear.com/7.x/personas/svg?seed=AnaCristinaFerreira','absent', '2024-05-20T09:00:00Z', 'Went quiet online in early 2024. Accounts still public. Last post was a photo of the Tagus at sunset.'),
  ('Mohammed Al-Rashid','1987-09-01', FALSE, NULL,        'Dubai, UAE',           'https://api.dicebear.com/7.x/personas/svg?seed=MohammedAlRashid', 'absent', '2024-08-03T11:00:00Z', 'LinkedIn last updated 2023. Twitter silent since mid-2023. Previously worked in logistics.'),
  ('Ingrid Svensson',   '1992-02-14', FALSE, NULL,        'Stockholm, Sweden',    'https://api.dicebear.com/7.x/personas/svg?seed=IngridSvensson',   'active', '2025-06-01T08:00:00Z', 'Interior design enthusiast. Posts regularly about Scandinavian aesthetics and slow living.'),
  ('Carlos Mendes',     '1989-07-25', FALSE, NULL,        'São Paulo, Brazil',    'https://api.dicebear.com/7.x/personas/svg?seed=CarlosMendes',     'absent', '2024-02-14T10:00:00Z', 'Facebook dormant since late 2023. No forwarding contact. Previously followed local football.'),
  ('Aisha Nwosu',       '1999-12-07', FALSE, NULL,        'Lagos, Nigeria',       'https://api.dicebear.com/7.x/personas/svg?seed=AishaNwosu',       'active', '2025-09-10T07:00:00Z', 'Fashion and beauty content creator. Strong presence on short-form video platforms.'),
  ('Oliver Bennett',    '1983-03-22', FALSE, NULL,        'Manchester, UK',       'https://api.dicebear.com/7.x/personas/svg?seed=OliverBennett',    'absent', '2023-11-05T14:00:00Z', 'Facebook and Twitter last active late 2022. Used to run a local music blog. Status unknown.'),
  ('Mei Lin',           '1995-08-09', FALSE, NULL,        'Singapore',            'https://api.dicebear.com/7.x/personas/svg?seed=MeiLinSG',         'active', '2025-10-18T06:30:00Z', 'UX designer and part-time food blogger. Very active on visual platforms.'),
  ('Lukas Becker',      '1995-05-30', FALSE, NULL,        'Berlin, Germany',      'https://api.dicebear.com/7.x/personas/svg?seed=LukasBecker',      'active', '2025-11-22T13:00:00Z', 'Open source contributor and tech blogger. Spends more time on Reddit than anywhere else.');

-- Batch 1 profiles
-- James Whitfield (id=7): Twitter(24), Instagram(25)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (7, 3, '@jwhitfield_sf', 'James Whitfield', 'Journalist. Birds. Bay Area fog. Opinions my own.', 2103, 1840, 9214, 'https://twitter.com/jwhitfield_sf', FALSE, '2019-02-20T11:00:00Z'),
  (7, 1, '@jwhitfield.birds', 'James Whitfield', 'Pacific flyway birding journal. SF bay and beyond.', 891, 304, 412, 'https://instagram.com/jwhitfield.birds', FALSE, '2019-01-30T09:00:00Z');

-- Yuki Tanaka (id=8): Instagram(26), Twitter(27)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (8, 1, '@yuki.illust', 'Yuki Tanaka', 'イラストレーター / illustrator 🌸 tokyo', 5820, 1032, 634, 'https://instagram.com/yuki.illust', FALSE, '2021-08-31T20:00:00Z'),
  (8, 3, '@yukitanaka_art', 'Yuki Tanaka', 'Drawing things. Sometimes they turn out okay.', 1204, 890, 3102, 'https://twitter.com/yukitanaka_art', FALSE, '2021-09-10T18:00:00Z');

-- Ana Cristina Ferreira (id=9): Instagram(28), Facebook(29)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (9, 1, '@anacristina.lx', 'Ana Cristina', 'Lisbon 🌊 | photographer | the light here is different', 3102, 720, 241, 'https://instagram.com/anacristina.lx', FALSE, '2024-01-12T19:00:00Z'),
  (9, 2, 'Ana Cristina Ferreira', 'Ana Cristina Ferreira', NULL, 412, 389, 180, 'https://facebook.com/anacristinaferreira', FALSE, '2023-12-28T10:00:00Z');

-- Mohammed Al-Rashid (id=10): Twitter(30), LinkedIn(31)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (10, 3, '@mo_alrashid', 'Mohammed Al-Rashid', 'Supply chain | Dubai | Thoughts on trade and logistics.', 834, 1203, 2041, 'https://twitter.com/mo_alrashid', FALSE, '2023-07-04T08:00:00Z'),
  (10, 6, 'Mohammed Al-Rashid', 'Mohammed Al-Rashid', 'Senior Logistics Manager | Dubai | Supply Chain Specialist', 1890, 643, 38, 'https://linkedin.com/in/mohammedalrashid', FALSE, '2023-09-15T10:00:00Z');

-- Ingrid Svensson (id=11): Instagram(32), Pinterest(33)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (11, 1, '@ingrid.slow', 'Ingrid Svensson', 'Slow living. Linen. Plants. Stockholm light.', 7841, 1203, 318, 'https://instagram.com/ingrid.slow', TRUE, '2026-03-18T09:00:00Z'),
  (11, 9, 'ingridslowliving', 'Ingrid Svensson', 'Interiors, textiles, and the art of doing less.', 14200, NULL, 892, 'https://pinterest.com/ingridslowliving', TRUE, '2026-03-10T14:00:00Z');

-- Carlos Mendes (id=12): Facebook(34), Instagram(35)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (12, 2, 'Carlos Mendes SP', 'Carlos Mendes', NULL, 312, 498, 204, 'https://facebook.com/carlosmendessp', FALSE, '2023-10-30T20:00:00Z'),
  (12, 1, '@carlos.mendes.sp', 'Carlos Mendes', 'São Paulo 🇧🇷 | futebol | família | vida simples', 204, 380, 91, 'https://instagram.com/carlos.mendes.sp', FALSE, '2023-11-14T18:00:00Z');

-- Aisha Nwosu (id=13): Instagram(36), TikTok(37), YouTube(38)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (13, 1, '@aisha.nwosu', 'Aisha Nwosu', '✨ Fashion | Beauty | Lagos life | she/her', 42100, 2103, 509, 'https://instagram.com/aisha.nwosu', TRUE, '2026-03-19T08:00:00Z'),
  (13, 8, '@aishanwosu', 'aisha nwosu', 'affordable looks, honest reviews, zero filter', 98400, 1203, 287, 'https://tiktok.com/@aishanwosu', TRUE, '2026-03-19T10:00:00Z'),
  (13, 7, 'AishaNwosu', 'Aisha Nwosu', 'Get ready with me, haul videos, and Lagos street style guides.', 31200, NULL, 94, 'https://youtube.com/@AishaNwosu', TRUE, '2026-03-15T12:00:00Z');

-- Oliver Bennett (id=14): Facebook(39), Twitter(40)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (14, 2, 'Oliver Bennett MCR', 'Oliver Bennett', 'Manchester. Music. Probably at a gig.', 728, 613, 341, 'https://facebook.com/oliverbennettmcr', FALSE, '2022-11-18T21:00:00Z'),
  (14, 3, '@oliverbmcr', 'Oliver Bennett', 'Indie | post-punk | gig listings | MCR', 1403, 2012, 5830, 'https://twitter.com/oliverbmcr', FALSE, '2022-10-05T19:00:00Z');

-- Mei Lin (id=15): Instagram(41), TikTok(42), LinkedIn(43)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (15, 1, '@meilin.eats', 'Mei Lin', 'UX by day 🖥 food by night 🍜 Singapore-based', 18300, 1402, 634, 'https://instagram.com/meilin.eats', TRUE, '2026-03-18T21:00:00Z'),
  (15, 8, '@meilineats', 'mei lin', 'hawker centre rankings | UX hot takes | not a food critic', 54100, 830, 412, 'https://tiktok.com/@meilineats', TRUE, '2026-03-19T07:00:00Z'),
  (15, 6, 'Mei Lin', 'Mei Lin', 'UX Designer | Singapore | Designing for clarity.', 4102, 1830, 72, 'https://linkedin.com/in/meilinsg', TRUE, '2026-03-12T09:00:00Z');

-- Lukas Becker (id=16): Reddit(44), Twitter(45), YouTube(46)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (16, 4, 'lukasbecker_dev', 'lukasbecker_dev', 'open source nerd | linux evangelist | will not shut up about vim', 2103, NULL, 7841, 'https://reddit.com/u/lukasbecker_dev', TRUE, '2026-03-19T01:00:00Z'),
  (16, 3, '@lukas_becker', 'Lukas Becker', 'Shipping open source from Berlin. Currently: a terminal RSS reader nobody asked for.', 3892, 1203, 4102, 'https://twitter.com/lukas_becker', TRUE, '2026-03-18T22:00:00Z'),
  (16, 7, 'LukasBeckerDev', 'Lukas Becker', 'Deep dives into open source tools, Linux ricing, and things that run in a terminal.', 12400, NULL, 51, 'https://youtube.com/@LukasBeckerDev', TRUE, '2026-03-10T16:00:00Z');

-- Posts for James Whitfield — Twitter (profile_id=24)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (24, 'Spotted a Pacific Loon at Crissy Field this morning. First of the season. Still feels like a miracle every time.', 312, 28, '2019-02-20T08:30:00Z', 'post'),
  (24, 'Working on a piece about how San Francisco''s shoreline used to look before the fill. Old maps are something else.', 189, 14, '2019-01-15T14:00:00Z', 'post');

-- Posts for James Whitfield — Instagram (profile_id=25)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (25, 'Golden Gate in the fog. Shot this at 6am, nearly dropped my thermos. Worth it.', 891, 67, '2019-01-30T07:00:00Z', 'post');

-- Posts for Yuki Tanaka — Instagram (profile_id=26)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (26, '新しいシリーズ、描き始めました。秋の東京の色が好きで。/ Started a new series. I love the colors of autumn Tokyo.', 4102, 183, '2021-08-31T20:00:00Z', 'post'),
  (26, 'Sketchbook pages from this month. Trying to draw things before they disappear.', 3890, 142, '2021-07-12T18:00:00Z', 'post');

-- Posts for Yuki Tanaka — Twitter (profile_id=27)
INSERT INTO posts (profile_id, content, likes_count, comments_count, posted_at, post_type) VALUES
  (27, 'finished the illustration i''ve been working on for two weeks. it''s not perfect but it''s done. done is good.', 2341, 89, '2021-09-10T18:00:00Z', 'post');

-- ============================================================
-- BATCH 2 — Persons 17–26  (profiles 47–71)
-- ============================================================

INSERT INTO persons (full_name, birth_date, is_deceased, death_date, location, avatar_url, digital_status, archived_at, notes) VALUES
  ('Diego Reyes',       '1996-03-11', FALSE, NULL, 'Mexico City, Mexico',      'https://api.dicebear.com/7.x/personas/svg?seed=DiegoReyes',      'active', '2025-08-14T10:00:00Z', 'Travel and street food creator. Covers CDMX tacos with the same energy as a nature documentary.'),
  ('Fatima Zahra',      '1996-09-27', FALSE, NULL, 'Casablanca, Morocco',      'https://api.dicebear.com/7.x/personas/svg?seed=FatimaZahra',     'absent', '2024-04-02T08:00:00Z', 'Last active early 2024. Previously shared poetry and cultural commentary in Arabic and French.'),
  ('Tobias Roth',       '1993-12-01', FALSE, NULL, 'Hamburg, Germany',         'https://api.dicebear.com/7.x/personas/svg?seed=TobiasRoth',      'active', '2025-07-19T13:00:00Z', 'Software engineer and open source maintainer. Posts long-form YouTube essays on developer tooling.'),
  ('Natasha Voronova',  '1993-05-16', FALSE, NULL, 'Saint Petersburg, Russia', 'https://api.dicebear.com/7.x/personas/svg?seed=NatashaVoronova', 'absent', '2024-01-30T11:00:00Z', 'Instagram and Pinterest silent since late 2023. Previously curated a botanical illustration account.'),
  ('Jake Morrison',     '1985-08-04', FALSE, NULL, 'Chicago, USA',             'https://api.dicebear.com/7.x/personas/svg?seed=JakeMorrison',   'absent', '2023-09-12T15:00:00Z', 'LinkedIn last updated 2022. Twitter and Facebook inactive. Former marketing manager.'),
  ('Amara Osei',        '1999-02-23', FALSE, NULL, 'Accra, Ghana',             'https://api.dicebear.com/7.x/personas/svg?seed=AmaraOsei',      'absent', '2024-07-08T09:00:00Z', 'Went silent mid-2024 after a period of frequent posting. Accounts remain up with no explanation.'),
  ('Tomás García',      '1990-11-18', FALSE, NULL, 'Madrid, Spain',            'https://api.dicebear.com/7.x/personas/svg?seed=TomasGarcia',    'active', '2025-05-03T07:00:00Z', 'Cinematographer and short film director. Posts behind-the-scenes content and mini-documentaries.'),
  ('Chloe Dupont',      '1994-06-30', FALSE, NULL, 'Paris, France',            'https://api.dicebear.com/7.x/personas/svg?seed=ChloeDupont',    'absent', '2023-12-20T10:00:00Z', 'Instagram and Pinterest dormant since late 2023. Previously a lifestyle and interiors blogger.'),
  ('Riku Mäkinen',      '1987-01-07', FALSE, NULL, 'Helsinki, Finland',        'https://api.dicebear.com/7.x/personas/svg?seed=RikuMakinen',    'absent', '2024-03-18T12:00:00Z', 'LinkedIn last seen 2023. Facebook locked. Former project manager at a Helsinki tech startup.'),
  ('Elena Vasilieva',   '1996-07-14', FALSE, NULL, 'Saint Petersburg, Russia', 'https://api.dicebear.com/7.x/personas/svg?seed=ElenaVasilieva', 'active', '2025-10-25T08:00:00Z', 'Illustrator and pattern designer. Sells prints online and documents her process on social media.');

-- Diego Reyes (id=17): Instagram(47), TikTok(48), YouTube(49)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (17, 1, '@diego.cdmx', 'Diego Reyes', '🌮 Street food anthropologist | CDMX | filming every taco stand in the city', 31400, 1803, 412, 'https://instagram.com/diego.cdmx', TRUE, '2026-03-18T20:00:00Z'),
  (17, 8, '@diegoreyes.mx', 'diego reyes', 'taco reviews that get too emotional | CDMX life | español & english', 84200, 920, 318, 'https://tiktok.com/@diegoreyes.mx', TRUE, '2026-03-19T09:00:00Z'),
  (17, 7, 'DiegoCDMX', 'Diego Reyes', 'Long-form street food documentaries from Mexico City and beyond.', 22100, NULL, 67, 'https://youtube.com/@DiegoCDMX', TRUE, '2026-03-12T15:00:00Z');

-- Fatima Zahra (id=18): Twitter(50), Instagram(51)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (18, 3, '@fatima_zahra_ma', 'Fatima Zahra', 'Poète | Casablanca | أكتب بالعربية والفرنسية', 2841, 1203, 3412, 'https://twitter.com/fatima_zahra_ma', FALSE, '2024-02-14T11:00:00Z'),
  (18, 1, '@fatima.zahra.art', 'Fatima Zahra', 'الخط | الشعر | المغرب 🇲🇦 / calligraphy · poetry · Morocco', 5102, 934, 187, 'https://instagram.com/fatima.zahra.art', FALSE, '2024-01-28T18:00:00Z');

-- Tobias Roth (id=19): Reddit(52), YouTube(53), LinkedIn(54)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (19, 4, 'tobias_roth_dev', 'tobias_roth_dev', 'open source | rust | nix | the terminal is a lifestyle choice', 3102, NULL, 6841, 'https://reddit.com/u/tobias_roth_dev', TRUE, '2026-03-18T23:00:00Z'),
  (19, 7, 'TobiasRothDev', 'Tobias Roth', 'Engineering deep dives: compilers, package managers, and things that should be simpler.', 18400, NULL, 43, 'https://youtube.com/@TobiasRothDev', TRUE, '2026-03-14T16:00:00Z'),
  (19, 6, 'Tobias Roth', 'Tobias Roth', 'Senior Software Engineer | Hamburg | Open Source Maintainer', 5203, 1840, 61, 'https://linkedin.com/in/tobiasroth', TRUE, '2026-03-10T09:00:00Z');

-- Natasha Voronova (id=20): Instagram(55), Pinterest(56)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (20, 1, '@natasha.botanica', 'Natasha Voronova', 'Botanical illustration | watercolour | SPb 🌿', 9830, 2103, 312, 'https://instagram.com/natasha.botanica', FALSE, '2023-11-04T14:00:00Z'),
  (20, 9, 'natashabotanica', 'Natasha Voronova', 'Botanical art, vintage illustration references, and pressed flower collections.', 21400, NULL, 1203, 'https://pinterest.com/natashabotanica', FALSE, '2023-10-18T10:00:00Z');

-- Jake Morrison (id=21): Facebook(57), Twitter(58), LinkedIn(59)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (21, 2, 'Jake Morrison Chicago', 'Jake Morrison', NULL, 512, 489, 203, 'https://facebook.com/jakemorisonchicago', FALSE, '2022-10-14T19:00:00Z'),
  (21, 3, '@jake_morrison_chi', 'Jake Morrison', 'Marketing | Chicago | Bears fan | occasional LinkedIn migrant', 1203, 2841, 4102, 'https://twitter.com/jake_morrison_chi', FALSE, '2022-09-30T12:00:00Z'),
  (21, 6, 'Jake Morrison', 'Jake Morrison', 'Marketing Manager | Chicago | Open to opportunities', 3402, 1203, 47, 'https://linkedin.com/in/jakemorisonchi', FALSE, '2022-11-01T10:00:00Z');

-- Amara Osei (id=22): Twitter(60), Instagram(61)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (22, 3, '@amara_osei', 'Amara Osei', 'Accra | writing about tech, culture, and the gap between them', 4102, 1830, 5203, 'https://twitter.com/amara_osei', FALSE, '2024-05-21T10:00:00Z'),
  (22, 1, '@amaraosei.gh', 'Amara Osei', 'Accra 🇬🇭 | words and images | mostly quiet now', 6830, 1204, 241, 'https://instagram.com/amaraosei.gh', FALSE, '2024-04-30T18:00:00Z');

-- Tomás García (id=23): Instagram(62), YouTube(63), TikTok(64)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (23, 1, '@tomas.garcia.film', 'Tomás García', 'Cinematographer | Madrid 🎬 | BTS and short films', 14300, 2103, 387, 'https://instagram.com/tomas.garcia.film', TRUE, '2026-03-18T19:00:00Z'),
  (23, 7, 'TomasGarciaFilm', 'Tomás García', 'Short documentaries and cinematography breakdowns. Madrid-based.', 34100, NULL, 89, 'https://youtube.com/@TomasGarciaFilm', TRUE, '2026-03-15T14:00:00Z'),
  (23, 8, '@tomasgarcia.film', 'tomás garcía', 'detrás de cámara | Madrid | cine en 60 segundos', 47800, 1203, 201, 'https://tiktok.com/@tomasgarcia.film', TRUE, '2026-03-19T08:00:00Z');

-- Chloe Dupont (id=24): Instagram(65), Pinterest(66)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (24, 1, '@chloe.dupont.paris', 'Chloé Dupont', 'Paris | intérieurs | lumière naturelle | en pause', 8102, 1840, 214, 'https://instagram.com/chloe.dupont.paris', FALSE, '2023-11-30T09:00:00Z'),
  (24, 9, 'chloedupontparis', 'Chloé Dupont', 'French interiors, vintage markets, and quiet Parisian corners.', 18300, NULL, 932, 'https://pinterest.com/chloedupontparis', FALSE, '2023-10-22T14:00:00Z');

-- Riku Mäkinen (id=25): Facebook(67), LinkedIn(68)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (25, 2, 'Riku Mäkinen', 'Riku Mäkinen', NULL, 312, 408, 91, 'https://facebook.com/rikumakinen', FALSE, '2023-08-14T11:00:00Z'),
  (25, 6, 'Riku Mäkinen', 'Riku Mäkinen', 'Project Manager | Helsinki | Agile | SaaS', 1840, 920, 29, 'https://linkedin.com/in/rikumakinen', FALSE, '2023-09-20T10:00:00Z');

-- Elena Vasilieva (id=26): Instagram(69), TikTok(70), Pinterest(71)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (26, 1, '@elena.patterns', 'Elena Vasilieva', 'Pattern designer | watercolour | Saint Petersburg 🌸', 22400, 3102, 518, 'https://instagram.com/elena.patterns', TRUE, '2026-03-18T20:00:00Z'),
  (26, 8, '@elenapatterns', 'elena vasilieva', 'pattern design process | sketchbook tours | colour theory', 61300, 1203, 294, 'https://tiktok.com/@elenapatterns', TRUE, '2026-03-19T07:00:00Z'),
  (26, 9, 'elenapatterns', 'Elena Vasilieva', 'Surface pattern design, botanical prints, and colour palette inspiration.', 34100, NULL, 1841, 'https://pinterest.com/elenapatterns', TRUE, '2026-03-17T11:00:00Z');

-- ============================================================
-- BATCH 3 — Persons 27–36  (profiles 72–95)
-- ============================================================

INSERT INTO persons (full_name, birth_date, is_deceased, death_date, location, avatar_url, digital_status, archived_at, notes) VALUES
  ('Ben Okonkwo',       '1992-04-05', FALSE, NULL, 'Nairobi, Kenya',           'https://api.dicebear.com/7.x/personas/svg?seed=BenOkonkwo',      'absent', '2024-06-10T09:00:00Z', 'Twitter and Facebook silent since mid-2024. Was vocal on tech and startup culture in East Africa.'),
  ('Hana Kim',          '1998-10-21', FALSE, NULL, 'Seoul, South Korea',       'https://api.dicebear.com/7.x/personas/svg?seed=HanaKim',         'active', '2025-09-03T06:00:00Z', 'K-beauty and skincare creator. Meticulous review style and large international following.'),
  ('Lars Holm',         '1984-02-17', FALSE, NULL, 'Oslo, Norway',             'https://api.dicebear.com/7.x/personas/svg?seed=LarsHolm',        'absent', '2023-10-14T12:00:00Z', 'Facebook and LinkedIn last updated 2022. Former teacher. No contact since.'),
  ('Isabela Santos',    '1998-08-29', FALSE, NULL, 'Rio de Janeiro, Brazil',   'https://api.dicebear.com/7.x/personas/svg?seed=IsabelaSantos',   'active', '2025-11-17T08:00:00Z', 'Dance and lifestyle creator. Posts choreography videos and Rio city content.'),
  ('Dmitri Ostrovsky',  '1989-03-12', FALSE, NULL, 'Kyiv, Ukraine',            'https://api.dicebear.com/7.x/personas/svg?seed=DmitriOstrovsky', 'absent', '2024-02-28T10:00:00Z', 'Facebook dormant since 2023. Twitter inactive. Previously shared photography from Kyiv.'),
  ('Nadia Hassan',      '1993-12-09', FALSE, NULL, 'Cairo, Egypt',             'https://api.dicebear.com/7.x/personas/svg?seed=NadiaHassan',     'absent', '2024-05-01T11:00:00Z', 'Instagram and Facebook quiet since early 2024. Ran a small Cairo food account.'),
  ('Tom Nakamura',      '1986-06-14', FALSE, NULL, 'Osaka, Japan',             'https://api.dicebear.com/7.x/personas/svg?seed=TomNakamura',     'absent', '2023-08-22T14:00:00Z', 'Twitter and Reddit silent since mid-2023. Used to post about urban cycling and Osaka ramen.'),
  ('Petra Novák',       '1997-01-30', FALSE, NULL, 'Prague, Czech Republic',   'https://api.dicebear.com/7.x/personas/svg?seed=PetraNovak',      'active', '2025-12-05T09:00:00Z', 'Vintage fashion reseller and thrift store hunter. Runs a popular Instagram and TikTok.'),
  ('Samuel Adesanya',   '1991-09-08', FALSE, NULL, 'Lagos, Nigeria',           'https://api.dicebear.com/7.x/personas/svg?seed=SamuelAdesanya',  'absent', '2024-01-15T10:00:00Z', 'Twitter and Facebook last active late 2023. Former marketing consultant.'),
  ('Giulia Romano',     '1996-05-22', FALSE, NULL, 'Rome, Italy',              'https://api.dicebear.com/7.x/personas/svg?seed=GiuliaRomano',    'active', '2025-08-30T07:00:00Z', 'Food and travel creator based in Rome. Known for incredibly detailed recipe breakdowns.');

-- Ben Okonkwo (id=27): Twitter(72), Facebook(73)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (27, 3, '@ben_okonkwo', 'Ben Okonkwo', 'Nairobi | Tech | Startups | African internet is the future', 6103, 2840, 7201, 'https://twitter.com/ben_okonkwo', FALSE, '2024-04-10T11:00:00Z'),
  (27, 2, 'Ben Okonkwo', 'Ben Okonkwo', 'Tech enthusiast | Nairobi | connecting dots across East Africa.', 1203, 890, 312, 'https://facebook.com/benokonkwo', FALSE, '2024-03-28T09:00:00Z');

-- Hana Kim (id=28): Instagram(74), TikTok(75), YouTube(76)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (28, 1, '@hana.glow.kr', 'Hana Kim', '🌸 K-beauty | skincare | Seoul | honest reviews only', 48200, 2103, 712, 'https://instagram.com/hana.glow.kr', TRUE, '2026-03-19T07:00:00Z'),
  (28, 8, '@hanaglow', 'hana kim', 'skincare routines | ingredient breakdowns | no filter, no filter', 134000, 1840, 489, 'https://tiktok.com/@hanaglow', TRUE, '2026-03-19T10:00:00Z'),
  (28, 7, 'HanaGlowKR', 'Hana Kim', 'In-depth K-beauty reviews and 10-step skincare guides. Seoul-based.', 52100, NULL, 143, 'https://youtube.com/@HanaGlowKR', TRUE, '2026-03-16T14:00:00Z');

-- Lars Holm (id=29): Facebook(77), LinkedIn(78)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (29, 2, 'Lars Holm Oslo', 'Lars Holm', NULL, 412, 380, 134, 'https://facebook.com/larshelmoslo', FALSE, '2022-11-20T18:00:00Z'),
  (29, 6, 'Lars Holm', 'Lars Holm', 'Upper Secondary Teacher | Oslo | History & Social Studies', 312, 489, 18, 'https://linkedin.com/in/larshelmoslo', FALSE, '2022-10-08T10:00:00Z');

-- Isabela Santos (id=30): Instagram(79), TikTok(80), Facebook(81)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (30, 1, '@isabela.rio', 'Isabela Santos', '💃 Rio de Janeiro | dança | sol | vida', 38400, 2103, 612, 'https://instagram.com/isabela.rio', TRUE, '2026-03-18T22:00:00Z'),
  (30, 8, '@isabelarios', 'isabela santos', 'choreography | beach life | rio na veia 🇧🇷', 102000, 1203, 412, 'https://tiktok.com/@isabelarios', TRUE, '2026-03-19T09:00:00Z'),
  (30, 2, 'Isabela Santos Rio', 'Isabela Santos', 'Dança, praia, e a vida carioca. 🌊', 8102, 3401, 812, 'https://facebook.com/isabelasantosrio', TRUE, '2026-03-10T16:00:00Z');

-- Dmitri Ostrovsky (id=31): Facebook(82), Twitter(83)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (31, 2, 'Dmitri Ostrovsky', 'Dmitri Ostrovsky', NULL, 634, 501, 289, 'https://facebook.com/dmitriostrovsky', FALSE, '2023-10-14T12:00:00Z'),
  (31, 3, '@d_ostrovsky_kyiv', 'Dmitri Ostrovsky', 'Kyiv | urban photography | the city keeps changing', 2103, 1840, 3412, 'https://twitter.com/d_ostrovsky_kyiv', FALSE, '2023-09-20T10:00:00Z');

-- Nadia Hassan (id=32): Instagram(84), Facebook(85)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (32, 1, '@nadia.eats.cairo', 'Nadia Hassan', '🍽 Cairo food spots | أكل | سفر | طبخ', 11200, 2840, 301, 'https://instagram.com/nadia.eats.cairo', FALSE, '2024-02-18T14:00:00Z'),
  (32, 2, 'Nadia Hassan', 'Nadia Hassan', 'Cairo | food | family | little moments.', 2103, 1840, 412, 'https://facebook.com/nadiahassan.cairo', FALSE, '2024-01-30T11:00:00Z');

-- Tom Nakamura (id=33): Twitter(86), Reddit(87)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (33, 3, '@tom_nak_osaka', 'Tom Nakamura', '大阪 | 自転車 | ラーメン | EN/JP | Osaka cycling & ramen nerd', 3102, 2840, 6203, 'https://twitter.com/tom_nak_osaka', FALSE, '2023-06-12T21:00:00Z'),
  (33, 4, 'tom_nak_osaka', 'tom_nak_osaka', 'ramen rankings | osaka cycling routes | occasional rants about city planning', 1840, NULL, 4102, 'https://reddit.com/u/tom_nak_osaka', FALSE, '2023-07-04T18:00:00Z');

-- Petra Novák (id=34): Instagram(88), Pinterest(89), TikTok(90)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (34, 1, '@petra.vintage.prg', 'Petra Novák', '🧵 Vintage finds | Prague thrift | second-hand always first choice', 19300, 3102, 498, 'https://instagram.com/petra.vintage.prg', TRUE, '2026-03-18T18:00:00Z'),
  (34, 9, 'petravintageprague', 'Petra Novák', 'Thrift hauls, vintage lookbooks, and upcycling inspo from Prague.', 28400, NULL, 1203, 'https://pinterest.com/petravintageprague', TRUE, '2026-03-15T12:00:00Z'),
  (34, 8, '@petranovak.vintage', 'petra novák', 'thrift flips | outfit checks | prague vintage scene', 73100, 2103, 341, 'https://tiktok.com/@petranovak.vintage', TRUE, '2026-03-19T08:00:00Z');

-- Samuel Adesanya (id=35): Twitter(91), Facebook(92)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (35, 3, '@sam_adesanya', 'Samuel Adesanya', 'Marketing | Lagos | thoughts on brands, culture, and what connects them', 5102, 2840, 7301, 'https://twitter.com/sam_adesanya', FALSE, '2023-10-28T14:00:00Z'),
  (35, 2, 'Samuel Adesanya', 'Samuel Adesanya', 'Marketing professional | Lagos, Nigeria.', 1840, 1203, 312, 'https://facebook.com/samueladesanya', FALSE, '2023-11-10T10:00:00Z');

-- Giulia Romano (id=36): Instagram(93), TikTok(94), YouTube(95)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (36, 1, '@giulia.cucina', 'Giulia Romano', '🍝 Roma | ricette di famiglia | cibo fatto bene', 34100, 2103, 612, 'https://instagram.com/giulia.cucina', TRUE, '2026-03-18T19:00:00Z'),
  (36, 8, '@giuliacucina', 'giulia romano', 'pasta al dente | ricette romane | nonna approved', 89200, 1840, 412, 'https://tiktok.com/@giuliacucina', TRUE, '2026-03-19T09:00:00Z'),
  (36, 7, 'GiuliaCucina', 'Giulia Romano', 'Traditional Roman recipes, market visits, and the philosophy of cooking slowly.', 41300, NULL, 98, 'https://youtube.com/@GiuliaCucina', TRUE, '2026-03-14T15:00:00Z');

-- ============================================================
-- BATCH 4 — Persons 37–46  (profiles 96–118)
-- ============================================================

INSERT INTO persons (full_name, birth_date, is_deceased, death_date, location, avatar_url, digital_status, archived_at, notes) VALUES
  ('Mikkel Andersen',   '1988-07-03', FALSE, NULL, 'Copenhagen, Denmark',      'https://api.dicebear.com/7.x/personas/svg?seed=MikkelAndersen',  'absent', '2024-04-22T10:00:00Z', 'Facebook and LinkedIn dormant since early 2024. Previously worked in sustainable architecture.'),
  ('Aigerim Bekova',    '1995-11-14', FALSE, NULL, 'Almaty, Kazakhstan',       'https://api.dicebear.com/7.x/personas/svg?seed=AigerimBekova',   'absent', '2023-07-30T09:00:00Z', 'Instagram went dark mid-2023. Last post was a mountain hike near Almaty. No explanation given.'),
  ('Patrick O''Brien',  '1982-09-26', FALSE, NULL, 'Dublin, Ireland',          'https://api.dicebear.com/7.x/personas/svg?seed=PatrickOBrien',   'absent', '2023-11-08T13:00:00Z', 'Facebook and Twitter inactive since late 2022. Ran a local GAA supporters page for years.'),
  ('Zoe Papadopoulos',  '1996-03-04', FALSE, NULL, 'Athens, Greece',           'https://api.dicebear.com/7.x/personas/svg?seed=ZoePapadopoulos', 'active', '2025-07-11T08:00:00Z', 'Travel photographer and digital nomad. Currently documenting a year of European slow travel.'),
  ('Leon Fischer',      '1995-04-19', FALSE, NULL, 'Stuttgart, Germany',       'https://api.dicebear.com/7.x/personas/svg?seed=LeonFischer',     'active', '2025-10-02T11:00:00Z', 'Game developer and tech YouTuber. Makes videos about indie game engines and gamedev culture.'),
  ('Léa Martin',        '1993-08-07', FALSE, NULL, 'Bordeaux, France',         'https://api.dicebear.com/7.x/personas/svg?seed=LeaMartin',       'absent', '2024-03-14T10:00:00Z', 'Instagram and Pinterest quiet since early 2024. Previously ran a wine and lifestyle account from Bordeaux.'),
  ('Rafael Vargas',     '1988-12-15', FALSE, NULL, 'Bogotá, Colombia',         'https://api.dicebear.com/7.x/personas/svg?seed=RafaelVargas',    'absent', '2024-06-20T09:00:00Z', 'Facebook and Twitter last active mid-2024. Covered Colombian music and culture.'),
  ('Anya Kowalski',     '1997-06-11', FALSE, NULL, 'Warsaw, Poland',           'https://api.dicebear.com/7.x/personas/svg?seed=AnyaKowalski',    'active', '2025-09-25T07:00:00Z', 'Fitness and wellness creator. Very consistent posting schedule and high engagement rate.'),
  ('Jae-won Park',      '1991-02-28', FALSE, NULL, 'Busan, South Korea',       'https://api.dicebear.com/7.x/personas/svg?seed=JaewonPark',      'absent', '2023-12-01T14:00:00Z', 'YouTube and Twitter silent since late 2023. Produced guitar covers and music theory breakdowns.'),
  ('Valentina Cruz',    '1994-10-17', FALSE, NULL, 'Buenos Aires, Argentina',  'https://api.dicebear.com/7.x/personas/svg?seed=ValentinaCruz',   'active', '2025-06-08T08:00:00Z', 'Architecture student turned urban sketcher. Documents Buenos Aires street life in ink and watercolour.');

-- Mikkel Andersen (id=37): Facebook(96), LinkedIn(97)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (37, 2, 'Mikkel Andersen CPH', 'Mikkel Andersen', NULL, 512, 480, 203, 'https://facebook.com/mikkelanderscph', FALSE, '2024-01-12T10:00:00Z'),
  (37, 6, 'Mikkel Andersen', 'Mikkel Andersen', 'Architect | Copenhagen | Sustainable Design | LEED AP', 2103, 1840, 42, 'https://linkedin.com/in/mikkelanderscph', FALSE, '2024-02-20T09:00:00Z');

-- Aigerim Bekova (id=38): Instagram(98)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (38, 1, '@aigerim.almaty', 'Aigerim Bekova', '🏔 Almaty | hiking | горы | nature photography', 7830, 2103, 312, 'https://instagram.com/aigerim.almaty', FALSE, '2023-06-18T16:00:00Z');

-- Patrick O'Brien (id=39): Facebook(99), Twitter(100)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (39, 2, 'Patrick O''Brien Dublin', 'Patrick O''Brien', 'Dublin | GAA | rugby | all-weather football man', 1203, 1102, 512, 'https://facebook.com/patrickobriendublin', FALSE, '2022-10-30T19:00:00Z'),
  (39, 3, '@patobrien_dub', 'Patrick O''Brien', 'Dublin GAA | 1916 | hurling weather year-round | Up the Dubs', 2840, 3102, 8412, 'https://twitter.com/patobrien_dub', FALSE, '2022-09-14T20:00:00Z');

-- Zoe Papadopoulos (id=40): Instagram(101), Pinterest(102), TikTok(103)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (40, 1, '@zoe.slowtravel', 'Zoe Papadopoulos', '📸 Slow travel | Athens → everywhere | film + digital', 24100, 2840, 534, 'https://instagram.com/zoe.slowtravel', TRUE, '2026-03-18T17:00:00Z'),
  (40, 9, 'zoeslowtravel', 'Zoe Papadopoulos', 'European slow travel itineraries, hidden towns, and train journey guides.', 18300, NULL, 1102, 'https://pinterest.com/zoeslowtravel', TRUE, '2026-03-12T11:00:00Z'),
  (40, 8, '@zoeslowtravel', 'zoe papadopoulos', 'slow travel > fast tourism | europe by train | no rush', 48900, 1840, 287, 'https://tiktok.com/@zoeslowtravel', TRUE, '2026-03-19T08:00:00Z');

-- Leon Fischer (id=41): YouTube(104), Reddit(105), Twitter(106)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (41, 7, 'LeonFischerDev', 'Leon Fischer', 'Indie game engines, gamedev culture, and the occasional devlog. Stuttgart-based.', 28400, NULL, 87, 'https://youtube.com/@LeonFischerDev', TRUE, '2026-03-15T16:00:00Z'),
  (41, 4, 'leon_fischer_dev', 'leon_fischer_dev', 'gamedev | unity hater turned godot enjoyer | Stuttgart | will argue about ECS', 4102, NULL, 8203, 'https://reddit.com/u/leon_fischer_dev', TRUE, '2026-03-18T23:00:00Z'),
  (41, 3, '@leon_fischer', 'Leon Fischer', 'Making games and complaining about game engines. Both are going fine.', 6830, 2103, 5102, 'https://twitter.com/leon_fischer', TRUE, '2026-03-17T21:00:00Z');

-- Léa Martin (id=42): Instagram(107), Pinterest(108)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (42, 1, '@lea.bordeaux.life', 'Léa Martin', '🍷 Bordeaux | vins | terroir | momentanément absente', 12400, 2840, 312, 'https://instagram.com/lea.bordeaux.life', FALSE, '2024-01-20T10:00:00Z'),
  (42, 9, 'leaborderauxlife', 'Léa Martin', 'Wine country lifestyle, Bordeaux cellars, and French countryside inspiration.', 24100, NULL, 892, 'https://pinterest.com/leabordeauxlife', FALSE, '2023-12-18T14:00:00Z');

-- Rafael Vargas (id=43): Facebook(109), Twitter(110)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (43, 2, 'Rafael Vargas Bogotá', 'Rafael Vargas', 'Bogotá | música | cultura | buenas vibras', 3102, 2840, 512, 'https://facebook.com/rafaelvargasbogota', FALSE, '2024-04-10T16:00:00Z'),
  (43, 3, '@rafael_vargas_co', 'Rafael Vargas', 'Bogotá | cumbia | salsa | música colombiana | cultura popular', 5830, 3102, 6201, 'https://twitter.com/rafael_vargas_co', FALSE, '2024-05-22T14:00:00Z');

-- Anya Kowalski (id=44): Instagram(111), TikTok(112), YouTube(113)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (44, 1, '@anya.fit.warsaw', 'Anya Kowalski', '💪 Fitness | wellness | Warsaw | she/her | lifting things and putting them down', 31200, 2840, 712, 'https://instagram.com/anya.fit.warsaw', TRUE, '2026-03-19T06:00:00Z'),
  (44, 8, '@anyakowalski.fit', 'anya kowalski', 'workout routines | meal prep | life in warsaw | no toxic positivity', 87400, 2103, 512, 'https://tiktok.com/@anyakowalski.fit', TRUE, '2026-03-19T07:00:00Z'),
  (44, 7, 'AnyaFitWarsaw', 'Anya Kowalski', 'Full fitness programmes, nutrition guides, and training diaries from Warsaw.', 24100, NULL, 112, 'https://youtube.com/@AnyaFitWarsaw', TRUE, '2026-03-14T12:00:00Z');

-- Jae-won Park (id=45): YouTube(114), Twitter(115)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (45, 7, 'JaewonGuitar', 'Jae-won Park', 'Guitar covers, music theory deep dives, and Busan music scene coverage.', 18400, NULL, 94, 'https://youtube.com/@JaewonGuitar', FALSE, '2023-09-20T17:00:00Z'),
  (45, 3, '@jaewon_guitar', 'Jae-won Park', '🎸 Busan | guitar | music theory | 재원', 3102, 2840, 4201, 'https://twitter.com/jaewon_guitar', FALSE, '2023-10-14T20:00:00Z');

-- Valentina Cruz (id=46): Instagram(116), TikTok(117), Facebook(118)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (46, 1, '@valentina.sketches', 'Valentina Cruz', '✏️ Urban sketching | Buenos Aires | arquitectura en tinta', 17800, 2103, 487, 'https://instagram.com/valentina.sketches', TRUE, '2026-03-18T20:00:00Z'),
  (46, 8, '@valentinasketches', 'valentina cruz', 'dibujando buenos aires | sketchbook tours | tinta y acuarela', 43200, 1840, 312, 'https://tiktok.com/@valentinasketches', TRUE, '2026-03-19T08:00:00Z'),
  (46, 2, 'Valentina Cruz Sketches', 'Valentina Cruz', 'Arquitectura, sketchbooks, y la ciudad de Buenos Aires. 🎨', 6102, 3840, 412, 'https://facebook.com/valentinacruzsketches', TRUE, '2026-03-10T14:00:00Z');

-- ============================================================
-- BATCH 5 — Persons 47–56  (profiles 119–146)
-- ============================================================

INSERT INTO persons (full_name, birth_date, is_deceased, death_date, location, avatar_url, digital_status, archived_at, notes) VALUES
  ('Niall Fitzpatrick',  '1986-04-12', FALSE, NULL, 'Cork, Ireland',            'https://api.dicebear.com/7.x/personas/svg?seed=NiallFitzpatrick', 'absent', '2024-02-10T12:00:00Z', 'Facebook and Reddit quiet since early 2024. Was active in Cork local history groups and r/ireland.'),
  ('Olivia Chen',        '1997-01-25', FALSE, NULL, 'Vancouver, Canada',        'https://api.dicebear.com/7.x/personas/svg?seed=OliviaChen',       'active', '2025-08-19T07:00:00Z', 'UX researcher and design educator. Shares accessible design resources and career advice.'),
  ('Finn Larsen',        '1994-08-03', FALSE, NULL, 'Bergen, Norway',           'https://api.dicebear.com/7.x/personas/svg?seed=FinnLarsen',       'active', '2025-11-30T09:00:00Z', 'Outdoor and hiking YouTuber. Covers Norwegian fjords, wild camping, and gear reviews.'),
  ('Kenji Watanabe',     '1992-03-17', FALSE, NULL, 'Tokyo, Japan',             'https://api.dicebear.com/7.x/personas/svg?seed=KenjiWatanabe',    'active', '2025-09-14T06:00:00Z', 'Jazz musician and music producer. Maintains a dedicated following across music communities.'),
  ('Amira Khalid',       '1998-06-29', FALSE, NULL, 'Tunis, Tunisia',           'https://api.dicebear.com/7.x/personas/svg?seed=AmiraKhalid',      'active', '2025-10-07T08:00:00Z', 'Art and fashion creator bridging North African heritage with contemporary aesthetics.'),
  ('Noah Johansson',     '1991-10-08', FALSE, NULL, 'Malmö, Sweden',            'https://api.dicebear.com/7.x/personas/svg?seed=NoahJohansson',    'active', '2025-07-22T10:00:00Z', 'Data engineer and occasional blogger. Writes about distributed systems and Swedish tech culture.'),
  ('Valentina Greco',    '1999-02-14', FALSE, NULL, 'Milan, Italy',             'https://api.dicebear.com/7.x/personas/svg?seed=ValentinaGreco',   'active', '2025-12-01T08:00:00Z', 'Fashion and lifestyle creator based in Milan. Known for elegant aesthetic and styling content.'),
  ('Felix Müller',       '1994-07-31', FALSE, NULL, 'Vienna, Austria',          'https://api.dicebear.com/7.x/personas/svg?seed=FelixMuller',      'active', '2025-06-18T11:00:00Z', 'Retro computing enthusiast and YouTuber. Restores vintage hardware and explains computer history.'),
  ('Grace Owusu',        '1997-09-05', FALSE, NULL, 'Accra, Ghana',             'https://api.dicebear.com/7.x/personas/svg?seed=GraceOwusu',       'active', '2025-11-11T07:00:00Z', 'Tech journalist and podcast host covering African tech ecosystems and startup culture.'),
  ('Ivan Petrov',        '1990-05-22', FALSE, NULL, 'Moscow, Russia',           'https://api.dicebear.com/7.x/personas/svg?seed=IvanPetrov',       'active', '2025-08-04T10:00:00Z', 'Documentary filmmaker and cinematographer. Posts work-in-progress footage and film theory essays.');

-- Niall Fitzpatrick (id=47): Facebook(119), Reddit(120)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (47, 2, 'Niall Fitzpatrick Cork', 'Niall Fitzpatrick', 'Cork lad | history buff | supporter of things that are grand', 892, 780, 412, 'https://facebook.com/niallfitzpatrickcork', FALSE, '2023-12-20T18:00:00Z'),
  (47, 4, 'niall_fitzpatrick_cork', 'niall_fitzpatrick_cork', 'Cork history | r/ireland regular | tea opinions | slowly going offline', 1203, NULL, 3102, 'https://reddit.com/u/niall_fitzpatrick_cork', FALSE, '2024-01-08T21:00:00Z');

-- Olivia Chen (id=48): Instagram(121), LinkedIn(122), Pinterest(123)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (48, 1, '@olivia.ux.van', 'Olivia Chen', '🖥 UX researcher | Vancouver | making things accessible for everyone', 14200, 2103, 412, 'https://instagram.com/olivia.ux.van', TRUE, '2026-03-18T18:00:00Z'),
  (48, 6, 'Olivia Chen', 'Olivia Chen', 'Senior UX Researcher | Vancouver | Accessibility Advocate | Design Educator', 8102, 3840, 143, 'https://linkedin.com/in/oliviachen', TRUE, '2026-03-17T09:00:00Z'),
  (48, 9, 'oliviachenuх', 'Olivia Chen', 'UX resources, accessible design patterns, and inclusive research methods.', 11200, NULL, 714, 'https://pinterest.com/oliviachenux', TRUE, '2026-03-12T14:00:00Z');

-- Finn Larsen (id=49): Reddit(124), YouTube(125), Twitter(126)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (49, 4, 'finn_larsen_outdoors', 'finn_larsen_outdoors', 'Bergen | hiking | fjords | wild camping | gear recommendations nobody asked for', 3102, NULL, 5812, 'https://reddit.com/u/finn_larsen_outdoors', TRUE, '2026-03-18T20:00:00Z'),
  (49, 7, 'FinnLarsenOutdoors', 'Finn Larsen', 'Norwegian hiking, fjord camping, and honest gear reviews. Bergen-based.', 38400, NULL, 94, 'https://youtube.com/@FinnLarsenOutdoors', TRUE, '2026-03-16T14:00:00Z'),
  (49, 3, '@finn_larsen', 'Finn Larsen', 'Bergen | hiking | fjords | occasionally complaining about Norwegian weather', 6103, 2840, 4102, 'https://twitter.com/finn_larsen', TRUE, '2026-03-17T18:00:00Z');

-- Kenji Watanabe (id=50): Twitter(127), YouTube(128), Reddit(129)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (50, 3, '@kenji_jazz', 'Kenji Watanabe', '🎷 Jazz | Tokyo | music production | 渡辺健司', 8102, 4203, 9301, 'https://twitter.com/kenji_jazz', TRUE, '2026-03-18T22:00:00Z'),
  (50, 7, 'KenjiWatanabeJazz', 'Kenji Watanabe', 'Jazz performance, music production tutorials, and Tokyo session culture.', 24100, NULL, 67, 'https://youtube.com/@KenjiWatanabeJazz', TRUE, '2026-03-14T16:00:00Z'),
  (50, 4, 'kenji_jazz_tokyo', 'kenji_jazz_tokyo', 'jazz | production | gear | occasionally too much theory | Tokyo', 2840, NULL, 4102, 'https://reddit.com/u/kenji_jazz_tokyo', TRUE, '2026-03-18T21:00:00Z');

-- Amira Khalid (id=51): Instagram(130), TikTok(131)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (51, 1, '@amira.khalid.art', 'Amira Khalid', '🎨 Art | fashion | Tunis → everywhere | الفن يجمعنا', 28400, 3102, 512, 'https://instagram.com/amira.khalid.art', TRUE, '2026-03-18T19:00:00Z'),
  (51, 8, '@amirakhalid', 'amira khalid', 'fashion heritage | north african aesthetics | art that crosses borders', 71200, 2103, 389, 'https://tiktok.com/@amirakhalid', TRUE, '2026-03-19T08:00:00Z');

-- Noah Johansson (id=52): LinkedIn(132), Reddit(133), Twitter(134)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (52, 6, 'Noah Johansson', 'Noah Johansson', 'Data Engineer | Malmö | Distributed Systems | Occasionally Blogs', 6103, 3840, 89, 'https://linkedin.com/in/noahjohansson', TRUE, '2026-03-18T09:00:00Z'),
  (52, 4, 'noah_johansson_data', 'noah_johansson_data', 'data engineering | kafka | spark | malmö | swede abroad in his own country', 2840, NULL, 5102, 'https://reddit.com/u/noah_johansson_data', TRUE, '2026-03-18T22:00:00Z'),
  (52, 3, '@noah_johansson', 'Noah Johansson', 'Data engineering takes | distributed systems | Malmö | probably too online', 4102, 2840, 6203, 'https://twitter.com/noah_johansson', TRUE, '2026-03-17T19:00:00Z');

-- Valentina Greco (id=53): Instagram(135), TikTok(136), Pinterest(137)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (53, 1, '@valentina.greco.style', 'Valentina Greco', '✨ Fashion | Milano | eleganza italiana | she/her', 42100, 3102, 612, 'https://instagram.com/valentina.greco.style', TRUE, '2026-03-19T09:00:00Z'),
  (53, 8, '@valentinagreco', 'valentina greco', 'milan fashion week bts | outfit checks | la moda secondo me', 98300, 2103, 489, 'https://tiktok.com/@valentinagreco', TRUE, '2026-03-19T10:00:00Z'),
  (53, 9, 'valentinagrecomilano', 'Valentina Greco', 'Italian fashion, Milanese style, and seasonal wardrobe curation.', 31200, NULL, 1412, 'https://pinterest.com/valentinagrecomilano', TRUE, '2026-03-15T12:00:00Z');

-- Felix Müller (id=54): YouTube(138), Reddit(139), Twitter(140)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (54, 7, 'FelixMullerRetro', 'Felix Müller', 'Restoring vintage computers and explaining the history of computing. Vienna-based.', 32100, NULL, 78, 'https://youtube.com/@FelixMullerRetro', TRUE, '2026-03-15T16:00:00Z'),
  (54, 4, 'felix_retro_wien', 'felix_retro_wien', 'vintage computing | C64 | Amiga | Vienna | the past was weirder than you remember', 4102, NULL, 6830, 'https://reddit.com/u/felix_retro_wien', TRUE, '2026-03-18T23:00:00Z'),
  (54, 3, '@felix_retro', 'Felix Müller', 'Vintage hardware, retro computing history, and Vienna. In that order.', 8102, 3102, 5203, 'https://twitter.com/felix_retro', TRUE, '2026-03-17T20:00:00Z');

-- Grace Owusu (id=55): Twitter(141), Instagram(142), TikTok(143)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (55, 3, '@grace_owusu', 'Grace Owusu', 'Tech journalism | African startups | Accra | podcast host | amplifying African tech', 18400, 4102, 9201, 'https://twitter.com/grace_owusu', TRUE, '2026-03-19T07:00:00Z'),
  (55, 1, '@graceowusu.tech', 'Grace Owusu', '🇬🇭 Tech journalist | Accra | covering Africa''s startup scene', 14200, 3102, 412, 'https://instagram.com/graceowusu.tech', TRUE, '2026-03-18T18:00:00Z'),
  (55, 8, '@graceowusu', 'grace owusu', 'african tech news | startup stories | accra | the continent is building', 38400, 2103, 301, 'https://tiktok.com/@graceowusu', TRUE, '2026-03-19T09:00:00Z');

-- Ivan Petrov (id=56): YouTube(144), Reddit(145), Twitter(146)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (56, 7, 'IvanPetrovFilm', 'Ivan Petrov', 'Documentary filmmaking essays, cinematography breakdowns, and works in progress.', 21400, NULL, 54, 'https://youtube.com/@IvanPetrovFilm', TRUE, '2026-03-14T15:00:00Z'),
  (56, 4, 'ivan_petrov_film', 'ivan_petrov_film', 'documentary | film theory | Moscow | asking questions nobody wanted asked', 3102, NULL, 5830, 'https://reddit.com/u/ivan_petrov_film', TRUE, '2026-03-18T21:00:00Z'),
  (56, 3, '@ivan_petrov_doc', 'Ivan Petrov', 'Documentary filmmaker | Moscow | cinema that does not look away', 9102, 3840, 6201, 'https://twitter.com/ivan_petrov_doc', TRUE, '2026-03-17T19:00:00Z');

-- ============================================================
-- BATCH 6 — Persons 57–66  (profiles 147–173)
-- ============================================================

INSERT INTO persons (full_name, birth_date, is_deceased, death_date, location, avatar_url, digital_status, archived_at, notes) VALUES
  ('Emre Yilmaz',       '1996-02-08', FALSE, NULL, 'Istanbul, Turkey',         'https://api.dicebear.com/7.x/personas/svg?seed=EmreYilmaz',      'active', '2025-09-20T08:00:00Z', 'Street photographer and visual storyteller documenting Istanbul''s contrasting neighbourhoods.'),
  ('Nora Schmidt',       '1995-11-19', FALSE, NULL, 'Zurich, Switzerland',      'https://api.dicebear.com/7.x/personas/svg?seed=NoraSchmidt',      'active', '2025-07-14T10:00:00Z', 'Climate tech investor and writer. Posts research threads and long-form LinkedIn essays.'),
  ('Rohan Mehta',        '1993-06-24', FALSE, NULL, 'Mumbai, India',            'https://api.dicebear.com/7.x/personas/svg?seed=RohanMehta',       'active', '2025-10-08T07:00:00Z', 'Product manager and startup advisor. Very active on Twitter with PM frameworks and India tech commentary.'),
  ('Sienna Foster',      '2001-03-15', FALSE, NULL, 'Sydney, Australia',        'https://api.dicebear.com/7.x/personas/svg?seed=SiennaFoster',     'active', '2025-12-19T06:00:00Z', 'Marine biology student and ocean conservation creator. Makes educational short-form content.'),
  ('Omar Khalil',        '1988-08-30', FALSE, NULL, 'Alexandria, Egypt',        'https://api.dicebear.com/7.x/personas/svg?seed=OmarKhalil',       'active', '2025-05-27T09:00:00Z', 'Architecture professor and urban history writer. Long-form YouTube essays on Mediterranean cities.'),
  ('Celine Fontaine',    '1996-04-07', FALSE, NULL, 'Brussels, Belgium',        'https://api.dicebear.com/7.x/personas/svg?seed=CelineFontaine',   'active', '2025-08-03T08:00:00Z', 'Illustrator and children''s book author. Shares her illustration process and studio life in Brussels.'),
  ('Aaron Mitchell',     '1992-12-01', FALSE, NULL, 'New York, USA',            'https://api.dicebear.com/7.x/personas/svg?seed=AaronMitchell',    'active', '2025-11-05T11:00:00Z', 'Journalist and essayist covering culture, media, and the internet. Active across writing communities.'),
  ('Karim Benali',       '1995-07-18', FALSE, NULL, 'Algiers, Algeria',         'https://api.dicebear.com/7.x/personas/svg?seed=KarimBenali',      'active', '2025-09-12T09:00:00Z', 'Comedy creator blending Algerian humour with French internet culture. Large regional following.'),
  ('Anna Lindström',     '1998-01-26', FALSE, NULL, 'Uppsala, Sweden',          'https://api.dicebear.com/7.x/personas/svg?seed=AnnaLindstrom',    'active', '2025-10-30T07:00:00Z', 'Linguistics PhD student and language learning creator. Makes content about Swedish and minority languages.'),
  ('Ravi Kumar',         '1989-09-11', FALSE, NULL, 'Bangalore, India',         'https://api.dicebear.com/7.x/personas/svg?seed=RaviKumar',        'active', '2025-06-25T08:00:00Z', 'Senior engineering manager and technical writer. Covers engineering leadership and India''s tech ecosystem.');

-- Emre Yilmaz (id=57): Instagram(147), TikTok(148), YouTube(149)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (57, 1, '@emre.istanbul', 'Emre Yilmaz', '📸 Istanbul | sokak fotoğrafçılığı | her mahalle farklı bir hikaye', 22400, 3102, 612, 'https://instagram.com/emre.istanbul', TRUE, '2026-03-18T19:00:00Z'),
  (57, 8, '@emreyilmaz.photo', 'emre yilmaz', 'istanbul sokakları | street photography | şehir ve insan', 54200, 2103, 387, 'https://tiktok.com/@emreyilmaz.photo', TRUE, '2026-03-19T09:00:00Z'),
  (57, 7, 'EmreIstanbulPhoto', 'Emre Yilmaz', 'Street photography essays and neighbourhood portraits from Istanbul.', 18400, NULL, 62, 'https://youtube.com/@EmreIstanbulPhoto', TRUE, '2026-03-13T15:00:00Z');

-- Nora Schmidt (id=58): LinkedIn(150), Twitter(151), Instagram(152)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (58, 6, 'Nora Schmidt', 'Nora Schmidt', 'Climate Tech Investor | Zurich | Writing about the energy transition and what it takes', 28400, 4102, 214, 'https://linkedin.com/in/noraschimdt', TRUE, '2026-03-18T10:00:00Z'),
  (58, 3, '@nora_schmidt_ct', 'Nora Schmidt', 'Climate tech | energy transition | Zurich | occasionally wrong but always specific', 14200, 3840, 7203, 'https://twitter.com/nora_schmidt_ct', TRUE, '2026-03-18T21:00:00Z'),
  (58, 1, '@nora.schmidt.zurich', 'Nora Schmidt', '🌱 Climate | Zurich | investing in what comes next', 8102, 2103, 312, 'https://instagram.com/nora.schmidt.zurich', TRUE, '2026-03-17T14:00:00Z');

-- Rohan Mehta (id=59): LinkedIn(153), Reddit(154), Twitter(155)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (59, 6, 'Rohan Mehta', 'Rohan Mehta', 'Group PM | Mumbai | Startup Advisor | Writing about product, India tech, and compounding', 34100, 5102, 312, 'https://linkedin.com/in/rohanmehta', TRUE, '2026-03-18T09:00:00Z'),
  (59, 4, 'rohan_mehta_pm', 'rohan_mehta_pm', 'product management | india tech | mumbai | frameworks that actually work', 6103, NULL, 8201, 'https://reddit.com/u/rohan_mehta_pm', TRUE, '2026-03-18T23:00:00Z'),
  (59, 3, '@rohan_mehta', 'Rohan Mehta', 'Product | Mumbai | India tech | things I have learned the hard way', 24100, 5830, 11203, 'https://twitter.com/rohan_mehta', TRUE, '2026-03-19T07:00:00Z');

-- Sienna Foster (id=60): TikTok(156), Instagram(157), YouTube(158)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (60, 8, '@sienna.ocean', 'sienna foster', 'marine biology | ocean conservation | sydney | saving the reef one tiktok at a time', 84200, 2103, 412, 'https://tiktok.com/@sienna.ocean', TRUE, '2026-03-19T08:00:00Z'),
  (60, 1, '@sienna.ocean.au', 'Sienna Foster', '🌊 Marine biology student | Sydney | ocean conservation | she/her', 31200, 3102, 487, 'https://instagram.com/sienna.ocean.au', TRUE, '2026-03-18T19:00:00Z'),
  (60, 7, 'SiennaOceanAU', 'Sienna Foster', 'Marine biology explainers, reef conservation, and life studying the ocean in Sydney.', 22400, NULL, 54, 'https://youtube.com/@SiennaOceanAU', TRUE, '2026-03-15T13:00:00Z');

-- Omar Khalil (id=61): Facebook(159), YouTube(160)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (61, 2, 'Omar Khalil Architecture', 'Omar Khalil', 'Architecture professor | Alexandria | writing about Mediterranean cities and what they remember.', 8102, 4203, 712, 'https://facebook.com/omarkhalilarch', TRUE, '2026-03-18T14:00:00Z'),
  (61, 7, 'OmarKhalilArch', 'Omar Khalil', 'Long essays on Mediterranean urban history, Ottoman architecture, and cities that accumulate meaning.', 28400, NULL, 67, 'https://youtube.com/@OmarKhalilArch', TRUE, '2026-03-14T16:00:00Z');

-- Celine Fontaine (id=62): Instagram(161), Pinterest(162)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (62, 1, '@celine.illustre', 'Céline Fontaine', '🎨 Illustratrice | Bruxelles | livres pour enfants | studio life', 18400, 2840, 512, 'https://instagram.com/celine.illustre', TRUE, '2026-03-18T20:00:00Z'),
  (62, 9, 'celineillustration', 'Céline Fontaine', 'Children''s book illustration, character design, and Brussels studio inspiration.', 24100, NULL, 1102, 'https://pinterest.com/celineillustration', TRUE, '2026-03-14T12:00:00Z');

-- Aaron Mitchell (id=63): Reddit(163), Twitter(164), YouTube(165)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (63, 4, 'aaron_mitchell_nyc', 'aaron_mitchell_nyc', 'culture | media criticism | internet history | New York | long comments, longer opinions', 5102, NULL, 9201, 'https://reddit.com/u/aaron_mitchell_nyc', TRUE, '2026-03-18T22:00:00Z'),
  (63, 3, '@aaronmitchell', 'Aaron Mitchell', 'Writer | New York | culture, media, and the internet | essays when the words are ready', 22400, 5102, 8301, 'https://twitter.com/aaronmitchell', TRUE, '2026-03-19T07:00:00Z'),
  (63, 7, 'AaronMitchellWrites', 'Aaron Mitchell', 'Video essays on media, internet culture, and the stories we tell about technology.', 34100, NULL, 48, 'https://youtube.com/@AaronMitchellWrites', TRUE, '2026-03-13T15:00:00Z');

-- Karim Benali (id=64): Instagram(166), Facebook(167), TikTok(168)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (64, 1, '@karim.benali.dz', 'Karim Benali', '😂 Alger | humour | sketches | la vie en Algérie', 48200, 3102, 612, 'https://instagram.com/karim.benali.dz', TRUE, '2026-03-18T20:00:00Z'),
  (64, 2, 'Karim Benali Comedy', 'Karim Benali', 'Sketches et humour de la vie quotidienne algérienne. 🇩🇿', 31200, 4102, 1203, 'https://facebook.com/karimbenalicomedy', TRUE, '2026-03-15T16:00:00Z'),
  (64, 8, '@karimbenali', 'karim benali', 'humour algérien | sketches dz | la vraie vie en algérie', 124000, 2103, 489, 'https://tiktok.com/@karimbenali', TRUE, '2026-03-19T10:00:00Z');

-- Anna Lindström (id=65): Instagram(169), TikTok(170)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (65, 1, '@anna.linguistics', 'Anna Lindström', '🗣 Linguistics | Uppsala | learning languages and explaining why they work the way they do', 14200, 2840, 387, 'https://instagram.com/anna.linguistics', TRUE, '2026-03-18T18:00:00Z'),
  (65, 8, '@annalinguistics', 'anna lindström', 'swedish explained | language learning | minority languages deserve love too', 62400, 2103, 412, 'https://tiktok.com/@annalinguistics', TRUE, '2026-03-19T08:00:00Z');

-- Ravi Kumar (id=66): LinkedIn(171), Twitter(172), YouTube(173)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (66, 6, 'Ravi Kumar', 'Ravi Kumar', 'Engineering Manager | Bangalore | Technical Writing | Building teams that build things', 42100, 6103, 312, 'https://linkedin.com/in/ravikumar', TRUE, '2026-03-18T09:00:00Z'),
  (66, 3, '@ravi_kumar_eng', 'Ravi Kumar', 'Engineering leadership | India tech | Bangalore | the management stuff they don''t teach you', 18400, 4102, 8201, 'https://twitter.com/ravi_kumar_eng', TRUE, '2026-03-19T06:00:00Z'),
  (66, 7, 'RaviKumarEng', 'Ravi Kumar', 'Engineering management, technical writing craft, and building teams in India''s tech ecosystem.', 24100, NULL, 58, 'https://youtube.com/@RaviKumarEng', TRUE, '2026-03-14T14:00:00Z');

-- ============================================================
-- EXTRA PLATFORM PROFILES — filling gaps for batches 1–6
-- Profiles 174–185
-- ============================================================

-- Aigerim Bekova (id=38) — adding TikTok(174), Pinterest(175)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (38, 8, '@aigerim.almaty', 'aigerim bekova', 'горы казахстана | nature | hiking | before the silence', 4102, 1203, 89, 'https://tiktok.com/@aigerim.almaty', FALSE, '2023-05-20T14:00:00Z'),
  (38, 9, 'aigerimalmaty', 'Aigerim Bekova', 'Mountain landscapes, wildflower photography, and Kazakh nature.', 9830, NULL, 412, 'https://pinterest.com/aigerimalmaty', FALSE, '2023-04-10T12:00:00Z');

-- Ana Cristina Ferreira (id=9) — adding Pinterest(176)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (9, 9, 'anacristinalx', 'Ana Cristina Ferreira', 'Lisbon light, azulejo patterns, and coastal photography references.', 6102, NULL, 512, 'https://pinterest.com/anacristinalx', FALSE, '2023-11-14T10:00:00Z');

-- Ingrid Svensson (id=11) — adding TikTok(177)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (11, 8, '@ingrid.slow', 'ingrid svensson', 'slow mornings | linen and plants | stockholm light | no rush', 31200, 1840, 201, 'https://tiktok.com/@ingrid.slow', TRUE, '2026-03-18T10:00:00Z');

-- Oliver Bennett (id=14) — adding YouTube(178)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (14, 7, 'OliverBennettMCR', 'Oliver Bennett', 'Manchester indie and post-punk coverage, gig recordings, and local music history.', 3102, NULL, 24, 'https://youtube.com/@OliverBennettMCR', FALSE, '2022-08-14T18:00:00Z');

-- Tom Nakamura (id=33) — adding YouTube(179)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (33, 7, 'TomNakamuraOsaka', 'Tom Nakamura', 'Osaka cycling routes, ramen shop visits, and city cycling infrastructure reviews.', 8102, NULL, 31, 'https://youtube.com/@TomNakamuraOsaka', FALSE, '2023-05-10T16:00:00Z');

-- Samuel Adesanya (id=35) — adding LinkedIn(180)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (35, 6, 'Samuel Adesanya', 'Samuel Adesanya', 'Marketing Consultant | Lagos, Nigeria | Brand Strategy', 3102, 2840, 34, 'https://linkedin.com/in/samueladesanya', FALSE, '2023-09-01T09:00:00Z');

-- Jae-won Park (id=45) — adding Reddit(181)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (45, 4, 'jaewon_guitar_kr', 'jaewon_guitar_kr', 'guitar | jazz theory | Busan music scene | went quiet for a while', 1840, NULL, 3102, 'https://reddit.com/u/jaewon_guitar_kr', FALSE, '2023-08-20T20:00:00Z');

-- Celine Fontaine (id=62) — adding TikTok(182)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (62, 8, '@celineillustre', 'céline fontaine', 'illustration en direct | couleurs et encre | bruxelles | livres pour enfants', 38400, 2103, 212, 'https://tiktok.com/@celineillustre', TRUE, '2026-03-18T20:00:00Z');

-- Anna Lindström (id=65) — adding YouTube(183)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (65, 7, 'AnnaLinguistics', 'Anna Lindström', 'Swedish grammar explained, minority language profiles, and language learning deep dives.', 28400, NULL, 61, 'https://youtube.com/@AnnaLinguistics', TRUE, '2026-03-14T14:00:00Z');

-- Omar Khalil (id=61) — adding LinkedIn(184), Twitter(185)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (61, 6, 'Omar Khalil', 'Omar Khalil', 'Professor of Architecture | Alexandria University | Mediterranean Urban Heritage', 12400, 3840, 89, 'https://linkedin.com/in/omarkhalilarch', TRUE, '2026-03-17T09:00:00Z'),
  (61, 3, '@omar_khalil_arch', 'Omar Khalil', 'Alexandria | architecture | Mediterranean cities | the buildings that outlast the people', 8102, 4102, 6203, 'https://twitter.com/omar_khalil_arch', TRUE, '2026-03-18T18:00:00Z');

-- ============================================================
-- BATCH 7 — Persons 67–76  (profiles 186–212)
-- ============================================================

INSERT INTO persons (full_name, birth_date, is_deceased, death_date, location, avatar_url, digital_status, archived_at, notes) VALUES
  ('Lotte Hansen',      '1997-08-14', FALSE, NULL, 'Odense, Denmark',          'https://api.dicebear.com/7.x/personas/svg?seed=LotteHansen',     'active', '2025-09-08T07:00:00Z', 'Ceramic artist and maker. Documents her studio practice and slow craft process on social media.'),
  ('Marcus Allen',      '1994-05-07', FALSE, NULL, 'Atlanta, USA',             'https://api.dicebear.com/7.x/personas/svg?seed=MarcusAllen',     'active', '2025-11-14T10:00:00Z', 'Hip-hop producer and music journalist. Covers Atlanta''s underground scene and beatmaking culture.'),
  ('Mia Hoffmann',      '2000-01-22', FALSE, NULL, 'Cologne, Germany',         'https://api.dicebear.com/7.x/personas/svg?seed=MiaHoffmann',     'active', '2025-12-10T08:00:00Z', 'Gen Z lifestyle and beauty creator. Known for candid and unfiltered content style.'),
  ('Jamal Williams',    '1991-11-03', FALSE, NULL, 'London, UK',               'https://api.dicebear.com/7.x/personas/svg?seed=JamalWilliams',   'active', '2025-08-22T09:00:00Z', 'Graphic designer and creative director. Posts branding work, typography, and design commentary.'),
  ('Suki Yamamoto',     '1999-06-17', FALSE, NULL, 'Kyoto, Japan',             'https://api.dicebear.com/7.x/personas/svg?seed=SukiYamamoto',    'active', '2025-10-19T06:00:00Z', 'Traditional craft and textile artist. Documents kimono restoration and Kyoto artisan culture.'),
  ('Marcus Schulz',     '1990-02-28', FALSE, NULL, 'Munich, Germany',          'https://api.dicebear.com/7.x/personas/svg?seed=MarcusSchulz',    'absent', '2023-10-05T11:00:00Z', 'LinkedIn and Facebook last active 2022. Former project director at a Munich engineering firm.'),
  ('Bianca Souza',      '1998-04-11', FALSE, NULL, 'Brasília, Brazil',         'https://api.dicebear.com/7.x/personas/svg?seed=BiancaSouza',     'active', '2025-07-30T08:00:00Z', 'Architecture student and urban photography creator. Documents Brasília''s modernist heritage.'),
  ('Hassan Mohamad',    '1990-10-25', FALSE, NULL, 'Beirut, Lebanon',          'https://api.dicebear.com/7.x/personas/svg?seed=HassanMohamad',   'active', '2025-09-01T09:00:00Z', 'Journalist and writer covering Lebanese politics, culture, and the diaspora experience.'),
  ('Maren Kvist',       '1996-12-08', FALSE, NULL, 'Tromsø, Norway',           'https://api.dicebear.com/7.x/personas/svg?seed=MarenKvist',      'active', '2025-11-28T07:00:00Z', 'Northern lights photographer and Arctic travel creator. Based in Tromsø year-round.'),
  ('Alex Tran',         '1997-03-19', FALSE, NULL, 'Ho Chi Minh City, Vietnam','https://api.dicebear.com/7.x/personas/svg?seed=AlexTran',        'active', '2025-10-14T06:00:00Z', 'Street food creator and videographer documenting Vietnamese cuisine from alleyways to fine dining.');

-- Lotte Hansen (id=67): Instagram(186), TikTok(187), Pinterest(188)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (67, 1, '@lotte.ceramics', 'Lotte Hansen', '🏺 Ceramics | Odense | slow craft | everything takes as long as it takes', 16800, 2103, 412, 'https://instagram.com/lotte.ceramics', TRUE, '2026-03-18T18:00:00Z'),
  (67, 8, '@lotteceramics', 'lotte hansen', 'pottery process | clay days | odense studio | the wheel never lies', 42100, 1840, 287, 'https://tiktok.com/@lotteceramics', TRUE, '2026-03-19T08:00:00Z'),
  (67, 9, 'lotteceramicsdk', 'Lotte Hansen', 'Ceramic forms, glaze experiments, and Danish craft studio inspiration.', 22400, NULL, 892, 'https://pinterest.com/lotteceramicsdk', TRUE, '2026-03-15T12:00:00Z');

-- Marcus Allen (id=68): Twitter(189), YouTube(190), Reddit(191)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (68, 3, '@marcus_atl_beats', 'Marcus Allen', 'Atlanta | beats | hip-hop journalism | the underground never left', 12400, 4102, 8301, 'https://twitter.com/marcus_atl_beats', TRUE, '2026-03-19T06:00:00Z'),
  (68, 7, 'MarcusATLBeats', 'Marcus Allen', 'Atlanta beatmaking culture, producer interviews, and hip-hop history deep dives.', 28400, NULL, 74, 'https://youtube.com/@MarcusATLBeats', TRUE, '2026-03-15T16:00:00Z'),
  (68, 4, 'marcus_atl_music', 'marcus_atl_music', 'Atlanta hip-hop | beatmaking | production theory | the city that always sounds like itself', 4102, NULL, 6201, 'https://reddit.com/u/marcus_atl_music', TRUE, '2026-03-18T22:00:00Z');

-- Mia Hoffmann (id=69): TikTok(192), Instagram(193), Pinterest(194)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (69, 8, '@mia.hoffmann.cgn', 'mia hoffmann', 'cologne life | get ready with me | beauty ohne filter | gen z speaks', 98400, 2103, 512, 'https://tiktok.com/@mia.hoffmann.cgn', TRUE, '2026-03-19T10:00:00Z'),
  (69, 1, '@mia.hoffmann.cgn', 'Mia Hoffmann', '✨ Beauty | Cologne | keeping it honest | she/her', 42100, 3102, 612, 'https://instagram.com/mia.hoffmann.cgn', TRUE, '2026-03-19T08:00:00Z'),
  (69, 9, 'miahoffmanncgn', 'Mia Hoffmann', 'Beauty product saves, skincare routines, and Cologne lifestyle inspiration.', 18400, NULL, 734, 'https://pinterest.com/miahoffmanncgn', TRUE, '2026-03-14T12:00:00Z');

-- Jamal Williams (id=70): YouTube(195), Instagram(196), Twitter(197)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (70, 7, 'JamalWilliamsDesign', 'Jamal Williams', 'Branding breakdowns, type specimens, and design commentary from London.', 34100, NULL, 87, 'https://youtube.com/@JamalWilliamsDesign', TRUE, '2026-03-14T15:00:00Z'),
  (70, 1, '@jamal.design.ldn', 'Jamal Williams', '🖋 Graphic design | London | type | brand identity | the details matter', 28400, 3102, 412, 'https://instagram.com/jamal.design.ldn', TRUE, '2026-03-18T19:00:00Z'),
  (70, 3, '@jamal_williams', 'Jamal Williams', 'Design | London | branding hot takes | typography opinions | occasional client rant', 9102, 4102, 7201, 'https://twitter.com/jamal_williams', TRUE, '2026-03-18T21:00:00Z');

-- Suki Yamamoto (id=71): Instagram(198), Pinterest(199), Snapchat(200)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (71, 1, '@suki.kyoto.craft', 'Suki Yamamoto', '👘 Kimono restoration | Kyoto artisans | textile heritage | 京都', 24100, 2840, 512, 'https://instagram.com/suki.kyoto.craft', TRUE, '2026-03-18T20:00:00Z'),
  (71, 9, 'sukikyotocraft', 'Suki Yamamoto', 'Kimono patterns, Japanese textile art, and Kyoto craft workshop references.', 38400, NULL, 1203, 'https://pinterest.com/sukikyotocraft', TRUE, '2026-03-15T11:00:00Z'),
  (71, 5, 'suki.kyoto', 'Suki Yamamoto', NULL, NULL, NULL, NULL, 'https://snapchat.com/add/suki.kyoto', TRUE, '2026-03-18T19:00:00Z');

-- Marcus Schulz (id=72): LinkedIn(201), Facebook(202)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (72, 6, 'Marcus Schulz', 'Marcus Schulz', 'Project Director | Munich | Engineering & Construction | Open to new roles', 2840, 1840, 31, 'https://linkedin.com/in/marcusschulzmuc', FALSE, '2022-10-14T09:00:00Z'),
  (72, 2, 'Marcus Schulz München', 'Marcus Schulz', NULL, 412, 380, 112, 'https://facebook.com/marcusschulzmunchen', FALSE, '2022-09-20T18:00:00Z');

-- Bianca Souza (id=73): Instagram(203), TikTok(204)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (73, 1, '@bianca.brasilia', 'Bianca Souza', '🏛 Arquitetura | Brasília modernista | fotografia urbana | patrimônio em risco', 18400, 2840, 487, 'https://instagram.com/bianca.brasilia', TRUE, '2026-03-18T19:00:00Z'),
  (73, 8, '@biancabrasilia', 'bianca souza', 'brasília que ninguém filma | modernismo | oscar niemeyer | arquitetura viva', 48200, 1840, 312, 'https://tiktok.com/@biancabrasilia', TRUE, '2026-03-19T08:00:00Z');

-- Hassan Mohamad (id=74): Instagram(205), Facebook(206), Twitter(207)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (74, 1, '@hassan.beirut', 'Hassan Mohamad', '📰 Beirut | journalism | diaspora | writing through it', 14200, 3102, 312, 'https://instagram.com/hassan.beirut', TRUE, '2026-03-18T18:00:00Z'),
  (74, 2, 'Hassan Mohamad Beirut', 'Hassan Mohamad', 'Journalist | Beirut | covering Lebanon and the diaspora. In Arabic and English.', 8102, 4203, 912, 'https://facebook.com/hassanmohamadbeirut', TRUE, '2026-03-14T14:00:00Z'),
  (74, 3, '@hassan_beirut', 'Hassan Mohamad', 'Beirut | journalism | Lebanon | the country is complicated but the food is not', 18400, 5102, 9301, 'https://twitter.com/hassan_beirut', TRUE, '2026-03-19T07:00:00Z');

-- Maren Kvist (id=75): Instagram(208), YouTube(209)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (75, 1, '@maren.tromso', 'Maren Kvist', '🌌 Northern lights | Tromsø | Arctic photography | the sky here is unreasonable', 42100, 3102, 612, 'https://instagram.com/maren.tromso', TRUE, '2026-03-18T01:00:00Z'),
  (75, 7, 'MarenTromso', 'Maren Kvist', 'Northern lights timelapse, Arctic wildlife photography, and life above the Arctic Circle.', 38400, NULL, 78, 'https://youtube.com/@MarenTromso', TRUE, '2026-03-13T15:00:00Z');

-- Alex Tran (id=76): TikTok(210), YouTube(211), Instagram(212)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (76, 8, '@alex.saigon.eats', 'alex tran', 'saigon street food | hẻm gems | bún bò huế at 6am | no tourist traps', 124000, 2103, 512, 'https://tiktok.com/@alex.saigon.eats', TRUE, '2026-03-19T10:00:00Z'),
  (76, 7, 'AlexSaigonEats', 'Alex Tran', 'Vietnamese street food documentaries from alleyways, markets, and family kitchens in HCMC.', 48200, NULL, 94, 'https://youtube.com/@AlexSaigonEats', TRUE, '2026-03-15T14:00:00Z'),
  (76, 1, '@alex.saigon.eats', 'Alex Tran', '🍜 Saigon street food | Hồ Chí Minh City | ăn là phải ngon', 31200, 2840, 487, 'https://instagram.com/alex.saigon.eats', TRUE, '2026-03-18T20:00:00Z');

-- ============================================================
-- BATCH 8 — Persons 77–86  (profiles 213–238)
-- ============================================================

INSERT INTO persons (full_name, birth_date, is_deceased, death_date, location, avatar_url, digital_status, archived_at, notes) VALUES
  ('Frida Berg',        '1994-09-23', FALSE, NULL, 'Gothenburg, Sweden',       'https://api.dicebear.com/7.x/personas/svg?seed=FridaBerg',       'active', '2025-10-04T07:00:00Z', 'Sustainable fashion blogger and second-hand stylist. Strong following in Nordic slow-fashion communities.'),
  ('Kwame Asante',      '1992-07-16', FALSE, NULL, 'Kumasi, Ghana',            'https://api.dicebear.com/7.x/personas/svg?seed=KwameAsante',     'active', '2025-08-11T08:00:00Z', 'Cultural historian and educator. Makes accessible content about Ghanaian and West African history.'),
  ('Sasha Volkov',      '1995-02-04', FALSE, NULL, 'Kyiv, Ukraine',            'https://api.dicebear.com/7.x/personas/svg?seed=SashaVolkov',     'absent', '2024-03-22T10:00:00Z', 'Twitter and Reddit inactive since early 2024. Previously wrote about Ukrainian tech and startup culture.'),
  ('Elena Ricci',       '1999-10-12', FALSE, NULL, 'Naples, Italy',            'https://api.dicebear.com/7.x/personas/svg?seed=ElenaRicci',      'active', '2025-11-20T08:00:00Z', 'Street food and Neapolitan culture creator. Deeply local content with an unexpectedly global audience.'),
  ('Daniel Nakamura',   '1991-04-29', FALSE, NULL, 'Portland, USA',            'https://api.dicebear.com/7.x/personas/svg?seed=DanielNakamura',  'active', '2025-09-17T10:00:00Z', 'Software engineer and nature photographer. Combines coding life with Pacific Northwest outdoor content.'),
  ('Amara Diallo',      '1998-11-07', FALSE, NULL, 'Dakar, Senegal',           'https://api.dicebear.com/7.x/personas/svg?seed=AmaraDiallo',     'active', '2025-12-03T07:00:00Z', 'Fashion designer and cultural creator celebrating Senegalese textile traditions and contemporary African fashion.'),
  ('Cian Murphy',       '1993-01-14', FALSE, NULL, 'Galway, Ireland',          'https://api.dicebear.com/7.x/personas/svg?seed=CianMurphy',      'active', '2025-07-08T09:00:00Z', 'Marine biologist and science communicator. Covers Ireland''s coastal ecosystems and Atlantic wildlife.'),
  ('Rin Tanaka',        '2001-05-28', FALSE, NULL, 'Fukuoka, Japan',           'https://api.dicebear.com/7.x/personas/svg?seed=RinTanaka',       'active', '2025-12-15T06:00:00Z', 'Anime artist and digital illustrator. Large following across Japanese and international art communities.'),
  ('Gabriel Moreau',    '1990-08-19', FALSE, NULL, 'Marseille, France',        'https://api.dicebear.com/7.x/personas/svg?seed=GabrielMoreau',   'active', '2025-06-29T09:00:00Z', 'Chef and food historian exploring Provençal cuisine and the Mediterranean cooking traditions of Marseille.'),
  ('Kira Novak',        '1996-03-31', FALSE, NULL, 'Bratislava, Slovakia',     'https://api.dicebear.com/7.x/personas/svg?seed=KiraNovak',       'active', '2025-09-22T08:00:00Z', 'Travel creator and language learner documenting Central European destinations most tourists skip.');

-- Frida Berg (id=77): Instagram(213), Pinterest(214), TikTok(215)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (77, 1, '@frida.secondhand', 'Frida Berg', '♻️ Sustainable fashion | Gothenburg | second-hand first | slow wardrobe', 24100, 3102, 512, 'https://instagram.com/frida.secondhand', TRUE, '2026-03-18T18:00:00Z'),
  (77, 9, 'fridasecondhand', 'Frida Berg', 'Sustainable style, Swedish second-hand finds, and slow fashion philosophy.', 31200, NULL, 1102, 'https://pinterest.com/fridasecondhand', TRUE, '2026-03-14T12:00:00Z'),
  (77, 8, '@fridaBerg.thrift', 'frida berg', 'thrift hauls | secondhand gothenburg | hållbart mode | slow fashion swede', 62400, 2103, 341, 'https://tiktok.com/@fridaberg.thrift', TRUE, '2026-03-19T08:00:00Z');

-- Kwame Asante (id=78): Twitter(216), YouTube(217), Facebook(218)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (78, 3, '@kwame_asante_gh', 'Kwame Asante', 'Kumasi | West African history | Ashanti culture | making the past legible', 14200, 4102, 8301, 'https://twitter.com/kwame_asante_gh', TRUE, '2026-03-19T07:00:00Z'),
  (78, 7, 'KwameAsanteHistory', 'Kwame Asante', 'Accessible history of Ghana, the Ashanti Empire, and West African civilisations.', 38400, NULL, 82, 'https://youtube.com/@KwameAsanteHistory', TRUE, '2026-03-15T15:00:00Z'),
  (78, 2, 'Kwame Asante Education', 'Kwame Asante', 'West African history and culture, made accessible. Based in Kumasi, Ghana.', 22400, 5102, 812, 'https://facebook.com/kwameasanteeducation', TRUE, '2026-03-12T14:00:00Z');

-- Sasha Volkov (id=79): Twitter(219), Reddit(220)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (79, 3, '@sasha_volkov_ua', 'Sasha Volkov', 'Kyiv | tech | startups | Ukrainian internet ecosystem | currently offline', 6103, 3840, 7201, 'https://twitter.com/sasha_volkov_ua', FALSE, '2024-01-18T14:00:00Z'),
  (79, 4, 'sasha_volkov_kyiv', 'sasha_volkov_kyiv', 'Ukraine tech | startups | Kyiv | been quiet lately', 2840, NULL, 4102, 'https://reddit.com/u/sasha_volkov_kyiv', FALSE, '2024-02-10T20:00:00Z');

-- Elena Ricci (id=80): Instagram(221), TikTok(222)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (80, 1, '@elena.napoli', 'Elena Ricci', '🍕 Napoli | street food | la vera cucina partenopea | niente turisti', 38400, 3102, 612, 'https://instagram.com/elena.napoli', TRUE, '2026-03-18T19:00:00Z'),
  (80, 8, '@elenanapoli', 'elena ricci', 'pizza napoletana | street food napoli | la città che si mangia | 100% locale', 112000, 2103, 489, 'https://tiktok.com/@elenanapoli', TRUE, '2026-03-19T10:00:00Z');

-- Daniel Nakamura (id=81): Reddit(223), YouTube(224), Twitter(225)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (81, 4, 'daniel_nak_pdx', 'daniel_nak_pdx', 'Portland | software engineering | PNW photography | the forests are the point', 3102, NULL, 5830, 'https://reddit.com/u/daniel_nak_pdx', TRUE, '2026-03-18T22:00:00Z'),
  (81, 7, 'DanielNakamuraPDX', 'Daniel Nakamura', 'Pacific Northwest nature photography, trail reports, and coding life from Portland.', 18400, NULL, 61, 'https://youtube.com/@DanielNakamuraPDX', TRUE, '2026-03-13T15:00:00Z'),
  (81, 3, '@daniel_nak_pdx', 'Daniel Nakamura', 'Portland | software + nature | the trees are better than the code, usually', 6103, 3102, 5201, 'https://twitter.com/daniel_nak_pdx', TRUE, '2026-03-18T19:00:00Z');

-- Amara Diallo (id=82): Instagram(226), TikTok(227)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (82, 1, '@amara.dakar', 'Amara Diallo', '👗 Mode africaine | Dakar | tissus sénégalais | la beauté qui vient de chez nous', 34100, 3102, 512, 'https://instagram.com/amara.dakar', TRUE, '2026-03-18T18:00:00Z'),
  (82, 8, '@amaradiallo', 'amara diallo', 'wax prints | Dakar fashion | African designers you need to know | mode locale', 78400, 2103, 389, 'https://tiktok.com/@amaradiallo', TRUE, '2026-03-19T09:00:00Z');

-- Cian Murphy (id=83): Reddit(228), YouTube(229), Twitter(230)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (83, 4, 'cian_murphy_ocean', 'cian_murphy_ocean', 'marine biology | Irish coastal ecosystems | Galway | the Atlantic is not okay and neither am I', 4102, NULL, 6830, 'https://reddit.com/u/cian_murphy_ocean', TRUE, '2026-03-18T23:00:00Z'),
  (83, 7, 'CianMurphyMarine', 'Cian Murphy', 'Ireland''s Atlantic coastline, marine ecosystems, and ocean science communication from Galway.', 22400, NULL, 64, 'https://youtube.com/@CianMurphyMarine', TRUE, '2026-03-14T14:00:00Z'),
  (83, 3, '@cian_murphy', 'Cian Murphy', 'Marine biology | Galway | the ocean is doing its best | science thread enjoyer', 8102, 3840, 6201, 'https://twitter.com/cian_murphy', TRUE, '2026-03-18T20:00:00Z');

-- Rin Tanaka (id=84): TikTok(231), Instagram(232), YouTube(233)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (84, 8, '@rin.illustrates', 'rin tanaka', 'anime art | digital illustration | fukuoka | 描くのが好き | fanart & originals', 142000, 3102, 612, 'https://tiktok.com/@rin.illustrates', TRUE, '2026-03-19T10:00:00Z'),
  (84, 1, '@rin.illustrates', 'Rin Tanaka', '🎨 Digital illustrator | Fukuoka | anime & original art | 田中凛', 64200, 4102, 712, 'https://instagram.com/rin.illustrates', TRUE, '2026-03-19T08:00:00Z'),
  (84, 7, 'RinIllustrates', 'Rin Tanaka', 'Digital illustration process videos, character design, and anime art commentary from Fukuoka.', 38400, NULL, 94, 'https://youtube.com/@RinIllustrates', TRUE, '2026-03-16T14:00:00Z');

-- Gabriel Moreau (id=85): YouTube(234), Instagram(235)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (85, 7, 'GabrielMoreauCuisine', 'Gabriel Moreau', 'Provençal recipes, Mediterranean food history, and cooking from the port city of Marseille.', 28400, NULL, 67, 'https://youtube.com/@GabrielMoreauCuisine', TRUE, '2026-03-14T15:00:00Z'),
  (85, 1, '@gabriel.marseille', 'Gabriel Moreau', '🫒 Marseille | cuisine provençale | histoire et saveurs | la mer est dans l''assiette', 18400, 2840, 412, 'https://instagram.com/gabriel.marseille', TRUE, '2026-03-18T19:00:00Z');

-- Kira Novak (id=86): Instagram(236), Pinterest(237), TikTok(238)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (86, 1, '@kira.central.eu', 'Kira Novak', '🗺 Bratislava | Central Europe travel | the places nobody puts on a poster', 16800, 2840, 412, 'https://instagram.com/kira.central.eu', TRUE, '2026-03-18T17:00:00Z'),
  (86, 9, 'kiracentraleurope', 'Kira Novak', 'Central European travel guides, Slovak landscapes, and hidden cities of the region.', 24100, NULL, 892, 'https://pinterest.com/kiracentraleurope', TRUE, '2026-03-14T12:00:00Z'),
  (86, 8, '@kiracentraleu', 'kira novak', 'bratislava daily | central europe travel | the underrated continent | languages: 4', 48900, 2103, 312, 'https://tiktok.com/@kiracentraleu', TRUE, '2026-03-19T08:00:00Z');

-- ============================================================
-- BATCH 9 — Persons 87–96  (profiles 239–266)
-- ============================================================

INSERT INTO persons (full_name, birth_date, is_deceased, death_date, location, avatar_url, digital_status, archived_at, notes) VALUES
  ('Theo Williams',     '1994-06-22', FALSE, NULL, 'Birmingham, UK',           'https://api.dicebear.com/7.x/personas/svg?seed=TheoWilliams',    'active', '2025-08-17T09:00:00Z', 'Music producer and culture writer covering UK garage, grime, and Birmingham''s underground scene.'),
  ('Nour Abdelaziz',    '1999-04-14', FALSE, NULL, 'Amman, Jordan',            'https://api.dicebear.com/7.x/personas/svg?seed=NourAbdelaziz',   'active', '2025-10-21T08:00:00Z', 'Art director and visual creator blending Arabic calligraphy with contemporary design.'),
  ('Björn Eriksson',    '1988-12-03', FALSE, NULL, 'Gothenburg, Sweden',       'https://api.dicebear.com/7.x/personas/svg?seed=BjornEriksson',   'active', '2025-07-06T10:00:00Z', 'Marine engineer turned sustainability consultant. Posts research threads on shipping decarbonisation.'),
  ('Chiara Ferrari',    '1997-08-09', FALSE, NULL, 'Florence, Italy',          'https://api.dicebear.com/7.x/personas/svg?seed=ChiaraFerrari',   'active', '2025-11-03T08:00:00Z', 'Art restorer and heritage educator. Documents her work restoring Renaissance-era paintings in Florence.'),
  ('Hugo Rousseau',     '1993-07-17', FALSE, NULL, 'Toulouse, France',         'https://api.dicebear.com/7.x/personas/svg?seed=HugoRousseau',    'active', '2025-09-29T10:00:00Z', 'Aerospace engineer and science communicator. Makes YouTube essays on space and aviation history.'),
  ('Ingrid Magnusson',  '1992-01-30', FALSE, NULL, 'Stockholm, Sweden',        'https://api.dicebear.com/7.x/personas/svg?seed=IngridMagnusson', 'absent', '2024-05-14T09:00:00Z', 'Instagram, LinkedIn and Pinterest silent since early 2024. Previously a UX lead at a Stockholm fintech.'),
  ('James O''Sullivan', '1989-11-08', FALSE, NULL, 'Belfast, UK',              'https://api.dicebear.com/7.x/personas/svg?seed=JamesOSullivan',  'active', '2025-06-12T09:00:00Z', 'Historian and podcast host covering Irish history, the Troubles, and Northern Ireland''s present.'),
  ('Zara Ahmed',        '1998-02-19', FALSE, NULL, 'Karachi, Pakistan',        'https://api.dicebear.com/7.x/personas/svg?seed=ZaraAhmed',       'active', '2025-11-25T07:00:00Z', 'Fashion illustrator and textile designer. Merges South Asian craft traditions with contemporary illustration.'),
  ('Erik Sørensen',     '1994-09-15', FALSE, NULL, 'Copenhagen, Denmark',      'https://api.dicebear.com/7.x/personas/svg?seed=ErikSorensen',    'active', '2025-10-10T08:00:00Z', 'Data scientist and climate modeller. Active in open data communities and science communication.'),
  ('Laila Mansour',     '1997-05-27', FALSE, NULL, 'Dubai, UAE',               'https://api.dicebear.com/7.x/personas/svg?seed=LailaMansour',    'active', '2025-12-08T07:00:00Z', 'Lifestyle and interiors creator based in Dubai. Covers minimalist design and Gulf contemporary living.');

-- Theo Williams (id=87): Reddit(239), YouTube(240), Twitter(241)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (87, 4, 'theo_williams_brum', 'theo_williams_brum', 'Birmingham music | UK garage | grime | bass culture | city doesn''t get enough credit', 5102, NULL, 8301, 'https://reddit.com/u/theo_williams_brum', TRUE, '2026-03-18T23:00:00Z'),
  (87, 7, 'TheoWilliamsBrum', 'Theo Williams', 'Deep dives into UK garage, grime history, and Birmingham''s music underground.', 22400, NULL, 61, 'https://youtube.com/@TheoWilliamsBrum', TRUE, '2026-03-15T15:00:00Z'),
  (87, 3, '@theo_brum_music', 'Theo Williams', 'Birmingham | UK music culture | garage | grime | the city that made the sound', 9102, 4102, 7201, 'https://twitter.com/theo_brum_music', TRUE, '2026-03-19T06:00:00Z');

-- Nour Abdelaziz (id=88): Instagram(242), TikTok(243)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (88, 1, '@nour.designs.jo', 'Nour Abdelaziz', '✍️ Art direction | Amman | calligraphy meets contemporary | عمّان والفن', 28400, 3102, 487, 'https://instagram.com/nour.designs.jo', TRUE, '2026-03-18T18:00:00Z'),
  (88, 8, '@nourdesigns', 'nour abdelaziz', 'arabic calligraphy | design process | amman | الخط العربي في الحياة الحديثة', 68400, 2103, 312, 'https://tiktok.com/@nourdesigns', TRUE, '2026-03-19T09:00:00Z');

-- Björn Eriksson (id=89): LinkedIn(244), YouTube(245), Reddit(246)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (89, 6, 'Björn Eriksson', 'Björn Eriksson', 'Marine Engineer | Sustainability Consultant | Gothenburg | Shipping Decarbonisation', 14200, 4102, 112, 'https://linkedin.com/in/bjorneriksson', TRUE, '2026-03-18T09:00:00Z'),
  (89, 7, 'BjornErikssonSustain', 'Björn Eriksson', 'Shipping decarbonisation, maritime sustainability, and the slow death of heavy fuel oil.', 18400, NULL, 47, 'https://youtube.com/@BjornErikssonSustain', TRUE, '2026-03-14T14:00:00Z'),
  (89, 4, 'bjorn_eriksson_marine', 'bjorn_eriksson_marine', 'marine engineering | shipping emissions | Gothenburg | the sea needs better regulations', 3102, NULL, 5830, 'https://reddit.com/u/bjorn_eriksson_marine', TRUE, '2026-03-18T21:00:00Z');

-- Chiara Ferrari (id=90): Instagram(247), Pinterest(248), TikTok(249)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (90, 1, '@chiara.restauro', 'Chiara Ferrari', '🖼 Art restoration | Florence | Renaissance heritage | restoring things that matter', 24100, 2840, 512, 'https://instagram.com/chiara.restauro', TRUE, '2026-03-18T19:00:00Z'),
  (90, 9, 'chiaraferrariarte', 'Chiara Ferrari', 'Renaissance art references, restoration techniques, and Florentine heritage inspiration.', 18400, NULL, 892, 'https://pinterest.com/chiaraferrariarte', TRUE, '2026-03-14T12:00:00Z'),
  (90, 8, '@chiara.restauro', 'chiara ferrari', 'restauro dipinti | firenze | patrimonio | quello che le persone non vedono nei musei', 58400, 2103, 312, 'https://tiktok.com/@chiara.restauro', TRUE, '2026-03-19T09:00:00Z');

-- Hugo Rousseau (id=91): YouTube(250), Reddit(251), Twitter(252)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (91, 7, 'HugoRousseauSpace', 'Hugo Rousseau', 'Space history, aerospace engineering, and the physics behind why things fly. Toulouse-based.', 38400, NULL, 78, 'https://youtube.com/@HugoRousseauSpace', TRUE, '2026-03-15T15:00:00Z'),
  (91, 4, 'hugo_rousseau_aero', 'hugo_rousseau_aero', 'aerospace | space history | Toulouse | Airbus is my neighbour | rockets explained badly', 6103, NULL, 7201, 'https://reddit.com/u/hugo_rousseau_aero', TRUE, '2026-03-18T22:00:00Z'),
  (91, 3, '@hugo_rousseau', 'Hugo Rousseau', 'Aerospace engineer | Toulouse | space | aviation history | occasional rocket takes', 12400, 4102, 8301, 'https://twitter.com/hugo_rousseau', TRUE, '2026-03-18T20:00:00Z');

-- Ingrid Magnusson (id=92): Instagram(253), LinkedIn(254), Pinterest(255)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (92, 1, '@ingrid.ux.sthlm', 'Ingrid Magnusson', 'UX | Stockholm | design systems | paused for now', 8102, 2840, 312, 'https://instagram.com/ingrid.ux.sthlm', FALSE, '2024-02-28T10:00:00Z'),
  (92, 6, 'Ingrid Magnusson', 'Ingrid Magnusson', 'UX Lead | Stockholm | Design Systems | Fintech | Currently offline', 12400, 4102, 89, 'https://linkedin.com/in/ingridmagnusson', FALSE, '2024-03-10T09:00:00Z'),
  (92, 9, 'ingriduxsthlm', 'Ingrid Magnusson', 'Design system references, UI patterns, and Stockholm minimalism.', 14200, NULL, 612, 'https://pinterest.com/ingriduxsthlm', FALSE, '2024-01-20T14:00:00Z');

-- James O'Sullivan (id=93): Facebook(256), Reddit(257), Twitter(258)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (93, 2, 'James O''Sullivan History', 'James O''Sullivan', 'Irish history | Belfast | the podcast is at jamesosullivanhistory.com', 18400, 5102, 912, 'https://facebook.com/jamesosullivanhistory', TRUE, '2026-03-15T16:00:00Z'),
  (93, 4, 'james_osullivan_bel', 'james_osullivan_bel', 'Irish history | the Troubles | Belfast | Northern Ireland today | long posts, longer memories', 8102, NULL, 9201, 'https://reddit.com/u/james_osullivan_bel', TRUE, '2026-03-18T22:00:00Z'),
  (93, 3, '@james_osullivan', 'James O''Sullivan', 'Belfast | Irish history | the Troubles | NI politics | podcast host | history is not finished', 22400, 5830, 11203, 'https://twitter.com/james_osullivan', TRUE, '2026-03-19T07:00:00Z');

-- Zara Ahmed (id=94): Instagram(259), TikTok(260)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (94, 1, '@zara.ahmed.art', 'Zara Ahmed', '🎨 Fashion illustration | Karachi | South Asian textiles | art that wears its roots', 32100, 3102, 512, 'https://instagram.com/zara.ahmed.art', TRUE, '2026-03-18T19:00:00Z'),
  (94, 8, '@zaraahnedart', 'zara ahmed', 'fashion illustration | pakistani textiles | karachi | the craft that never left', 78400, 2103, 387, 'https://tiktok.com/@zaraahedart', TRUE, '2026-03-19T09:00:00Z');

-- Erik Sørensen (id=95): Reddit(261), LinkedIn(262), YouTube(263)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (95, 4, 'erik_sorensen_data', 'erik_sorensen_data', 'data science | climate modelling | Copenhagen | open data | the numbers are not good news', 4102, NULL, 6830, 'https://reddit.com/u/erik_sorensen_data', TRUE, '2026-03-18T23:00:00Z'),
  (95, 6, 'Erik Sørensen', 'Erik Sørensen', 'Data Scientist | Copenhagen | Climate Modelling | Open Data Advocate', 8102, 3840, 94, 'https://linkedin.com/in/eriksorensendk', TRUE, '2026-03-18T09:00:00Z'),
  (95, 7, 'ErikSorensenData', 'Erik Sørensen', 'Climate data explainers, open datasets, and science communication from Copenhagen.', 14200, NULL, 52, 'https://youtube.com/@ErikSorensenData', TRUE, '2026-03-13T14:00:00Z');

-- Laila Mansour (id=96): Instagram(264), TikTok(265), Pinterest(266)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (96, 1, '@laila.dubai', 'Laila Mansour', '🏙 Dubai | interiors | minimalism | lifestyle | living intentionally in a maximalist city', 38400, 3102, 612, 'https://instagram.com/laila.dubai', TRUE, '2026-03-18T19:00:00Z'),
  (96, 8, '@lailadubai', 'laila mansour', 'dubai life | minimalist home | interiors that breathe | العيش الهادئ في المدينة', 92100, 2103, 489, 'https://tiktok.com/@lailadubai', TRUE, '2026-03-19T10:00:00Z'),
  (96, 9, 'lailamansour', 'Laila Mansour', 'Minimalist interiors, Gulf contemporary design, and calm living inspiration from Dubai.', 48200, NULL, 1102, 'https://pinterest.com/lailamansour', TRUE, '2026-03-15T12:00:00Z');

-- ============================================================
-- BATCH 10 — Persons 97–106  (profiles 267–291)
-- ============================================================

INSERT INTO persons (full_name, birth_date, is_deceased, death_date, location, avatar_url, digital_status, archived_at, notes) VALUES
  ('Ryan Kowalczyk',    '1992-10-11', FALSE, NULL, 'Warsaw, Poland',           'https://api.dicebear.com/7.x/personas/svg?seed=RyanKowalczyk',   'active', '2025-09-03T10:00:00Z', 'Indie game developer and YouTube essayist covering game design theory and Polish game dev scene.'),
  ('Mina Bergström',    '1999-03-08', FALSE, NULL, 'Lund, Sweden',             'https://api.dicebear.com/7.x/personas/svg?seed=MinaBergstrom',   'active', '2025-12-20T07:00:00Z', 'Environmental science student and climate activist. Communicates climate urgency through accessible short-form content.'),
  ('Kofi Asante',       '1991-06-30', FALSE, NULL, 'Accra, Ghana',             'https://api.dicebear.com/7.x/personas/svg?seed=KofiAsante',      'active', '2025-07-17T08:00:00Z', 'Entrepreneur and startup mentor covering African business ecosystems and pan-African commerce.'),
  ('Aaliya Shah',       '2000-12-04', FALSE, NULL, 'Lahore, Pakistan',         'https://api.dicebear.com/7.x/personas/svg?seed=AaliyaShah',      'active', '2025-11-09T07:00:00Z', 'Student and digital artist. Creates manga-influenced illustrations blending South Asian and Japanese aesthetics.'),
  ('Yuna Park',         '2000-07-21', FALSE, NULL, 'Seoul, South Korea',       'https://api.dicebear.com/7.x/personas/svg?seed=YunaPark',        'active', '2025-10-05T06:00:00Z', 'K-pop dance cover creator and choreographer. Large following across short-video platforms.'),
  ('Sofia Kovač',       '1997-09-16', FALSE, NULL, 'Zagreb, Croatia',          'https://api.dicebear.com/7.x/personas/svg?seed=SofiaKovac',      'absent', '2024-04-08T10:00:00Z', 'Instagram silent since early 2024. Previously shared graphic design work and Zagreb city photography.'),
  ('Antoine Dubois',    '1988-03-25', FALSE, NULL, 'Lyon, France',             'https://api.dicebear.com/7.x/personas/svg?seed=AntoineDubois',   'absent', '2023-09-18T11:00:00Z', 'Twitter and LinkedIn inactive since late 2023. Former UX consultant based in Lyon.'),
  ('Lea Christensen',   '1995-01-17', FALSE, NULL, 'Aarhus, Denmark',          'https://api.dicebear.com/7.x/personas/svg?seed=LeaChristensen',  'active', '2025-08-26T07:00:00Z', 'Textile artist and weaving teacher. Documents her loom work and natural dyeing process online.'),
  ('Marco Ferretti',    '1986-07-04', FALSE, NULL, 'Turin, Italy',             'https://api.dicebear.com/7.x/personas/svg?seed=MarcoFerretti',   'absent', '2023-11-30T12:00:00Z', 'LinkedIn and Facebook quiet since late 2023. Former automotive engineer at a Turin design studio.'),
  ('Priti Sharma',      '1996-04-22', FALSE, NULL, 'Delhi, India',             'https://api.dicebear.com/7.x/personas/svg?seed=PritiSharma',     'active', '2025-09-14T07:00:00Z', 'Documentary photographer and visual journalist covering urban life and social issues across India.');

-- Ryan Kowalczyk (id=97): YouTube(267), Reddit(268), Twitter(269)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (97, 7, 'RyanKowalczykDev', 'Ryan Kowalczyk', 'Indie game design essays, Polish game dev scene coverage, and devlog documentaries from Warsaw.', 28400, NULL, 67, 'https://youtube.com/@RyanKowalczykDev', TRUE, '2026-03-15T16:00:00Z'),
  (97, 4, 'ryan_kowalczyk_dev', 'ryan_kowalczyk_dev', 'indie gamedev | Warsaw | game design theory | godot | Polish dev scene deserves more attention', 4102, NULL, 6830, 'https://reddit.com/u/ryan_kowalczyk_dev', TRUE, '2026-03-18T23:00:00Z'),
  (97, 3, '@ryan_kowalczyk', 'Ryan Kowalczyk', 'Warsaw | indie games | game design | making things | Polish gamedev is real', 8102, 3840, 5201, 'https://twitter.com/ryan_kowalczyk', TRUE, '2026-03-18T20:00:00Z');

-- Mina Bergström (id=98): TikTok(270), Instagram(271), Snapchat(272)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (98, 8, '@mina.klimat', 'mina bergström', 'klimatångest är normalt | lund | miljövetenskap | we have to talk about this', 84200, 2103, 412, 'https://tiktok.com/@mina.klimat', TRUE, '2026-03-19T09:00:00Z'),
  (98, 1, '@mina.klimat', 'Mina Bergström', '🌍 Climate science | Lund | making the data human | she/her', 28400, 3102, 387, 'https://instagram.com/mina.klimat', TRUE, '2026-03-18T17:00:00Z'),
  (98, 5, 'mina.bergstrom', 'Mina Bergström', NULL, NULL, NULL, NULL, 'https://snapchat.com/add/mina.bergstrom', TRUE, '2026-03-18T20:00:00Z');

-- Kofi Asante (id=99): Twitter(273), YouTube(274), Facebook(275)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (99, 3, '@kofi_asante_gh', 'Kofi Asante', 'Accra | entrepreneurship | African business | building things that outlast me', 18400, 4102, 9301, 'https://twitter.com/kofi_asante_gh', TRUE, '2026-03-19T07:00:00Z'),
  (99, 7, 'KofiAsanteBusiness', 'Kofi Asante', 'African entrepreneurship stories, startup ecosystem coverage, and business lessons from Accra.', 22400, NULL, 58, 'https://youtube.com/@KofiAsanteBusiness', TRUE, '2026-03-14T15:00:00Z'),
  (99, 2, 'Kofi Asante Accra', 'Kofi Asante', 'Entrepreneur | Accra | Pan-African commerce | connecting the continent one deal at a time.', 12400, 4102, 812, 'https://facebook.com/kofiasanteaccra', TRUE, '2026-03-12T14:00:00Z');

-- Aaliya Shah (id=100): Instagram(276), TikTok(277)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (100, 1, '@aaliya.draws', 'Aaliya Shah', '🎨 Digital art | Lahore | manga meets Pakistan | illustration that tells two stories at once', 24100, 3102, 487, 'https://instagram.com/aaliya.draws', TRUE, '2026-03-18T20:00:00Z'),
  (100, 8, '@aaliyadraws', 'aaliya shah', 'manga illustration | lahore | south asian × japanese aesthetics | WIP and finished pieces', 62400, 2103, 341, 'https://tiktok.com/@aaliyadraws', TRUE, '2026-03-19T09:00:00Z');

-- Yuna Park (id=101): TikTok(278), Instagram(279), YouTube(280)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (101, 8, '@yuna.dance.kr', 'yuna park', 'K-pop covers | Seoul | choreography | 춤이 말을 해요', 184000, 3102, 612, 'https://tiktok.com/@yuna.dance.kr', TRUE, '2026-03-19T10:00:00Z'),
  (101, 1, '@yuna.dance.kr', 'Yuna Park', '💃 Dance cover | choreography | Seoul | K-pop | 박유나', 68400, 4102, 512, 'https://instagram.com/yuna.dance.kr', TRUE, '2026-03-19T08:00:00Z'),
  (101, 7, 'YunaDanceKR', 'Yuna Park', 'K-pop dance covers, choreography breakdowns, and practice session vlogs from Seoul.', 48200, NULL, 134, 'https://youtube.com/@YunaDanceKR', TRUE, '2026-03-16T14:00:00Z');

-- Sofia Kovač (id=102): Instagram(281)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (102, 1, '@sofia.kovac.zgb', 'Sofia Kovač', 'Zagreb | graphic design | grad photography | tiho otišla', 6103, 2840, 214, 'https://instagram.com/sofia.kovac.zgb', FALSE, '2024-02-14T18:00:00Z');

-- Antoine Dubois (id=103): Twitter(282), LinkedIn(283)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (103, 3, '@antoine_dubois_ux', 'Antoine Dubois', 'Lyon | UX | design research | je suis moins là maintenant', 3102, 2840, 4201, 'https://twitter.com/antoine_dubois_ux', FALSE, '2023-08-20T11:00:00Z'),
  (103, 6, 'Antoine Dubois', 'Antoine Dubois', 'UX Consultant | Lyon | Design Research | Currently taking a step back', 6103, 3840, 54, 'https://linkedin.com/in/antoineduboisux', FALSE, '2023-09-14T10:00:00Z');

-- Lea Christensen (id=104): Instagram(284), Pinterest(285), TikTok(286)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (104, 1, '@lea.weaves', 'Lea Christensen', '🧵 Weaving | Aarhus | natural dye | slow textile | the loom is always honest', 18400, 2840, 412, 'https://instagram.com/lea.weaves', TRUE, '2026-03-18T18:00:00Z'),
  (104, 9, 'leaweavesdk', 'Lea Christensen', 'Handloom weaving, natural dye recipes, and Danish textile craft from Aarhus.', 24100, NULL, 892, 'https://pinterest.com/leaweavesdk', TRUE, '2026-03-14T12:00:00Z'),
  (104, 8, '@lea.weaves', 'lea christensen', 'loom days | naturfarve | aarhus atelier | weaving is just slow patience made visible', 42100, 1840, 287, 'https://tiktok.com/@lea.weaves', TRUE, '2026-03-19T08:00:00Z');

-- Marco Ferretti (id=105): LinkedIn(287), Facebook(288)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (105, 6, 'Marco Ferretti', 'Marco Ferretti', 'Automotive Engineer | Turin | Design Studio | Exploring new directions', 4102, 2840, 47, 'https://linkedin.com/in/marcoferrettito', FALSE, '2023-10-08T09:00:00Z'),
  (105, 2, 'Marco Ferretti Torino', 'Marco Ferretti', NULL, 512, 480, 112, 'https://facebook.com/marcoferrettitorino', FALSE, '2023-09-20T18:00:00Z');

-- Priti Sharma (id=106): Instagram(289), YouTube(290), LinkedIn(291)
INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, follower_count, following_count, post_count, profile_url, is_active, last_seen_at) VALUES
  (106, 1, '@priti.lens', 'Priti Sharma', '📷 Documentary photography | Delhi | urban India | the city never stops changing', 22400, 3102, 512, 'https://instagram.com/priti.lens', TRUE, '2026-03-18T19:00:00Z'),
  (106, 7, 'PritiLens', 'Priti Sharma', 'Visual journalism from Delhi — urban displacement, street life, and the India that keeps moving.', 18400, NULL, 54, 'https://youtube.com/@PritiLens', TRUE, '2026-03-14T15:00:00Z'),
  (106, 6, 'Priti Sharma', 'Priti Sharma', 'Documentary Photographer | Delhi | Visual Journalist | Telling stories that matter', 12400, 4102, 89, 'https://linkedin.com/in/pritisharma', TRUE, '2026-03-18T09:00:00Z');

-- ============================================================
-- PERSON METADATA: gender, last_active, personal_url
-- ============================================================
UPDATE persons SET gender='male',       last_active='2024-11-15', personal_url=NULL                        WHERE full_name='Marcus Chen';
UPDATE persons SET gender='female',     last_active='2024-10-01', personal_url=NULL                        WHERE full_name='Lena Petrova';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='David Okafor';
UPDATE persons SET gender='female',     last_active='2024-08-20', personal_url=NULL                        WHERE full_name='Rina Nakamura';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Søren Andersen';
UPDATE persons SET gender='female',     last_active='2024-12-05', personal_url='https://priya.dev'         WHERE full_name='Priya Sharma';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='James Whitfield';
UPDATE persons SET gender='female',     last_active=NULL,          personal_url=NULL                        WHERE full_name='Yuki Tanaka';
UPDATE persons SET gender='female',     last_active=NULL,          personal_url=NULL                        WHERE full_name='Ana Cristina Ferreira';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Mohammed Al-Rashid';
UPDATE persons SET gender='female',     last_active='2024-09-10', personal_url=NULL                        WHERE full_name='Ingrid Svensson';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Carlos Mendes';
UPDATE persons SET gender='female',     last_active='2024-12-01', personal_url=NULL                        WHERE full_name='Aisha Nwosu';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Oliver Bennett';
UPDATE persons SET gender='female',     last_active='2024-11-30', personal_url='https://meilin.me'         WHERE full_name='Mei Lin';
UPDATE persons SET gender='male',       last_active='2024-10-15', personal_url=NULL                        WHERE full_name='Lukas Becker';
UPDATE persons SET gender='male',       last_active='2024-11-01', personal_url=NULL                        WHERE full_name='Diego Reyes';
UPDATE persons SET gender='female',     last_active=NULL,          personal_url=NULL                        WHERE full_name='Fatima Zahra';
UPDATE persons SET gender='male',       last_active='2024-12-10', personal_url=NULL                        WHERE full_name='Tobias Roth';
UPDATE persons SET gender='female',     last_active=NULL,          personal_url=NULL                        WHERE full_name='Natasha Voronova';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Jake Morrison';
UPDATE persons SET gender='female',     last_active=NULL,          personal_url=NULL                        WHERE full_name='Amara Osei';
UPDATE persons SET gender='male',       last_active='2024-11-20', personal_url=NULL                        WHERE full_name='Tomás García';
UPDATE persons SET gender='female',     last_active=NULL,          personal_url=NULL                        WHERE full_name='Chloe Dupont';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Riku Mäkinen';
UPDATE persons SET gender='female',     last_active='2024-10-25', personal_url=NULL                        WHERE full_name='Elena Vasilieva';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Ben Okonkwo';
UPDATE persons SET gender='female',     last_active='2024-12-08', personal_url=NULL                        WHERE full_name='Hana Kim';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Lars Holm';
UPDATE persons SET gender='female',     last_active='2024-11-28', personal_url=NULL                        WHERE full_name='Isabela Santos';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Dmitri Ostrovsky';
UPDATE persons SET gender='female',     last_active=NULL,          personal_url=NULL                        WHERE full_name='Nadia Hassan';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Tom Nakamura';
UPDATE persons SET gender='female',     last_active='2024-09-25', personal_url=NULL                        WHERE full_name='Petra Novák';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Samuel Adesanya';
UPDATE persons SET gender='female',     last_active='2024-12-03', personal_url=NULL                        WHERE full_name='Giulia Romano';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Mikkel Andersen';
UPDATE persons SET gender='female',     last_active=NULL,          personal_url=NULL                        WHERE full_name='Aigerim Bekova';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Patrick O''Brien';
UPDATE persons SET gender='female',     last_active='2024-10-30', personal_url=NULL                        WHERE full_name='Zoe Papadopoulos';
UPDATE persons SET gender='male',       last_active='2024-11-10', personal_url=NULL                        WHERE full_name='Leon Fischer';
UPDATE persons SET gender='female',     last_active=NULL,          personal_url=NULL                        WHERE full_name='Léa Martin';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Rafael Vargas';
UPDATE persons SET gender='female',     last_active='2024-12-07', personal_url=NULL                        WHERE full_name='Anya Kowalski';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Jae-won Park';
UPDATE persons SET gender='female',     last_active='2024-11-15', personal_url=NULL                        WHERE full_name='Valentina Cruz';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Niall Fitzpatrick';
UPDATE persons SET gender='female',     last_active='2024-11-25', personal_url='https://oliviachen.ca'     WHERE full_name='Olivia Chen';
UPDATE persons SET gender='male',       last_active='2024-10-20', personal_url=NULL                        WHERE full_name='Finn Larsen';
UPDATE persons SET gender='male',       last_active='2024-09-15', personal_url=NULL                        WHERE full_name='Kenji Watanabe';
UPDATE persons SET gender='female',     last_active='2024-12-09', personal_url=NULL                        WHERE full_name='Amira Khalid';
UPDATE persons SET gender='male',       last_active='2024-11-05', personal_url=NULL                        WHERE full_name='Noah Johansson';
UPDATE persons SET gender='female',     last_active='2024-12-11', personal_url=NULL                        WHERE full_name='Valentina Greco';
UPDATE persons SET gender='male',       last_active='2024-10-05', personal_url=NULL                        WHERE full_name='Felix Müller';
UPDATE persons SET gender='female',     last_active='2024-12-04', personal_url=NULL                        WHERE full_name='Grace Owusu';
UPDATE persons SET gender='male',       last_active='2024-09-30', personal_url=NULL                        WHERE full_name='Ivan Petrov';
UPDATE persons SET gender='male',       last_active='2024-11-18', personal_url=NULL                        WHERE full_name='Emre Yilmaz';
UPDATE persons SET gender='female',     last_active='2024-11-22', personal_url=NULL                        WHERE full_name='Nora Schmidt';
UPDATE persons SET gender='male',       last_active='2024-10-10', personal_url='https://rohanmehta.in'     WHERE full_name='Rohan Mehta';
UPDATE persons SET gender='female',     last_active='2024-12-06', personal_url=NULL                        WHERE full_name='Sienna Foster';
UPDATE persons SET gender='male',       last_active='2024-08-15', personal_url=NULL                        WHERE full_name='Omar Khalil';
UPDATE persons SET gender='female',     last_active='2024-11-08', personal_url=NULL                        WHERE full_name='Celine Fontaine';
UPDATE persons SET gender='male',       last_active='2024-09-05', personal_url=NULL                        WHERE full_name='Aaron Mitchell';
UPDATE persons SET gender='male',       last_active='2024-10-28', personal_url=NULL                        WHERE full_name='Karim Benali';
UPDATE persons SET gender='female',     last_active='2024-12-02', personal_url=NULL                        WHERE full_name='Anna Lindström';
UPDATE persons SET gender='male',       last_active='2024-10-12', personal_url=NULL                        WHERE full_name='Ravi Kumar';
UPDATE persons SET gender='female',     last_active='2024-11-30', personal_url=NULL                        WHERE full_name='Lotte Hansen';
UPDATE persons SET gender='male',       last_active='2024-10-22', personal_url=NULL                        WHERE full_name='Marcus Allen';
UPDATE persons SET gender='female',     last_active='2024-12-10', personal_url='https://miahoffmann.art'   WHERE full_name='Mia Hoffmann';
UPDATE persons SET gender='male',       last_active='2024-11-12', personal_url=NULL                        WHERE full_name='Jamal Williams';
UPDATE persons SET gender='female',     last_active='2024-09-20', personal_url=NULL                        WHERE full_name='Suki Yamamoto';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Marcus Schulz';
UPDATE persons SET gender='female',     last_active='2024-12-05', personal_url=NULL                        WHERE full_name='Bianca Souza';
UPDATE persons SET gender='male',       last_active='2024-10-08', personal_url=NULL                        WHERE full_name='Hassan Mohamad';
UPDATE persons SET gender='female',     last_active='2024-11-02', personal_url=NULL                        WHERE full_name='Maren Kvist';
UPDATE persons SET gender='non-binary', last_active='2024-11-25', personal_url=NULL                        WHERE full_name='Alex Tran';
UPDATE persons SET gender='female',     last_active='2024-12-01', personal_url=NULL                        WHERE full_name='Frida Berg';
UPDATE persons SET gender='male',       last_active='2024-10-18', personal_url=NULL                        WHERE full_name='Kwame Asante';
UPDATE persons SET gender='non-binary', last_active=NULL,          personal_url=NULL                        WHERE full_name='Sasha Volkov';
UPDATE persons SET gender='female',     last_active='2024-11-28', personal_url=NULL                        WHERE full_name='Elena Ricci';
UPDATE persons SET gender='male',       last_active='2024-09-12', personal_url=NULL                        WHERE full_name='Daniel Nakamura';
UPDATE persons SET gender='female',     last_active='2024-12-08', personal_url=NULL                        WHERE full_name='Amara Diallo';
UPDATE persons SET gender='male',       last_active='2024-10-25', personal_url=NULL                        WHERE full_name='Cian Murphy';
UPDATE persons SET gender='non-binary', last_active='2024-12-11', personal_url=NULL                        WHERE full_name='Rin Tanaka';
UPDATE persons SET gender='male',       last_active='2024-11-15', personal_url=NULL                        WHERE full_name='Gabriel Moreau';
UPDATE persons SET gender='female',     last_active='2024-10-30', personal_url=NULL                        WHERE full_name='Kira Novak';
UPDATE persons SET gender='male',       last_active='2024-11-20', personal_url=NULL                        WHERE full_name='Theo Williams';
UPDATE persons SET gender='female',     last_active='2024-12-09', personal_url=NULL                        WHERE full_name='Nour Abdelaziz';
UPDATE persons SET gender='male',       last_active='2024-09-28', personal_url=NULL                        WHERE full_name='Björn Eriksson';
UPDATE persons SET gender='female',     last_active='2024-12-04', personal_url='https://chiaraferrari.it'  WHERE full_name='Chiara Ferrari';
UPDATE persons SET gender='male',       last_active='2024-10-15', personal_url=NULL                        WHERE full_name='Hugo Rousseau';
UPDATE persons SET gender='female',     last_active=NULL,          personal_url=NULL                        WHERE full_name='Ingrid Magnusson';
UPDATE persons SET gender='male',       last_active='2024-11-05', personal_url=NULL                        WHERE full_name='James O''Sullivan';
UPDATE persons SET gender='female',     last_active='2024-12-07', personal_url=NULL                        WHERE full_name='Zara Ahmed';
UPDATE persons SET gender='male',       last_active='2024-11-18', personal_url=NULL                        WHERE full_name='Erik Sørensen';
UPDATE persons SET gender='female',     last_active='2024-12-03', personal_url=NULL                        WHERE full_name='Laila Mansour';
UPDATE persons SET gender='male',       last_active='2024-10-20', personal_url=NULL                        WHERE full_name='Ryan Kowalczyk';
UPDATE persons SET gender='female',     last_active='2024-12-10', personal_url='https://minabergstrom.se'  WHERE full_name='Mina Bergström';
UPDATE persons SET gender='male',       last_active='2024-11-12', personal_url=NULL                        WHERE full_name='Kofi Asante';
UPDATE persons SET gender='female',     last_active='2024-12-05', personal_url=NULL                        WHERE full_name='Aaliya Shah';
UPDATE persons SET gender='female',     last_active='2024-12-08', personal_url=NULL                        WHERE full_name='Yuna Park';
UPDATE persons SET gender='female',     last_active=NULL,          personal_url=NULL                        WHERE full_name='Sofia Kovač';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Antoine Dubois';
UPDATE persons SET gender='female',     last_active='2024-11-22', personal_url=NULL                        WHERE full_name='Lea Christensen';
UPDATE persons SET gender='male',       last_active=NULL,          personal_url=NULL                        WHERE full_name='Marco Ferretti';
UPDATE persons SET gender='female',     last_active='2024-11-30', personal_url=NULL                        WHERE full_name='Priti Sharma';
