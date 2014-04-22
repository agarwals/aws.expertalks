-- Run as user with privileges to create any objects in the database:

-- Create database
create database ysrtc;

-- Grant access to application user
grant all on ysrtc.* to 'ysrtc'@'%' identified by 'ysrtc'; flush privileges;

----------------------------------------
-- CREATE table in database ysrtc
----------------------------------------

-- Run as user ysrtc on database ysrtc:

-- Create tickets table
create table tickets(
  id INT AUTO_INCREMENT PRIMARY KEY,
  booked_by VARCHAR(255) NOT NULL,
  booked_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
