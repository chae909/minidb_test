use oliveyoung;

--- (1) 스킨케어 카테고리인 모든 브랜드를 찾으시오
select br_name
from brand
where category = '스킨케어';

--- (2) brand와 company Cartesian product 구하시오
create view br_comp
as select b.br_id, b.br_name, b.category, b.city, b.comp_id, c.comp_name, c.address
from brand b, company c
where b.comp_id = c.comp_id;

select *
from br_comp;

--- (3) 아모레퍼시픽 회사에서 런칭한 모든 브랜드를 찾으시오
select br_name
from br_comp
where comp_name = '아모레퍼시픽';
   
--- (4) 브랜드별 평균 제품 금액을 구하시오
select b.br_name, avg(price)
from product p, brand b
where p.br_id = b.br_id
group by b.br_name;

--- (5) order_info와 product Cartesian product 구하시오
create view order_pd
as select o.od_id, o.cust_id, o.cust_name, o.pd_id, p.pd_name, p.price, p.br_id
from order_info o, product p
where o.pd_id = p.pd_id;

select *
from order_pd;
        
--- (6) 평균 구매 금액이 20000원이 넘는 고객의 이름을 찾으시오
select cust_name, avg(price)
from order_pd
group by cust_name
having avg(price) > 20000;
 
--- (7) 카테고리별 가장 비싼 제품을 나타내시오
select b.category, MAX(price)
from product p, brand b
where p.br_id = b.br_id
group by b.category;

--- (8) 평균 제품 가격보다 더 비싼 가격의 제품을 판매하는 회사 이름, 브랜드, 제품이름과 그 가격을 나타내시오
SELECT c.comp_name, c.br_id, p.pd_name, p.price
FROM br_comp c, product p
WHERE c.br_id = p.br_id and
		p.price > (SELECT AVG(price) FROM product);
        
--- (9) 3개 이상의 제품을 구매한 고객의 이름을 찾으시오
SELECT c.cust_name
FROM customer c
WHERE (SELECT COUNT(o.od_id)
	   FROM order_info o
       WHERE o.cust_id = c.cust_id) > 3;
       
--- (10) 카테고리별 최저가 제품의 이름과 그 가격을 나타내시오
SELECT b1.category, p1.pd_name, p1.price
FROM order_pd p1, brand b1
WHERE p1.br_id = b1.br_id and 
	p1.price = (SELECT MIN(p2.price)
				FROM order_pd p2, brand b2
                WHERE p2.br_id = b2.br_id and b2.category = b1.category);