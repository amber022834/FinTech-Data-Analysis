INSERT INTO web_activity_log (user_id, event_name)
WITH RECURSIVE seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq WHERE n < 100
)
SELECT n, '1. 進入開戶首頁' FROM seq;

-- 1. 從通過'進入開戶首頁'的人隨機抽 75 人進入第二關
INSERT INTO web_activity_log (user_id, event_name)
SELECT user_id, '2. 簡訊驗證成功' 
FROM web_activity_log 
WHERE event_name = '1. 進入開戶首頁' 
ORDER BY RAND() 
LIMIT 75;

-- 2. 從通過'簡訊驗證成功'的人隨機抽 35 人進入第三關
INSERT INTO web_activity_log (user_id, event_name)
SELECT user_id, '3. 證件拍照上傳' 
FROM web_activity_log 
WHERE event_name = '2. 簡訊驗證成功' 
ORDER BY RAND() 
LIMIT 35;

-- 3. 從通過'證件拍照上傳'的人隨機抽 30 人進入第三關
INSERT INTO web_activity_log (user_id, event_name)
SELECT user_id, '4. 送出申請完成' 
FROM web_activity_log 
WHERE event_name = '3. 證件拍照上傳' 
ORDER BY RAND() 
LIMIT 30;

SELECT 
    event_name AS '階段',
    COUNT(DISTINCT user_id) AS '人數'
FROM web_activity_log
GROUP BY event_name
ORDER BY 階段;
