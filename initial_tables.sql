create table Member (
	id int not null auto_increment primary key,
    name varchar (50) not null,
    address varchar (50) not null,
    email varchar (50),
    phone varchar (13) not null,
    membership_type varchar (30) not null,
    membership_start date,
    membership_end date
);

create table Book (
	id int not null auto_increment primary key,
    title varchar (50) not null,
    author varchar (50) not null,
    isbn varchar (30) not null,
    genre varchar (30),
    publication_year date,
    number_page int,
    availability bool
);

create table Genre (
	id int not null auto_increment primary key,
    name varchar (30)
);

create table Author (
	id int not null auto_increment primary key,
    name varchar (50) not null,
    birth_date date,
    nationality varchar (30),
    biography varchar (100)
);

create table Publisher (
	id int not null auto_increment primary key,
    name varchar (50) not null,
    address varchar (50),
    contact_person varchar (50) not null,
    email varchar (50) not null,
    phone varchar (13) not null
);

create table Review (
	it int not null auto_increment primary key,
    rating varchar (10),
    review_text varchar (200),
    review_date date,
    id_book int,
    id_member int
);

create table Loan (
	id int not null auto_increment primary key,
    loan_date date,
    return_date date,
    late_fee double,
    id_book int,
    id_member int
);

create table Reservation (
	id int not null auto_increment primary key,
    reservation_date date,
    pickup_date date,
    status varchar(20),
    id_book int,
    id_member int
);

alter table Review
add foreign key (id_book) references Book (id),
add foreign key (id_member) references Member (id);

alter table Loan
add foreign key (id_book) references Book (id),
add foreign key (id_member) references Member (id);

alter table Reservation
add foreign key (id_book) references Book (id),
add foreign key (id_member) references Member (id);
