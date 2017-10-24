-- Fund Table
create table fund(
name varchar(50) not null,
primary key(name), 
qb_acct varchar(5) not null);

-- contribution table
create table contribution(
    ID varchar(10) not null auto_increment,
    primary key(ID),
    amt numeric(10,2) not null,
    c_date date not null,
    note varchar(255),
    c_type varchar(5) not null,
    fund_name varchar(40),
    env_num int default 0,
    foreign key (env_num) references donor(env_num),
    foreign key (fund_name) references fund(name));

    
 -- donor table
create table donor(
    env_num int not null,
    primary key(env_num),
    f_name varchar(40) not null,
    l_name varchar(40) not null,
    street varchar(75) not null,
    city varchar(40) default "Wichita Falls",
    state varchar(2) default "TX",
    zip int not null,
    email varchar(75),
    mail_pref enum('printed', 'electronic') default 'printed');
    
    