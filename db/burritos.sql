DROP TABLE IF EXISTS deals;
DROP TABLE IF EXISTS menu_items;
DROP TABLE IF EXISTS days;
DROP TABLE IF EXISTS eateries;
DROP TABLE IF EXISTS burgers;


CREATE TABLE days (
  id SERIAL2 PRIMARY KEY,
  day_name VARCHAR(255) --check IN?
);

CREATE TABLE eateries (
  id SERIAL4 PRIMARY KEY,
  eatery_name VARCHAR(255)
);

CREATE TABLE burgers (
  id SERIAL4 PRIMARY KEY,
  burger_name VARCHAR(255)
);

CREATE TABLE menu_items (
  id SERIAL4 PRIMARY KEY,
  eatery_id INT4 REFERENCES eateries(id) ON DELETE CASCADE,
  burger_id INT4 REFERENCES burgers(id) ON DELETE CASCADE,
  price DECIMAL(19,4)
);

CREATE TABLE deals (
  id SERIAL4 PRIMARY KEY,
  day_id INT4 REFERENCES days(id),
  menu_item_id INT4 REFERENCES menu_items(id),
  deal_name VARCHAR(255)
  -- applies_to
  -- operator
  -- amount
);