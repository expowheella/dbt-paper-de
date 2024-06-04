select
    distinct op.message_id,
    op.operation,
    am.amount,
    pt.publish_time,
    et.type
from
    paper-de.dbt_paper_de.operation op
    left join paper-de.dbt_paper_de.pub_time pt on pt.message_id = op.message_id
    left join paper-de.dbt_paper_de.event_type et on et.message_id = op.message_id
    left join paper-de.dbt_paper_de.amount am on am.message_id = op.message_id
where
    amount is not null
order by
    pt.publish_time