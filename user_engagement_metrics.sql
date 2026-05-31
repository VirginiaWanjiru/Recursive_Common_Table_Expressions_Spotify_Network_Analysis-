WITH user_engagement_summary AS (
    SELECT 
        u.user_id,
        u.username,
        u.account_type,
        COUNT(CASE WHEN e.action_type = 'play' THEN 1 END) AS total_plays,
        COUNT(CASE WHEN e.action_type = 'like' THEN 1 END) AS total_likes,
        COUNT(CASE WHEN e.action_type = 'share' THEN 1 END) AS total_shares,
        COUNT(DISTINCT e.track_id) AS unique_tracks_played,
        ROUND(100.0 * COUNT(CASE WHEN e.action_type = 'like' THEN 1 END) / 
              COUNT(CASE WHEN e.action_type = 'play' THEN 1 END), 1) AS like_rate_percent
    FROM users u
    LEFT JOIN engagement e ON u.user_id = e.user_id
    GROUP BY u.user_id, u.username, u.account_type
)
SELECT 
    user_id,
    username,
    account_type,
    total_plays,
    total_likes,
    total_shares,
    unique_tracks_played,
    like_rate_percent,
    ROW_NUMBER() OVER (ORDER BY total_plays DESC) AS engagement_rank
FROM user_engagement_summary
WHERE total_plays > 0
ORDER BY engagement_rank;
