# Q1: Create a database called house_price_regression.
# CREATE DATABASE house_price_regression;
USE house_price_regression;
# Q2: Create a table house_price_data with the same columns as given in the csv file. Please make sure you use the correct data types for the columns.
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

# Q3: Select all the data from table house_price_data to check if the data was imported correctly
SELECT *
FROM house_price_data;

#Q4: Drop the column date from the database. 
# ALTER TABLE house_price_data DROP date_sold;
#Select all the data from the table to verify if the command worked. Limit your returned results to 10.
SELECT * FROM house_price_data
LIMIT 10; 

#Q5: Find how many rows of data you have.
SELECT COUNT(*)
FROM house_price_data;

#Q6: Find the unique values in some of the categorical columns
# What are the unique values in the column bedrooms?
SELECT DISTINCT bedrooms FROM house_price_data
ORDER BY bedrooms; 
# What are the unique values in the column bathrooms?
SELECT DISTINCT bathrooms FROM house_price_data
ORDER BY bathrooms; 
# What are the unique values in the column floors?
SELECT DISTINCT floors FROM house_price_data
ORDER BY floors;
# What are the unique values in the column condition?
SELECT DISTINCT cond FROM house_price_data 
ORDER BY cond;
# What are the unique values in the column grade?
SELECT DISTINCT grade FROM house_price_data 
ORDER BY grade;

# Q7: Arrange the data in a decreasing order by the price of the house. Return the IDs of the top 10 most expensive houses.
# ID and price of the 10 most expensive houses
SELECT id, price
FROM house_price_data
ORDER BY price DESC
LIMIT 10;

# Q8: What is the average price of all the properties in your data?
SELECT AVG(price)
FROM house_price_data;

#Q10: In this exercise we will use simple group by to check the properties of some of the categorical variables in our data
# What is the average price of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the prices. Use an alias to change the name of the second column.
SELECT bedrooms, avg(price) as average_price FROM house_price_data
GROUP BY bedrooms
ORDER BY bedrooms ASC;
# What is the average sqft_living of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the sqft_living. Use an alias to change the name of the second column.
SELECT bedrooms, avg(sqft_living15) as average_sqft_living FROM house_price_data
GROUP BY bedrooms
ORDER BY bedrooms ASC;
# What is the average price of the houses with a waterfront and without a waterfront? The returned result should have only two columns, waterfront and Average of the prices. Use an alias to change the name of the second colum
SELECT waterfront, avg(price) as average_price FROM house_price_data
GROUP BY waterfront;
# Is there any correlation between the columns condition and grade? You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
SELECT cond, grade FROM house_price_data
GROUP BY cond
ORDER BY cond ASC;

# Q11: One of the customers is only interested in the following houses: Number of bedrooms either 3 or 4 | Bathrooms more than 3 | One Floor | No waterfront | Condition should be 3 at least |Grade should be 5 at least | Price less than 300000
# For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them?
SELECT * FROM house_price_data
WHERE bedrooms in ('3','4') AND bathrooms > 3 AND floors = 1 AND waterfront = 0 AND cond >= 3 AND grade >= 5 AND price < 300000; 

# Q12: Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. Write a query to show them the list of such properties.
SELECT * FROM house_price_data
WHERE price >= 2*(select avg(price) as total_price from house_price_data);

# Q13: Since this is something that the senior management is regularly interested in, create a view of the same query.
CREATE VIEW overpriced_properties AS
SELECT * FROM house_price_data
WHERE price >= 2*(select avg(price) as total_price from house_price_data);

# Q14: Most customers are interested in properties with three or four bedrooms. What is the difference in average prices of the properties with three and four bedrooms?
SELECT bedrooms, avg(price) as average_price FROM house_price_data
WHERE bedrooms IN (3,4) 
GROUP BY bedrooms;

# Q15: What are the different locations where properties are available in your database? 
SELECT DISTINCT zipcode FROM house_price_data
ORDER BY zipcode;

# Q16: Show the list of all the properties that were renovated.
SELECT * FROM house_price_data
WHERE yr_renovated <> 0; 

# Q17: Provide the details of the property that is the 11th most expensive property in your database.
SELECT *,  
RANK() OVER (ORDER BY price DESC) ranking  
FROM house_price_data
LIMIT 10, 1;