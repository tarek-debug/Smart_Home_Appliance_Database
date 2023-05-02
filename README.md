# Smart_Home_Appliance_Database

## Domain Description

- Title: Smart Home Appliance Management System

- Description: The schema represents a database for managing smart home appliances, their maintenance and repair, insurance policies, and premium payments. It includes tables for users, their login details, rooms, appliances, manufacturers, schedules, maintenance and repair details, insurance policies, and premium payments. The schema is designed to help users keep track of their smart home appliances, their maintenance and repair schedules, insurance policies, and premium payments. The system allows users to add, update, and delete their appliances and their details, as well as schedule maintenance and repair tasks and manage their insurance policies and premium payments.

- User: This table stores user details such as user_id, first name, last name, username, password, and phone number. Each user can have multiple accounts and multiple appliances.

- Account: This table stores login details and the accounts users have including account number, account type (e.g. admin, member, guest) user_id, log_in_Time, and log_out_time. Each account is associated with a user through the user_id foreign key reference.

- Room: This table stores information about rooms such as room_id, room_name, room_type, and parent_room_id. Each room can have multiple appliances, and each room can be a sub-room of another room.

- Appliance: This table stores information about appliances such as appliance_id, appliance_name, appliance_type, appliance_brand, appliance_model, and foreign key references to room_id, manufacturer_id, and maintenance_repair_id tables. Each appliance is associated with a room, a manufacturer, and a maintenance-repair record.

- Schedule: This table stores information about the schedule of maintenance and repair tasks for appliances such as schedule_id, start_Time, end_time, recurances, status, and foreign key reference to the appliance_id table. Each schedule is associated with an appliance.

- Manufacturer: This table stores information about manufacturers of appliances such as manufacturer_id, manufacturer_name, contact_info, and warranty_details. Each manufacturer can be associated with multiple appliances.

- Maintenance_Repair: This table stores information about maintenance and repair tasks such as maintenance_repair_id, date_last_maintenance, cost_of_repairs, and service_provider. Each maintenance and repair record is associated with an appliance.

- Insurance_Policy: This table stores information about insurance policies such as policy_id, start_date, end_date, and foreign key reference to the appliance_id table. Each insurance policy is associated with an appliance.

- Premium_Payment: This table stores information about premium payments for insurance policies such as payment_id, payment_date, amount, and foreign key reference to the policy_id table. Each payment is associated with an insurance policy.


## Entity-Relationship Diagram

