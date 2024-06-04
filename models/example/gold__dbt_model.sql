SELECT
    deduped.message_id,
    deduped.operation,
    deduped.amount,
    deduped.publish_time,
    deduped.type
FROM
    (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY type
                ORDER BY
                    publish_time DESC
            ) AS row_num
        FROM
            paper-de.streaming.raw_events
    ) AS deduped
WHERE
    row_num = 1
ORDER BY
    deduped.publish_time asc;