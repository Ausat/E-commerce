create database Ecommerce;
use Ecommerce;
create table role(rollid int primary key auto_increment, title varchar(20));

create table user(userid int primary key auto_increment,rollid int,uname varchar(50),password varchar(10),foreign key(rollid) references role(rollid));


create table orderr(oid int primary key auto_increment,odate date,uid int,status varchar(10),total int, foreign key(uid) references user(userid));


create table payment(pid int primary key auto_increment,pdate date,amount int,module varchar(10),oid int, foreign key(oid) references orderr(oid));

create table productt(pid int primary key auto_increment,uid int,stock_avai int,category varchar(20),type varchar(10),unitprice int,image_url varchar(50),foreign key(uid) references user(userid));

create table itemdetails(itemid int primary key auto_increment,productid int,qty int,orderid int, foreign key(productid) references productt(pid),foreign key (orderid) references orderr(oid));


 create table shipment(shipid int primary key auto_increment,userid int,shipdate date,orderid int, status varchar(50), foreign key(userid) references user(userid),foreign key (orderid) references orderr(oid));