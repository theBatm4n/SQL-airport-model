
select distinct test#,plane_reg#
from Done_by natural join Test
where done_date < To_date('2023/10/01','yyyy/mm/dd') and score = (  select MAX(score) 
                                                                    From Done_by natural join Test
                                                                    Where done_date < To_date('2023/10/01','yyyy/mm/dd'));
                                                                    
                                                                    
select employee_ID, tech_name, phone#
from  Technician_Table natural join Technician_phone
where city ='New York' and skill_level = 8;


select model#,capacity,weight
from Model natural join Plane
group by model#,capacity,weight
having count(plane.plane_reg#) > 500;


select distinct plane_reg#, test#, test_name
from test natural join done_by
where EXTRACT(Month from done_date) != 10;


select distinct plane_reg#,test#,score 
from Test natural join Done_by
where test_name = 'Controller System Test' and employee_id = 12345678 
MINUS
select distinct plane_reg#,test#,score 
from Test natural join Done_by
where test_name = 'Controller System Test' and employee_id = 23456789; 
