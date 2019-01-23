CREATE TABLE CONTRACT (
  cli_ins_id int,
  client_id CHAR(5),
  insurer_id VARCHAR(10),
  Primary Key (cli_ins_id),
  Constraint FK_client_id
  Foreign Key (client_id) References CLIENT (client_id)
)
Alter table Contract  
add constraint FK_insurer_id
foreign key(insurer_id) references INSURER (Insurer_id)
);


CREATE TABLE MEM_PHYS (
  mem_phys_id VARCHAR(20),
  mem_id CHAR(10),
  phys_id VARCHAR(10),
  Primary Key (mem_phys_id),
  Constraint FK_mem_id
  Foreign Key (mem_id) References MEMBER (mem_id) 
);
Alter table MEM_PHYS
add constraint FK_phys_id
foreign key(phys_id) references PHYSICIAN (phys_id)
);

CREATE TABLE INSURER (
  insurer_id VARCHAR(10),
  insurer_name VARCHAR(20),
  insurer_phone VARCHAR(12),
  Primary Key (insurer_id)
);

CREATE TABLE ASSIGNMENTS (
  assign_id INT,
  emp_id VARCHAR(10),
  mem_id CHAR(10),
  Primary Key (assign_id),
  Constraint FK_emp_id
  Foreign key(emp_id) references RESOURCES (emp_id)
);
Alter table ASSIGNMENTS
add constraint FK2_mem_id
foreign key(mem_id) references MEMBER (mem_id)
);


CREATE TABLE RESOURCES (
  emp_id VARCHAR(10),
  emp_fname VARCHAR(15),
  emp_lname VARCHAR(30),
  emp_state CHAR(2),
  emp_gender CHAR(1),
  emp_schedule VARCHAR(255),
  emp_phone VARCHAR(12),
  Primary Key (emp_id)
);

CREATE TABLE CLIENT (
  client_id CHAR(5),
  mms_contract VARCHAR(30),
  client_address VARCHAR(10),
  client_city VARCHAR(25),
  client_state CHAR(2),
  client_zip_code VARCHAR(5),
  client_phone VARCHAR(12),
  Primary Key (client_id)
);

CREATE TABLE PHYSICIAN (
  phys_id VARCHAR(10),
  phys_fname VARCHAR(15),
  phys_lname VARCHAR(30),
  phys_address VARCHAR(10),
  phys_city VARCHAR(25),
  phys_state CHAR(2),
  phys_zip_code VARCHAR(5),
  phys_gender CHAR(1),
  specialization VARCHAR(255),
  experience INT,
  phys_phone VARCHAR(12),
  Primary Key (phys_id)
);

CREATE TABLE ELECTION (
  election_id INT,
  cli_ins_id INT,
  mem_id CHAR(10),
  Primary Key (election_id),
  constraint FK1cli_ins_id
  Foreign Key (cli_ins_id) References Contract (cli_ins_id)
);
  Alter table ELECTION 
 add constraint FK1_mem_id
 foreign key (mem_id) references MEMBER (mem_id)
 );

CREATE TABLE PHYS_CONTRACT (
  insur_phys_id INT,
  phys_id VARCHAR(10),
  insurer_id VARCHAR(10),
  Primary Key (insur_phys_id),
  Constraint FK2_Phys_id
  Foreign Key (phys_id) References PHYSICIAN (phys_id)
 );
 Alter table PHYS_CONTRACT  
 add constraint FK2_insurer_id
 foreign key (insurer_id) references INSURER (insurer_id)
 );


CREATE TABLE MEMBER (
  mem_id CHAR(10),
  mem_fname VARCHAR(15),
  mem_lname VARCHAR(30),
  mem_age INT,
  mem_address VARCHAR(10),
  mem_city VARCHAR(25),
  mem_state CHAR(2),
  mem_zip_code VARCHAR(5),
  mem_gender CHAR(1),
  client_id CHAR(5),
  mem_phone VARCHAR(12),
  Primary Key (mem_id),
  Foreign Key (client_id) References Client (client_id)
);

ALTER TABLE MEMBER
ADD Conditions VARCHAR(255)
);