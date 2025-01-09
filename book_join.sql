SELECT
	bt.book_id,
    bt.book_name,
    bt.isbn,
    bt.author_id,
    `at`.author_id as at_author_id,
    at.author_name,
    bt.publisher_id,
    pt.publisher_id as pt_publisher_id,
    pt.publisher_name,
    bt.category_id,
    ct.category_id as ct_category_id,
    ct.category_name,
    bt.book_img_url
FROM
	book_tb bt
    left outer join author_tb `at` on `at`.author_id = bt.author_id
    left outer join category_tb ct on ct.category_id = bt.category_id
    left outer join publisher_tb pt on pt.publisher_id = bt.publisher_id
where
	bt.category_id between 10 and 100;
    
    
SELECT
    bt.publisher_id,
    pt.publisher_name,
    count(bt.book_id) as book_count
    -- count, sum, avg, min, max 등이 있다
FROM
	book_tb bt
    left outer join author_tb `at` on `at`.author_id = bt.author_id
    left outer join category_tb ct on ct.category_id = bt.category_id
    left outer join publisher_tb pt on pt.publisher_id = bt.publisher_id
group by
	bt.publisher_id,
    pt.publisher_name
having
	book_count > 10
order by
	bt.publisher_id
limit 0, 10 -- 시작인덱스, 가지고 올 갯수

-- from -> where -> group by -> having -> select -> order by -> limit