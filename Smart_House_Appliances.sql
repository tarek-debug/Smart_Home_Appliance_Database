


DROP TABLE IF EXISTS Appliance;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Account;
DROP TABLE IF EXISTS Schedule;
DROP TABLE IF EXISTS Manufacturer;
DROP TABLE IF EXISTS Maintenance_Repair;
DROP TABLE IF EXISTS Insurance_Policy;
DROP TABLE IF EXISTS Premium_Payment;

/*
Note: As I was doing the DDL, I came across a delimma of whether I should set to NUll while other "Cascade" on deletion of foriegn key.
There are mutiple reasons wether to cascade or set null for certain tables.
It is benificial to set null if you want to:
1. Retain data and preservation. For example, If you want to retain data about the appliances, you might not want to delete them when you delete the manufacturer.
2. Following a business policy.
3. Legal requirement: for example, Depending on your legal requirements, you may need to keep a record of a user's account activity for a certain period of time after they delete their profile.
It is benificial to cascade if you want to:
1. Ensure data consistency and integrity. For example, if you delete a manufacturer, it might make sense to delete all appliances related to it.
2. Orphaned Data. For example, If I keep sub_rooms related to a parent_room, I might end up with orphaned data that doesn't belong anywhere.
3. Efficiency: Cascading can save time and effort.

After careful consideration, I decided to opt for cascading the table when a forigen key is related. These are my reasons and assumptions:
1. I want maximize effiency, ensure that there are no orphaned Data and maintain data consistency and integrity. 
2. I understand that the reasons for setting null are also important. For that, I am assuming this SQL table also has another SQL counterpart
that retains all data. For example, if a person has lived in a house for over 20 years, many appliances will have changed and keeping unused appliance might reduce efficency and include many null variables.  
3. The only time that I did " ON DELETE SET NULL" is for the "maintenance_repair_id".
   This is because I am assuming the possibility the maintance_repair might no longer supporting a certain appliance or an appliance lacking a matainance_repair facility
*/


/*
This creates the appliance table, which relates to the foriegn key of the manufacturer table. 

The foriegn key manufacturer_id, brand, and model could be a null value because it is possible that an appliance may not have a manufacturer ( e.g. Homemade)

*/
CREATE TABLE Appliance
(
  appliance_id INT PRIMARY KEY NOT NULL, 
  appliance_name varchar(25) NOT NULL,
  appliance_type varchar(25) NOT NULL,
  appliance_brand varchar(25) ,
  appliance_model varchar(25) ,
  room_id INT,
  manufacturer_id INT,
  maintenance_repair_id INT,
  FOREIGN KEY (room_id) REFERENCES Room(room_id)
  ON DELETE CASCADE, 
  FOREIGN KEY (manufacturer_id) REFERENCES Manufacturer(manufacturer_id)
  ON DELETE CASCADE,
  FOREIGN KEY (maintenance_repair_id) REFERENCES Maintenance_Repair (maintenance_repair_id)
  ON DELETE SET NULL
);

/*
Room Table
I have allowed the parent room_id to be null becuase some rooms do not have a parent room.
The foreign key is "Cascade" because if a parent room is deleted, all it corresponding "children" rooms must be deleted

*/
CREATE TABLE Room
(
    room_id INT PRIMARY KEY,
    room_name VARCHAR(25) NOT NULL,
    room_type VARCHAR(25) NOT NULL,
    parent_room_id INT,
    FOREIGN KEY (parent_room_id) REFERENCES Room(room_id)
    ON DELETE CASCADE
);

/*
User Table

I have allowed the phone number to be null becuase it is possible that some users may not have a phone number (e.g. Children)
*/
CREATE TABLE User
(
    user_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    username VARCHAR(25) NOT NULL,
    password VARCHAR(25) NOT NULL,
    phone_number INT
);


/*
Account Table
I have made logging in and out stamp allow null values because for example if a user made a new account, it will not have those times yet.
The foreign key is "Cascade" because if a user is deleted, all their corresponding accounts will be deleted

*/
CREATE TABLE Account
(
    account_number INT,
    account_type VARCHAR(25) NOT NULL,
    user_in_id INT,
    log_in_Time TIMESTAMP,
    log_out_time TIMESTAMP,
    PRIMARY KEY (account_number, user_in_id),
    FOREIGN KEY (user_in_id) REFERENCES User(user_id)
    ON DELETE CASCADE
);

/*
Schedule Table
I have allowed the start and end times to be able to have a null values because there are cases when such data is not available.
For example, for a newly bought appliance, there will no start and end time as the user have not yet used it.
The foreign key is "Cascade" because if an appliance is deleted, its corresponding Schedule will be deleted

*/

CREATE TABLE Schedule
(
    schedule_id INT PRIMARY KEY NOT NULL,
    start_Time TIMESTAMP, 
    end_time TIMESTAMP,
    recurances INT NOT NULL, 
    status BOOLEAN NOT NULL,
    appliance_id INT NOT NULL,
    FOREIGN KEY (appliance_id) REFERENCES Appliance(appliance_id)
    ON DELETE CASCADE

);

/*
Manufacturer Table

*/
CREATE TABLE Manufacturer
(
    manufacturer_id INT PRIMARY KEY  NOT NULL,
    manufacturer_name VARCHAR(255)  NOT NULL,
    contact_info VARCHAR(255)  NOT NULL,
    warranty_details VARCHAR(255)  NOT NULL

);

/*
Maintenance_Repair Table
I allowed the maintenance_repair_id
*/

CREATE TABLE Maintenance_Repair
(
    maintenance_repair_id INT PRIMARY KEY NOT NULL,
    date_last_maintenance TIMESTAMP  NOT NULL,
    cost_of_repairs FLOAT  NOT NULL,
    service_provider VARCHAR(255)  NOT NULL

);


/*
Insurance_Policy Table
The foreign key is set to "Cascade" because if an appliance is deleted, its corresponding Insurance_Policy data will be deleted

*/
CREATE TABLE Insurance_Policy
(
    policy_id INT KEY NOT NULL,
    appliance_id INT NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    PRIMARY KEY (policy_id, appliance_id),
    FOREIGN KEY (appliance_id) REFERENCES Appliance(appliance_id)
    ON DELETE CASCADE
);


/*
Premium_Payment Table
The foreign key is set to "Cascade" because if a Insurance_Policy is deleted, its corresponding Premium_Payment data will also be deleted

*/
CREATE TABLE Premium_Payment
(
    payment_id INT PRIMARY KEY NOT NULL,
    policy_id INT NOT NULL,
    payment_date TIMESTAMP NOT NULL,
    amount FLOAT NOT NULL,
    FOREIGN KEY (policy_id) REFERENCES Insurance_Policy(policy_id)
    ON DELETE CASCADE

);




