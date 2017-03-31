DROP TABLE IF EXISTS deals;
DROP TABLE IF EXISTS menu_items;
DROP TABLE IF EXISTS days;
DROP TABLE IF EXISTS eateries;
DROP TABLE IF EXISTS burritos;


CREATE TABLE days (
  id SERIAL2 PRIMARY KEY,
  day_name VARCHAR(255) NOT NULL
);

CREATE TABLE eateries (
  id SERIAL4 PRIMARY KEY,
  eatery_name VARCHAR(255)
);

CREATE TABLE burritos (
  id SERIAL4 PRIMARY KEY,
  burrito_name VARCHAR(255)
);

CREATE TABLE menu_items (
  id SERIAL4 PRIMARY KEY,
  eatery_id INT4 REFERENCES eateries(id) ON DELETE CASCADE,
  burrito_id INT4 REFERENCES burritos(id) ON DELETE CASCADE,
  price DECIMAL(19,4)
);

CREATE TABLE deals (
  id SERIAL4 PRIMARY KEY,
  day_id INT4 REFERENCES days(id) ON DELETE CASCADE,
  menu_item_id INT4 REFERENCES menu_items(id) ON DELETE CASCADE,
  deal_name VARCHAR(255) NOT NULL
  -- applies_to
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