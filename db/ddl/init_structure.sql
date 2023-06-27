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

CREATE TABLE IF NOT EXISTS promo(
    id_promo SERIAL PRIMARY KEY,
    product_id INTEGER,
    shop_name VARCHAR(100),
    discount INTEGER,
    promo_date date,
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE SET NULL
)