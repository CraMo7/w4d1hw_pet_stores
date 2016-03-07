CREATE TABLE stores (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  category VARCHAR(255)
);
SELECT * FROM stores;

CREATE TABLE pets (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR (255), 
  breed VARCHAR(255),
  age INT2,
  store_id REFERENCES stores(id)
);
SELECT * FROM pets;