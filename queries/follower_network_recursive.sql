WITH RECURSIVE follower_network AS (
    -- ANCHOR: Start with Taylor Swift (user 1)
    SELECT 
        following_user_id AS origin_user,
        follower_user_id AS connected_user,
        1 AS connection_depth,
        CONCAT(following_user_id, '->', follower_user_id) AS connection_path
    FROM follows
    WHERE following_user_id = 1
    
    UNION ALL
    
    -- RECURSIVE: Find followers of those followers
    SELECT 
        fn.origin_user,
        f.follower_user_id,
        fn.connection_depth + 1,
        CONCAT(fn.connection_path, '->', f.follower_user_id)
    FROM follower_network fn
    JOIN follows f ON fn.connected_user = f.following_user_id
    WHERE fn.connection_depth < 4 -- Stop at 4 degrees
)
SELECT 
    origin_user,
    connected_user,
    connection_depth,
    connection_path
FROM follower_network
ORDER BY connection_depth, connected_user;
