desc user;

desc 

select * from user;
select * FROM rooms;

select * FROM room_img;

select * FROM amenity;

select * from room_closed;

select * from buy;

select * from money;

UPDATE buy SET b_status = 2 WHERE b_date_from<=now();

select * from user;

select * from comment;

SELECT m_u_h_no, m_price FROM money WHERE b_no=(SELECT b_no FROM buy WHERE b_date_from<=now() AND b_status=1);
SELECT b_no FROM buy WHERE b_date_from<=now() AND b_status=1;


