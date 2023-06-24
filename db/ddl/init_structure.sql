CREATE TABLE IF NOT EXISTS product(
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(100),
    price INTEGER
);

CREATE TABLE IF NOT EXISTS plan(
    plan_date DATE,
    product_id INTEGER,
    plan_cnt INTEGER,
    shop_name VARCHAR(100),
    PRIMARY KEY (plan_date, product_id, shop_name),
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS shop_dns(
    date DATE,
    product_id INTEGER,
    sales_cnt INTEGER,
    PRIMARY KEY (date, product_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS shop_mvideo(
    date DATE,
    product_id INTEGER,
    sales_cnt INTEGER,
    PRIMARY KEY (date, product_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS shop_sitilink(
    date DATE,
    product_id INTEGER,
    sales_cnt INTEGER,
    PRIMARY KEY (date, product_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE SET NULL
);


-- CREATE TABLE IF NOT EXISTS author(
--     id_author SERIAL PRIMARY KEY,
--     full_name VARCHAR(100)
-- );
--
-- CREATE TABLE IF NOT EXISTS genre(
--     id_genre SERIAL PRIMARY KEY,
--     genre_name VARCHAR(30)
-- );
--
-- CREATE TABLE IF NOT EXISTS city(
--     id_city SERIAL PRIMARY KEY,
--     city VARCHAR(50)
-- );
--
-- CREATE TABLE IF NOT EXISTS publisher(
--     id_publisher SERIAL PRIMARY KEY,
--     name VARCHAR(30),
--     id_city INTEGER,
--     FOREIGN KEY (id_city) REFERENCES city (id_city) ON DELETE SET NULL
-- );
--
-- CREATE TABLE IF NOT EXISTS address(
--     id_address SERIAL PRIMARY KEY,
--     id_city INTEGER,
--     postcode VARCHAR(20),
--     street VARCHAR(100),
--     house_number VARCHAR(20),
--     apartment_number VARCHAR(20),
--     FOREIGN KEY (id_city) REFERENCES city (id_city) ON DELETE SET NULL
-- );
--
-- CREATE TABLE IF NOT EXISTS reader (
--     id_reader SERIAL PRIMARY KEY,
--     full_name VARCHAR(100),
--     id_address INTEGER,
--     phone VARCHAR(20),
--     FOREIGN KEY (id_address) REFERENCES address (id_address) ON DELETE  SET NULL
-- );
--
-- CREATE TABLE IF NOT EXISTS operation_type(
--     id_type SERIAL PRIMARY KEY,
--     type_name VARCHAR(30)
-- );
--
-- CREATE TABLE IF NOT EXISTS storage(
--     id_storage SERIAL PRIMARY KEY,
--     rack_number INTEGER,
--     shelf_number INTEGER
-- );
--
-- CREATE TABLE IF NOT EXISTS book (
--     id_book SERIAL PRIMARY KEY,
--     id_publisher INTEGER,
--     id_storage INTEGER,
--     name VARCHAR(50),
--     publishing_year DATE,
--     pages_number INTEGER,
--     price FLOAT(2),
--     is_available BOOLEAN DEFAULT True,
--     FOREIGN KEY (id_publisher) REFERENCES publisher (id_publisher) ON DELETE SET NULL,
--     FOREIGN KEY (id_storage) REFERENCES storage (id_storage) ON DELETE SET NULL
-- );
--
-- CREATE TABLE IF NOT EXISTS authors (
--     id SERIAL PRIMARY KEY,
--     id_book INTEGER,
--     id_author INTEGER,
--     FOREIGN KEY (id_book) REFERENCES book (id_book) ON DELETE SET NULL,
--     FOREIGN KEY (id_author) REFERENCES author (id_author) ON DELETE SET NULL
-- );
--
-- CREATE TABLE IF NOT EXISTS genres (
--     id SERIAL PRIMARY KEY,
--     id_book INTEGER,
--     id_genre INTEGER,
--     FOREIGN KEY (id_book) REFERENCES book (id_book) ON DELETE SET NULL,
--     FOREIGN KEY (id_genre) REFERENCES genre (id_genre) ON DELETE SET NULL
-- );
--
-- CREATE TABLE IF NOT EXISTS operation (
--     id_operation SERIAL PRIMARY KEY,
--     id_book INTEGER,
--     id_reader INTEGER,
--     id_type INTEGER,
--     date DATE,
--     FOREIGN KEY (id_book) REFERENCES book (id_book) ON DELETE SET NULL,
--     FOREIGN KEY (id_reader) REFERENCES reader (id_reader) ON DELETE SET NULL,
--     FOREIGN KEY (id_type) REFERENCES operation_type (id_type) ON DELETE SET NULL
-- );
--
