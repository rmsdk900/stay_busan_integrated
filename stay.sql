desc user;

desc 

select * from user;
select * FROM rooms;

select * FROM room_img;

select * FROM amenity;

select * from room_closed;

select * from buy;

select * from money;

UPDATE buy SET b_status = 1 WHERE b_date_from<=now();

UPDATE user SET u_balance= u_balance+any
(SELECT m_price FROM money WHERE b_no=any
(SELECT b_no FROM buy WHERE b_status=1 AND b_date_from <= now())) 
WHERE u_no=any(
SELECT m_u_h_no FROM money 
WHERE b_no=any(
SELECT b_no FROM buy WHERE b_status=1 AND b_date_from <= now())) ;

select * from user;


