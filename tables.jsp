create table pycustomer (uname varchar2(100),addr varchar2(200),city varchar2(100),mobile varchar2(20),userid varchar2(200) primary key,pwd varchar2(50));

create table pyadmin (userid varchar2(100) primary key,pwd varchar2(50));
insert into pyadmin values('admin','admin');

create table pymedicine(mtype varchar2(50),mname varchar2(100) primary key,mbrand varchar2(100),mprice varchar2(50),stock int default(0));

create table pyuploads(userid varchar2(100),fname varchar2(500),ftype varchar2(200),ctime varchar2(100));

create table pysales (dt varchar2(50),userid varchar2(100),mname varchar2(100),qty int);