
with base_query
as
(
	select ...
		, hours_diff
	from x
)
select ...
	, to_number(to_char(b.start_time, 'hh24')) + l.level - 1 as mhour
from base_query b
	inner join (
		select level
		from dual
		connect by level <= (select max(hours_diff) from base_query)
	) l on b.hours_diff <= l.level