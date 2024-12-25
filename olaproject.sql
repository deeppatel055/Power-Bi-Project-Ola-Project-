#1. Retrive all successful booking:
Create View booking.Successful_Booking AS
SELECT * FROM booking.olaproject 
WHERE Booking_Status = 'Success';

SELECT * FROM booking.successful_booking;

#2. Find the average ride distance for each  vehicle type:

CREATE VIEW booking.ride_distance_for_each_vehicle AS
SELECT Vehicle_type, AVG(Ride_Distance) AS avg_distance
From booking.olaproject
GROUP BY Vehicle_Type;


#3. Get the total number of cancled rides by custmers:

CREATE VIEW booking.canceled_rides_by_customers AS
Select SUM(Booking_Status) From booking.olaproject
WHERE Booking_Status = 'Canceled by Customer'; 


#4.olaproject List the top 5 customers who booked the highest number of rides:

CREATE VIEW Top_5_Customers AS
SELECT  Customer_ID, COUNT(Booking_ID) as total_rides
FROM booking.olaproject 
GROUP BY Customer_ID
Order BY total_rides DESC LIMIT 5;

#5. Get the number of rides canceled by drivers due to personal and car-related issues:

CREATE VIEW booking.Rides_Canceled_by_DRivers_P_C_Issues AS
SELECT COUNT(*) FROM booking.olaproject
WHERE Canceled_Rides_by_Driver = 'Personal & CAR related issue';

#6. Find the maximum and minimum driver rating for Prime Sedan booking:

CREATE View booking.Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) AS max_rating,
MIN(Driver_Ratings) as min_rating
From booking.olaproject
WHERE Vehicle_Type='Prime Sedan';

#7. Retrive all rides where payment was made using UPI:

CREATE VIEW booking.UPI_Payment AS
SELECT * FROM booking.olaproject
WHERE Payment_Method='UPI';

#8. Find the average customer rating per vehicle type:

CREATE VIEW booking.AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_cutomer_rating
FROM booking.olaproject
GROUP BY Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:

CREATE VIEW  booking.total_successful_ride_value As
SELECT SUM(Booking_Value) AS total_successfulRides_value 
FROM booking.olaproject
WHERE Booking_Status = 'Success'; 

select * from booking.total_successful_ride_value;
#10. List all incomplete rides along with the reason:
 
CREATE VIEW  booking.incomplete_rides_with_reason As
SELECT Booking_ID, Incomplete_Rides_Reason 
 FROM booking.olaproject
WHERE Incomplete_Rides = 'Yes';