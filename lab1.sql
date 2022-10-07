create table employees1 (
employee_id int identity(1,1) primary key,
employee_name varchar(50) not null,
salary decimal(8,2) check (salary>0),
employment_date date default getdate(),
pesel char(11) not null unique,
date_of_birth date check(date_of_birth<=getdate())

)
create index employee_name_index on employees1(employee_name)

create table sprzedaz(
id_operacji smallint identity primary key,
id_faktury varchar(30) not null unique,
kategoria varchar(20) default('obuwie') not null,
data_sprzedazy date default(getdate()) check(data_sprzedazy<=getdate()),
kwota_sprzedazy money not null check(kwota_sprzedazy>0),
rabat tinyint default(0) not null check(rabat>=0 and rabat<=15),
liczba_pozycji tinyint default(1) not null check(liczba_pozycji>0 and liczba_pozycji<=100)
)

create index id_faktury_index on sprzedaz(id_faktury)
create index kategoria_index on sprzedaz(kategoria)




