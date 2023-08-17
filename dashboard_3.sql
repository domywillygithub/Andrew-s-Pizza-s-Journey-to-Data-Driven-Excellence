/*For the third dashboard we need to write a SQL Query that will help us get data in order to retrieve insights for:
1. Total staff cost
2. Total staff working hours
3. List of staff working schedule
*/

select 
r.date,
s.first_name,
s.last_name,
sh.starttime,
sh.endtime,
s.hourly_rate,
(hour(timediff(sh.endtime,sh.starttime))*60 + (minute(timediff(sh.endtime, sh.starttime))))/60 as hours_in_shift,
(hour(timediff(sh.endtime,sh.starttime))*60 + (minute(timediff(sh.endtime, sh.starttime))))/60 * s.hourly_rate as staff_cost
from rotation r
left join staff s on r.staff_id = s.staff_id
left join shift sh on sh.shift_id = r.shift_id; 