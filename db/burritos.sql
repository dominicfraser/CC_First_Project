DROP TABLE IF EXISTS deals;
DROP TABLE IF EXISTS menu_items;
DROP TABLE IF EXISTS burritos;
DROP TABLE IF EXISTS burrito_categories;
DROP TABLE IF EXISTS eateries;
DROP TABLE IF EXISTS days;


CREATE TABLE days (
  id SERIAL2 PRIMARY KEY,
  day_name VARCHAR(255) NOT NULL
);

CREATE TABLE eateries (
  id SERIAL4 PRIMARY KEY,
  eatery_name VARCHAR(255)
);


CREATE TABLE food_categories (
  id SERIAL4 PRIMARY KEY,
  category VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE burritos (
  id SERIAL4 PRIMARY KEY,
  burrito_name VARCHAR(255),
  burrito_cat INT REFERENCES food_categories(id) ON DELETE CASCADE
);

CREATE TABLE menu_items (
  id SERIAL4 PRIMARY KEY,
  eatery_id INT4 REFERENCES eateries(id) ON DELETE CASCADE,
  burrito_id INT4 REFERENCES burritos(id) ON DELETE CASCADE,
  price DECIMAL(19,4) CHECK (price>0)
);

CREATE TABLE deals (
  id SERIAL4 PRIMARY KEY,
  day_id INT4 REFERENCES days(id) ON DELETE CASCADE,
  menu_item_id INT4 REFERENCES menu_items(id) ON DELETE CASCADE,
  deal_name VARCHAR(255) NOT NULL,
  burrito_cat INT REFERENCES food_categories(id) ON DELETE CASCADE
  -- operator
  -- amount
);



-- deals at each eatery:
-- SELECT e.*, d.deal_name FROM eateries e
-- INNER JOIN menu_items m 
-- ON e.id=m.eatery_id
-- INNER JOIN deals d
-- ON d.menu_item_id=m.id
-- WHERE e.id = ;