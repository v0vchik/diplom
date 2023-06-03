CREATE DATABASE ItClub;
USE ItClub;
CREATE TABLE PC (
pc_id INT NOT NULL PRIMARY KEY,
pc_name VARCHAR(100) NOT NULL,
pc_cpu VARCHAR(100) NOT NULL,
pc_gpu VARCHAR(100) NOT NULL,
pc_ram INT NOT NULL,
pc_memory_type VARCHAR(100) NOT NULL,
pc_memory_size INT NOT NULL
);	
CREATE TABLE DEV (
dev_name VARCHAR(100) NOT NULL PRIMARY KEY,
pc_id int NOT NULL,
FOREIGN KEY (pc_id) REFERENCES PC(pc_id),
dev_username VARCHAR(100) NOT NULL,
dev_start DATE NOT NULL,
dev_end DATE NOT NULL,
dev_comments VARCHAR(100) NOT NULL
);
CREATE TABLE SYS (
sys_name VARCHAR(100) NOT NULL PRIMARY KEY,
pc_id int NOT NULL,
FOREIGN KEY (pc_id) REFERENCES PC(pc_id),
sys_username VARCHAR(100) NOT NULL,
sys_start DATE NOT NULL,
sys_end DATE NOT NULL,
sys_comments VARCHAR(100) NOT NULL
);
CREATE TABLE CYB (
cyb_name VARCHAR(100) NOT NULL PRIMARY KEY,
pc_id int NOT NULL,
FOREIGN KEY (pc_id) REFERENCES PC(pc_id),
cyb_username VARCHAR(100) NOT NULL,
cyb_start DATE NOT NULL,
cyb_end DATE NOT NULL,
cyb_comments VARCHAR(100) NOT NULL
);
CREATE TABLE Application (
pc_name VARCHAR(100) NOT NULL,
FOREIGN KEY (pc_name) REFERENCES DEV(dev_name),
FOREIGN KEY (pc_name) REFERENCES SYS(sys_name),
FOREIGN KEY (pc_name) REFERENCES CYB(cyb_name),
app_name VARCHAR(100) NOT NULL,
app_publisher VARCHAR(100) NOT NULL,
app_date_installation DATE NOT NULL,
app_date_publisher DATE NOT NULL
);