![image](https://user-images.githubusercontent.com/98676405/235338766-9b88b570-720d-48e9-9099-d2c23176b960.png)


## Relational Schema

User(**user_id**, first_name, last_name, username, password, phone_number)

Account(**account_number**, ***user_id*** , account_type, log_in_Time , log_out_time)

Room(**room_id**, room_name, room_type, *parent_room_id*)

Appliance(**appliance_id**, appliance_name, appliance_type, appliance_brand, appliance_model, *room_id*, *manufacturer_id*, *maintenance_repair_id*)

Schedule(**schedule_id**, start_Time, end_time, recurances, status, *appliance_id*)

Manufacturer(**manufacturer_id**, manufacturer_name, contact_info, warranty_details)

Maintenance_Repair(**maintenance_repair_id**, date_last_maintenance, cost_of_repairs, service_provider)

Insurance_Policy(**policy_id**, ***appliance_id***, start_date, end_date)

Premium_Payment(**payment_id**, ***policy_id***, payment_date, amount)

**Note:**  
Bold words are primary keys.   
Italic word are forigen keys.   


## Boyce–Codd Normal Form Decomposition


User(user_id, first_name, last_name, username, password, phone_number)

Nontrivial Functional Dependencies:
- {user_id} -> {first_name, last_name, username, password, phone_number}  
- {user_id} -> {first_name}  
- {user_id} -> {username}  
- {user_id} -> {password}  
- {user_id} -> {phone_number}  

Result: Yes, the determinant {user_id} is a candidate key, so User is in BCNF.


### Account Table

Account(user_id, log_in_Time, log_out_time, user_id*)

Nontrivial Functional Dependencies:

- {account_number, user_id} → {account_type, log_in_Time, log_out_time}  
- {user_id} → {account_type, log_in_Time, log_out_time}  

Explanation: The primary key of the Account table is {account_number, user_id}, which is a superkey for all of the functional dependencies in the table. Additionally, the foreign key constraint on user_id ensures that every value in this column references a valid user_id in the User table, which means that there are no redundancies or anomalies caused by this dependency.

Result: Yes, the determinant {user_id} is a candidate key, so Account is in BCNF.


### Room Table

Room(room_id, room_name, room_type, parent_room_id*)

Nontrivial Functional Dependencies:

- {room_id} → {room_name, room_type, parent_room_id}  
- {room_id} → {room_name}  
- {room_id} → {room_type}  
- {room_id} → {parent_room_id}  


Explanation: This functional dependency means that given a value of room_id, we can determine the corresponding room_name, room_type, and parent_room_id. Since room_id is the primary key, it is already a superkey, and this functional dependency does not violate BCNF.

Result:Yes,  the determinant {room_id} is a candidate key, so Appliance is in BCNF.

### Appliance Table

- Appliance(appliance_id, appliance_name, appliance_type, appliance_brand, appliance_model, room_id*, manufacturer_id*, maintenance_repair_id*)

Nontrivial Functional Dependencies:

- {appliance_id} -> {appliance_name, appliance_type, appliance_brand, appliance_model, room_id, manufacturer_id, maintenance_repair_id}  
- {appliance_id} -> {appliance_name}  
- {appliance_id} -> {appliance_type}  
- {appliance_id} -> {appliance_brand}  
- {appliance_id} -> {appliance_model}  
- {appliance_id} -> {room_id}  
- {appliance_id} -> {manufacturer_id}  
- {appliance_id} -> {maintenance_repair_id}  

Explanation: the {appliance_id} attribute is the primary key of the Appliance table, which means that it is already guaranteed to be unique and can uniquely identify each tuple in the table. Therefore, any attribute that is functionally dependent on appliance_id is also guaranteed to be unique for each tuple in the table.

Result: Yes, the determinant {appliance_id} is a candidate key, so Appliance is in BCNF.


### Schedule Table

Schedule(schedule_id, start_Time, end_time, recurances, status, appliance_id*)

Nontrivial Functional Dependencies:

- {schedule_id} → {start_time, end_time, recurances, status, appliance_id}  
- {appliance_id} → {schedule_id, start_time, end_time, recurances, status}  
- {schedule_id} → {start_time}  
- {schedule_id} → {end_time}  
- {schedule_id} → {recurances}  
- {schedule_id} → {status}  
- {schedule_id} → {appliance_id}  
- {appliance_id} → {schedule_id}  
- {appliance_id} → {start_time}  
- {appliance_id} → {end_time}  
- {appliance_id} → {recurances}  
- {appliance_id} → {status}  

Explanation: The Schedule table only has one non-trivial functional dependency: {schedule_id} → {start_Time, end_time, recurances, status, appliance_id}. This functional dependency meets the requirements of BCNF since the determinant {schedule_id} is a superkey of the table, meaning that every non-key attribute is functionally dependent on it. Therefore, the Schedule table is in BCNF.

Result: Yes, the determinant {schedule_id} is a candidate key, so Schedule is in BCNF.


### Manufacturer Table

- Manufacturer(manufacturer_id, manufacturer_name, contact_info, warranty_details)

Nontrivial Functional Dependencies:

- {manufacturer_id} → {manufacturer_name, contact_info, warranty_details}  
- {manufacturer_id} → {manufacturer_name}  
- {manufacturer_id} → {contact_info}  
- {manufacturer_id} → {warranty_details}  

Result:Yes, the determinant {manufacturer_id} is a candidate key, so Manufacturer is in BCNF.


### Maintenance_Repair Table
Maintenance_Repair(maintenance_repair_id, date_last_maintenance, cost_of_repairs, service_provider)

Nontrivial Functional Dependencies:

- {maintenance_repair_id} → {date_last_maintenance,cost_of_repairs, service_provider}  
- {maintenance_repair_id} → {date_last_maintenance}  
- {maintenance_repair_id} → {cost_of_repairs}  
- {maintenance_repair_id} → {service_provider}  

Result: Yes, the determinant {maintenance_repair_id} is a candidate key, so Maintenance_Repair is in BCNF.


### Insurance_Policy Table

Insurance_Policy(policy_id, appliance_id*, start_date, end_date)

Nontrivial Functional Dependencies:

- {policy_id, appliance_id} → { start_date, end_date}  
- {policy_id} → { start_date, end_date}  
- {appliance_id} → { start_date, end_date}  

Exlpanation:
This implies that given a policy_id and an appliance_id, there can only be one start date and end date associated with that combination. Therefore, it satisfies the BCNF criterion.
Result: Yes, the determinant {policy_id, appliance_id} is a candidate key, so Insurance_Policy is in BCNF.


### Premium_Payment Table

Premium_Payment(payment_id, policy_id*, payment_date, amount)

Nontrivial Functional Dependencies:

- {payment_id} → {policy_id, payment_date, amount}  
- {payment_id} → {policy_id}  
- {payment_id} → {payment_date}  
- {payment_id} → {amount}  


Explanation:
Since the primary key is {payment_id}, every other attribute in the table is functionally dependent on {payment_id}. In other words, given a value for {payment_id}, we can uniquely determine the values for {policy_id}, {payment_date}, and {amount}. Therefore, the only non-trivial functional dependency in this table is {payment_id} → {policy_id, payment_date, amount}.

Result: Yes, the determinant {payment_id} is a candidate key, so Premium_Payment is in BCNF.


## Transaction and Query Executions



### Query 1: This query retrieves the appliance name, room name, start time, end time, and user's first and last name for all appliances that are in a common area and currently in use.


SELECT appliance_name, room_name, start_time, end_time, first_name, last_name  
FROM Appliance  
NATURAL JOIN Room  
NATURAL JOIN Schedule  
NATURAL JOIN User  
WHERE room_type = 'Common Area' AND status = true;  


Output:
appliance_name,room_name,start_Time,end_time,first_name,last_name  
Refrigerator,Living Room,2023-05-01 08:00:00,2023-05-01 09:00:00,John, Max  
Oven,Living Room,2023-05-02 18:00:00,2023-05-02 19:00:00,John, Max  
Microwave,Living Room,2023-05-04 10:00:00,2023-05-04 11:00:00,John, Max  
Refrigerator,Living Room,2023-05-01 08:00:00,2023-05-01 09:00:00,Jane,Max  
Oven,Living Room,2023-05-02 18:00:00,2023-05-02 19:00:00,Jane,Max  
Microwave,Living Room,2023-05-04 10:00:00,2023-05-04 11:00:00,Jane,Max  
Refrigerator,Living Room,2023-05-01 08:00:00,2023-05-01 09:00:00,Joe,Max  
Oven,Living Room,2023-05-02 18:00:00,2023-05-02 19:00:00,Joe,Max  
Microwave,Living Room,2023-05-04 10:00:00,2023-05-04 11:00:00,Joe,Max  


### Query 2: This query retrieves the appliance name, manufacturer name, date of last maintenance/repair, and start date of insurance policy for light sources


SELECT Appliance.appliance_name, Manufacturer.manufacturer_name, Maintenance_Repair.date_last_maintenance, Insurance_Policy.start_date    
FROM Appliance   
INNER JOIN Manufacturer ON Appliance.manufacturer_id = Manufacturer.manufacturer_id  
LEFT JOIN Maintenance_Repair ON Appliance.maintenance_repair_id = Maintenance_Repair.maintenance_repair_id  
INNER JOIN Insurance_Policy ON Appliance.appliance_id = Insurance_Policy.appliance_id  
WHERE Appliance.appliance_type = 'Light' ;

Output:

appliance_name,manufacturer_name,date_last_maintenance,start_date  
Kitchen Light,LG,2023-02-01 12:00:00,2023-04-01  
Laundry Light,LG,2023-02-01 12:00:00,2023-04-01  
Master Bedroom Light,LG,2023-02-01 12:00:00,2023-04-01  
Child Bedroom Light,LG,2023-02-01 12:00:00,2023-04-01  
Living Room Light,LG,2023-02-01 12:00:00,2023-04-01  


### Query 3: This query selects appliance_name from Appliance and room_name from Room. It performs a left outer join between the two tables using the room_id column


SELECT a.appliance_name, r.room_name  
FROM Appliance a  
LEFT OUTER JOIN Room r ON a.room_id = r.room_id  
ORDER BY a.appliance_name;  

Output:

appliance_name,room_name  
Air Conditioner,Master Bedroom  
Blender,Living Room  
Child Bedroom Light,Child Bedroom    
Dishwasher,Living Room  
Dryer,Kitchen  
Fan,Master Bedroom Bathroom  
Kitchen Light,Kitchen   
Laundry Light,Laundry  
Living Room Light,Living Room  
Master Bedroom Light,Master Bedroom    
Microwave,Living Room  
Oven,Living Room  
Refrigerator,Living Room  
Toaster,Living Room  
Washing Machine,Kitchen  



### Query 4: calculate the total cost of repairs for all appliances in the Appliance table


SELECT SUM(cost_of_repairs) AS total_cost_of_repairs  
FROM Maintenance_Repair  
WHERE maintenance_repair_id IN (SELECT maintenance_repair_id FROM Appliance);  


Output:

total_cost_of_repairs  
850.0  


### Query 5: Query to find all appliances in a room with at least one active schedule

SELECT * FROM Appliance  
WHERE room_id = (  
  SELECT room_id FROM Room WHERE room_name = 'Living Room'  
) AND appliance_id IN (  
  SELECT appliance_id FROM Schedule WHERE status = true  
);  

Output:

appliance_id,appliance_name,appliance_type,appliance_brand,appliance_model,room_id,manufacturer_id,maintenance_repair_id  
1,Refrigerator,Kitchen,Samsung,RS27T5561SR/AA,1,1,NULL  
3,Oven,Kitchen,GE,JTS5000SNSS,1,3,NULL  
5,Microwave,Kitchen,Panasonic,NN-SN966S,1,5,1  


### Query 6: Query to find all appliances that have had maintenance or repairs costing more than the average cost across all appliances

SELECT * FROM Appliance  
WHERE maintenance_repair_id IN (  
  SELECT maintenance_repair_id FROM Maintenance_Repair  
  WHERE cost_of_repairs > (  
    SELECT AVG(cost_of_repairs) FROM Maintenance_Repair  
  )  
);  

Output:

appliance_id,appliance_name,appliance_type,appliance_brand,appliance_model,room_id,manufacturer_id,maintenance_repair_id  
7,Dishwasher,Kitchen,Bosch,SHEM63W55N,1,7,2  


### Query 7: Select all the appliances where it is in the living room manufactured by LG 

SELECT appliance_name FROM Appliance  
NATURAL JOIN Room  
WHERE room_name = 'Living Room'  
INTERSECT  
SELECT appliance_name FROM Appliance  
NATURAL JOIN Manufacturer  
WHERE manufacturer_name = 'LG';  


Output:

appliance_name  
Living Room Light  


### Query 8: Display the count of appliances in each room with more than 2 appliances

SELECT Room.room_name, COUNT(Appliance.appliance_id) AS appliance_count  
FROM Room  
LEFT JOIN Appliance ON Room.room_id = Appliance.room_id  
GROUP BY Room.room_name  
HAVING appliance_count > 2;  

Output:

room_name,appliance_count  
Kitchen,3  
Living Room,7  

### Query 9: number of rooms in each group using the COUNT() function

SELECT room_type, COUNT(room_type) as num_rooms  
FROM Room  
GROUP BY room_type;  

Output:

room_type,num_rooms  
Bedroom,1  
Common Area,2  
Private Bathroom,1  
Private Room,1  
utility ,1  


