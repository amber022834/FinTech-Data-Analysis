SELECT 
    event_name AS '申辦流程階段',
    COUNT(DISTINCT user_id) AS '剩餘人數'
FROM web_activity_log
GROUP BY event_name
ORDER BY 
    CASE 
        WHEN event_name = '1. 進入開戶首頁' THEN 1
        WHEN event_name = '2. 簡訊驗證成功' THEN 2
        WHEN event_name = '3. 證件拍照上傳' THEN 3
        WHEN event_name = '4. 送出申請完成' THEN 4
        ELSE 5
    END;
