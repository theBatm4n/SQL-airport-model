drop table Expert_of;
drop table Done_by;
drop table Test;
drop table Plane;
drop table Model;
drop table Controller_Table;
drop table Technician_phone;
drop table Technician_Table;
drop table Employee_Table;

CREATE TABLE Employee_Table
(
    employee_ID number(8),
    union_mem# number(8),
    primary key(employee_ID)
);


CREATE TABLE Technician_Table
(
    employee_ID number(8),
    tech_name varchar2(80) not null,
    skill_level number(2) not null,
    salary number(7) not null,
    city varchar2(80),
    street varchar2(80),
    house# number(4),
    primary key(employee_ID),
    Foreign key(employee_ID) References Employee_Table(employee_ID)
);


CREATE TABLE Technician_phone
(
    employee_ID number(8),
    phone# number(8),
    Primary key(employee_ID, phone#),
    Foreign key(employee_ID) References Technician_table(employee_ID)
);


CREATE TABLE Controller_Table
(
    employee_ID number(8),
    exam_date date,
    primary key(employee_ID),
    Foreign key(employee_ID) References Employee_Table(employee_ID)
);


CREATE TABLE Model
(
    model# number(6) Not null,
    capacity number(4),
    weight number(5),
    primary key(model#)
);


CREATE TABLE Plane
(
    plane_reg# number(10),
    model# number(6),
    Primary key(plane_reg#),
    Foreign key(model#) References Model(model#)
);


CREATE TABLE Test
(
    test# varchar2(3),
    plane_reg# number(10),
    test_name varchar2(80) not null,
    score number(3) not null,
    Primary key(test#, plane_reg#),
    Foreign key(plane_reg#) References Plane(plane_reg#)
);


CREATE TABLE Done_by
(
    test# varchar2(3),
    plane_reg# number(10),
    employee_ID number(8),
    hours number(3) not null,
    done_date date not null,
    Primary key(test#, plane_reg#, employee_ID),
    Foreign key(test#,plane_reg#) References Test(test#,plane_reg#),
    Foreign key(employee_ID) References Technician_table(employee_ID)
);


CREATE TABLE Expert_of
(
    employee_ID number(8),
    model# number(6),
    Primary key(employee_ID, model#),
    Foreign key(employee_ID) References Technician_table(employee_ID),
    Foreign key(model#) References Model(model#)
);
