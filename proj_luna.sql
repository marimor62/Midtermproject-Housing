USE house_price_regression;

CREATE TABLE house_price_data (
	id BIGINT,
	date_sold CHAR(10),
	bedrooms DECIMAL,
	bathrooms DECIMAL,
	sqft_living INT,
	sqft_lot INT,
	floors SMALLINT,
	waterfront BOOL,
	view SMALLINT,
	cond SMALLINT,
	grade SMALLINT,
	sqft_above INT,
	sqft_basement INT,
	yr_built INT,
	yr_renovated INT,
	zipcode INT,
	latitude DECIMAL(7,4),
	longitude DECIMAL(7,4),
	sqft_living15 INT,
	sqft_lot15 INT,
	price INT );
    
SELECT *
FROM house_price_data;
    
ALTER TABLE house_price_data DROP date_sold;


SELECT COUNT(*)
FROM house_price_data;

# ID and price of the 10 most expensive houses
SELECT id, price
FROM house_price_data
ORDER BY price DESC;

# no terminado
SELECT id, bedrooms, bathrooms, floors, waterfront, conditions, grade, price
FROM house_price_data
WHERE bedrooms ;



# Average price of all the properties in the data
SELECT AVG(price)
FROM house_price_data;






    