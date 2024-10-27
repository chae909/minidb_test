create database oliveyoung;
use oliveyoung;
create table company
	(comp_id		varchar(3), 
	 comp_name		varchar(30), 
	 address		varchar(50),
     primary key (comp_id)
     );

create table brand
	(br_id		varchar(4), 
     br_name    varchar(30),
	 category   varchar(20), 
     city 		varchar(20),
     comp_id	varchar(3),
	 primary key (br_id),
     foreign key (comp_id) references company(comp_id)
		on delete set null
	);

create table product
	(pd_id			varchar(3), 
	 pd_name		varchar(30),
	 price			varchar(7), 
     br_id			varchar(4),
     primary key (pd_id),
	 foreign key (br_id) references brand(br_id)
		on delete cascade
	);

create table customer
	(cust_id		varchar(2),
	 cust_name		varchar(30), 
	 primary key (cust_id)
     );
     
CREATE INDEX idx_cust_name ON customer(cust_name);
     
create table order_info
	(od_id		varchar(3), 
     cust_id		varchar(2),
	 cust_name		varchar(30), 
     pd_id			varchar(3),
     foreign key (cust_id) references customer(cust_id)
		on delete cascade,
	 foreign key (cust_name) references customer(cust_name)
		on delete cascade,
	 foreign key (pd_id) references product(pd_id),
	primary key (od_id)
     );
     
insert into company values ('A02', '에임케이', '강남구');
insert into company values ('L01', 'LG', '종로구');
insert into company values ('R01', '라엘', '강남구');
insert into company values ('I01', '아이패밀리', '송파구');
insert into company values ('B02', '비모뉴먼트', '마포구');
insert into company values ('T01', '더파운더스', '서초구');
insert into company values ('B01', '바람', '강남구');
insert into company values ('A01', '아모레퍼시픽', '용산구');
insert into company values ('F01', '포컴퍼니', '송파구');
insert into company values ('G01', '고운세상', '분당구');
select * from company;

insert into brand values ('L001', 'LABO.H', '헤어케어', '서울시', 'A01');
insert into brand values ('D001', 'Dr.G', '스킨케어', '성남시', 'G01');
insert into brand values ('E001', 'Espoir', '메이크업', '서울시', 'A01');
insert into brand values ('E002', 'Etude', '메이크업', '서울시', 'A01');
insert into brand values ('A001', 'Abib', '스킨케어', '서울시', 'F01');
insert into brand values ('A002', 'Aestura', '스킨케어', '서울시', 'A01');
insert into brand values ('D002', 'DearDarhlia', '메이크업', '서울시', 'B01');
insert into brand values ('A003', 'Anua', '스킨케어', '서울시', 'T01');
insert into brand values ('D003', 'dAlba', '스킨케어', '서울시', 'B02');
insert into brand values ('R001', 'Romand', '메이크업', '서울시', 'I01');
insert into brand values ('R002', 'Rael', '위생용품', '서울시', 'R01');
insert into brand values ('C001', 'CNP', '스킨케어', '서울시', 'L01');
insert into brand values ('C002', 'Corman', '위생용품', '서울시', 'A02');
select * from brand;

insert into product values ('P01', '컨디셔너', '20000', 'L001');
insert into product values ('P02', '샴푸', '19000', 'L001');
insert into product values ('P03', '수딩크림', '15000', 'D001');
insert into product values ('P04', '수딩토너', '12000', 'D001');
insert into product values ('P05', '벨벳쿠션', '18000', 'E001');
insert into product values ('P06', '더브로우펜슬', '9000', 'E001');
insert into product values ('P07', '순정선크림', '13000', 'E002');
insert into product values ('P08', '재창조쉐딩', '12000', 'E002');
insert into product values ('P09', '어성초마스크팩', '12000', 'A001');
insert into product values ('P10', '부활초세럼', '23000', 'A001');
insert into product values ('P11', '액티브세럼', '35000', 'A002');
insert into product values ('P12', '레드진정선크림', '20000', 'A002');
insert into product values ('P13', '파우더브러시', '21000', 'D002');
insert into product values ('P14', '페탈블러쉬', '25000', 'D002');
insert into product values ('P15', '어성초패드', '33000', 'A003');
insert into product values ('P16', '비타씨잡티세럼', '19000', 'A003');
insert into product values ('P17', '워터풀쿠션', '33000', 'D003');
insert into product values ('P18', '워터풀선크림', '18000', 'D003');
insert into product values ('P19', '글래스팅글로스', '13000', 'R001');
insert into product values ('P20', '배러댄치크', '12000', 'R001');
insert into product values ('P21', '순면오버나이트', '8000', 'R002');
insert into product values ('P22', '슈퍼롱라이너', '5500', 'R002');
insert into product values ('P23', '더마텐션크림', '30000', 'C001');
insert into product values ('P24', '프로폴리스앰플', '10000', 'C001');
insert into product values ('P25', '인티미트워시', '13000', 'C002');
insert into product values ('P26', '오가닉화장솜', '4500', 'C002');
select * from product;

insert into customer values ('01', '김채원');
insert into customer values ('02', '허윤진');
insert into customer values ('03', '홍은채');
insert into customer values ('04', '김은정');
insert into customer values ('05', '김민지');
insert into customer values ('06', '강해린');
insert into customer values ('07', '이혜인');
insert into customer values ('08', '김유정');
insert into customer values ('09', '신혜선');
insert into customer values ('10', '이성경');
insert into customer values ('11', '김고은');
insert into customer values('12', '고윤정');
insert into customer values('13', '안유진');
insert into customer values('14', '이영지');
select * from customer;

insert into order_info values('O01', '01', '김채원', 'P01');
insert into order_info values('O02', '01', '김채원', 'P05');
insert into order_info values('O03', '02', '허윤진', 'P08');
insert into order_info values('O04', '02', '허윤진', 'P10');
insert into order_info values('O05', '03', '홍은채', 'P02');
insert into order_info values('O06', '03', '홍은채', 'P09');
insert into order_info values('O07', '03', '홍은채', 'P20');
insert into order_info values('O08', '04', '김은정', 'P26');
insert into order_info values('O09', '05', '김민지', 'P03');
insert into order_info values('O10', '05', '김민지', 'P04');
insert into order_info values('O11', '06', '강해린', 'P07');
insert into order_info values('O12', '08', '김유정', 'P25');
insert into order_info values('O13', '08', '김유정', 'P11');
insert into order_info values('O14', '09', '신혜선', 'P24');
insert into order_info values('O15', '09', '신혜선', 'P12');
insert into order_info values('O16', '09', '신혜선', 'P23');
insert into order_info values('O17', '09', '신혜선', 'P13');
insert into order_info values('O18', '10', '이성경', 'P15');
insert into order_info values('O19', '10', '이성경', 'P14');
insert into order_info values('O20', '11', '김고은', 'P22');
insert into order_info values('O21', '12', '고윤정', 'P21');
insert into order_info values('O22', '13', '안유진', 'P17');
insert into order_info values('O23', '13', '안유진', 'P19');
insert into order_info values('O24', '13', '안유진', 'P18');
insert into order_info values('O25', '14', '이영지', 'P25');
insert into order_info values('O26', '14', '이영지', 'P12');
insert into order_info values('O27', '14', '이영지', 'P04');
insert into order_info values('O28', '07', '이혜인', 'P23');
insert into order_info values('O29', '07', '이혜인', 'P19');
insert into order_info values('O30', '07', '이혜인', 'P06');
insert into order_info values('O31', '07', '이혜인', 'P12');
select * from order_info;
