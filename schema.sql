-- Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR,
    email VARCHAR,
    country VARCHAR,
    account_type VARCHAR,
    join_date DATE
);

-- Tracks
CREATE TABLE tracks (
    track_id INT PRIMARY KEY,
    track_name VARCHAR,
    artist_name VARCHAR,
    genre VARCHAR,
    duration_seconds INT,
    release_date DATE
);

-- Follower Network
CREATE TABLE follows (
    follow_id INT PRIMARY KEY,
    follower_user_id INT,
    following_user_id INT,
    follow_date DATE
);

-- Engagement (Plays, Likes, Shares)
CREATE TABLE engagement (
    engagement_id INT PRIMARY KEY,
    user_id INT,
    track_id INT,
    action_type VARCHAR,
    action_date DATE
);

-- Playlists
CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY,
    creator_user_id INT,
    playlist_name VARCHAR,
    genre_focus VARCHAR,
    created_date DATE,
    is_public BOOLEAN
);

-- Playlist Tracks
CREATE TABLE playlist_tracks (
    playlist_track_id INT PRIMARY KEY,
    playlist_id INT,
    track_id INT,
    added_date DATE
);


INSERT INTO users VALUES
(1, 'taylor_swift', 'taylor@music.com', 'USA', 'artist', '2020-01-15'),
(2, 'the_weeknd', 'weeknd@music.com', 'Canada', 'artist', '2019-06-20'),
(3, 'music_lover_jane', 'jane@email.com', 'USA', 'free', '2022-03-10'),
(4, 'hip_hop_fan_mike', 'mike@email.com', 'UK', 'premium', '2021-08-05'),
(5, 'pop_enthusiast_sarah', 'sarah@email.com', 'USA', 'premium', '2023-01-20'),
(6, 'indie_collector_alex', 'alex@email.com', 'Australia', 'free', '2021-11-12'),
(7, 'edm_lover_chris', 'chris@email.com', 'USA', 'premium', '2022-05-30');

INSERT INTO tracks VALUES
(1, 'Anti-Hero', 'Taylor Swift', 'Pop', 228, '2022-10-21'),
(2, 'Blinding Lights', 'The Weeknd', 'Synthwave', 200, '2019-11-29'),
(3, 'Levitating', 'Dua Lipa', 'Disco Pop', 203, '2020-10-23'),
(4, 'As It Was', 'Harry Styles', 'Pop', 173, '2022-04-01'),
(5, 'Heat Waves', 'Glass Animals', 'Indie Pop', 239, '2020-06-18');

INSERT INTO follows VALUES
(1, 3, 1, '2022-05-10'),
(2, 3, 2, '2022-06-15'),
(3, 4, 3, '2023-01-20'),
(4, 5, 3, '2023-02-10'),
(5, 5, 4, '2023-03-05'),
(6, 6, 5, '2023-04-12'),
(7, 7, 6, '2023-05-20'),
(8, 4, 1, '2023-06-01'),
(9, 6, 4, '2023-07-10');

INSERT INTO engagement VALUES
(1, 1, 1, 'play', '2024-05-01'),
(2, 3, 1, 'play', '2024-05-02'),
(3, 3, 1, 'like', '2024-05-02'),
(4, 4, 1, 'play', '2024-05-03'),
(5, 4, 1, 'share', '2024-05-03'),
(6, 5, 1, 'play', '2024-05-04'),
(7, 5, 1, 'like', '2024-05-04'),
(8, 5, 1, 'share', '2024-05-05'),
(9, 6, 1, 'play', '2024-05-06'),
(10, 6, 2, 'play', '2024-05-07'),
(11, 7, 2, 'play', '2024-05-08'),
(12, 7, 2, 'like', '2024-05-08');

INSERT INTO playlists VALUES
(1, 1, 'Taylor Essentials', 'Pop', '2023-01-10', true),
(2, 2, 'Late Night Vibes', 'Synthwave', '2023-02-20', true),
(3, 3, 'Janes Favorite Hits', 'Pop', '2023-03-15', true);

INSERT INTO playlist_tracks VALUES
(1, 1, 1, '2023-01-10'),
(2, 1, 4, '2023-01-15'),
(3, 2, 2, '2023-02-20'),
(4, 3, 1, '2023-03-15'),
(5, 3, 3, '2023-03-20');
