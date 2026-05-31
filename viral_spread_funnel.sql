WITH RECURSIVE viral_spread AS (
    -- ANCHOR: Start with Track 1 (Anti-Hero) - initial plays
    SELECT 
        track_id,
        user_id,
        action_type,
        1 AS spread_level,
        CONCAT('User ', CAST(user_id AS VARCHAR)) AS spread_path
    FROM engagement
    WHERE track_id = 1 AND action_type = 'play'
    
    UNION ALL
    
    -- RECURSIVE: Find users who engaged after seeing it shared
    SELECT 
        vs.track_id,
        e.user_id,
        e.action_type,
        vs.spread_level + 1,
        CONCAT(vs.spread_path, ' -> User ', CAST(e.user_id AS VARCHAR))
    FROM viral_spread vs
    JOIN engagement e ON vs.user_id < e.user_id 
    WHERE vs.track_id = e.track_id 
    AND vs.spread_level < 3
)
SELECT 
    track_id,
    action_type,
    spread_level,
    COUNT(DISTINCT user_id) AS users_at_level,
    spread_path
FROM viral_spread
GROUP BY track_id, action_type, spread_level, spread_path
ORDER BY spread_level, action_type;
