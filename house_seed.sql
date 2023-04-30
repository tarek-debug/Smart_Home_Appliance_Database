
/*
Name: Tarek Solamy
SQL DML to seed the "Smart Home Appliances "database with data
*/



INSERT INTO Appliance(appliance_id, appliance_name, appliance_type, appliance_brand, appliance_model, room_id, manufacturer_id, maintenance_repair_id) VALUES 
(1, 'Refrigerator', 'Kitchen', 'Samsung', 'RS27T5561SR/AA', 1, 1, null),
(2, 'Washing Machine', 'Laundry', 'LG', 'WM4500HBA', 2, 2, null),
(3, 'Oven', 'Kitchen', 'GE', 'JTS5000SNSS', 1, 3, null),
(4, 'Air Conditioner', 'Bedroom', 'Frigidaire', 'FFRE083ZA1', 3, 4, null),
(5, 'Microwave', 'Kitchen', 'Panasonic', 'NN-SN966S', 1, 5, 1),
(6, 'Dryer', 'Laundry', 'Whirlpool', 'WED9620HC', 2, 6, null),
(7, 'Dishwasher', 'Kitchen', 'Bosch', 'SHEM63W55N', 1, 7, 2),
(8, 'Fan', 'Living Room', 'Hunter', '53237', 4, 8, 3),
(9, 'Toaster', 'Kitchen', 'Cuisinart', 'CPT-180P1', 1, 9, null),
(10, 'Blender', 'Kitchen', 'Ninja', 'BN801', 1, 10, null),
(11, 'Kitchen Light', 'Light', 'GE', 'X100', 2, 2, 3),
(12, 'Laundry Light', 'Light', 'Philips', 'H200', 5, 2, 3),
(13, 'Master Bedroom Light', 'Light', 'Lutron', 'M500', 3, 2, 3),
(14, 'Child Bedroom Light', 'Light', 'Hue', 'C300', 6, 2, 3),
(15, 'Living Room Light', 'Light', 'Leviton', 'L600', 1, 2, 3);


INSERT INTO Room(room_id, room_name, room_type, parent_room_id) VALUES
(1, 'Living Room', 'Common Area', NULL),
(2, 'Kitchen', 'Common Area',  NULL),
(3, 'Master Bedroom', 'Private Room', NULL),
(4, 'Master Bedroom Bathroom', 'Private Bathroom', 3),
(5, 'Laundry','utility ', 2),
(6, 'Child Bedroom', 'Bedroom', NULL);

INSERT INTO User(user_id, first_name, Last_name , username, password, phone_number) VALUES
(1, 'John',' Max','john_Max', 'password123', 1234567890),
(2, 'Jane','Max','john_Max', 'abc123', 0987654321),
(3, 'Joe','Max','Joe', 'abcd1234', NULL);

INSERT INTO Account(account_number,account_type,user_id, log_in_Time, log_out_time) VALUES
(100, 1,'Admin', '2023-04-09 10:00:00', '2023-04-09 12:00:00'),
(101, 1,'Member', '2023-04-09 10:00:00', '2023-04-09 12:00:00'),
(200, 2,'Member' ,'2023-04-09 13:00:00', '2023-04-09 16:00:00'),
(300, 3,'Member' , '2023-04-09 13:00:00', '2023-04-09 15:00:00'),
(400, 3, 'Guest','2023-04-09 13:00:00', NULL);

INSERT INTO Schedule(schedule_id, start_Time, end_time, recurances, status, appliance_id) VALUES
(1, '2023-05-01 08:00:00', '2023-05-01 09:00:00', 5, true, 1),
(2, '2023-05-01 14:00:00', '2023-05-01 15:00:00', 3, false, 2),
(3, '2023-05-02 18:00:00', '2023-05-02 19:00:00', 2, true, 3),
(4, '2023-05-03 09:00:00', '2023-05-03 10:00:00', 1, false, 4),
(5, '2023-05-04 10:00:00', '2023-05-04 11:00:00', 4, true, 5);

INSERT INTO Manufacturer(manufacturer_id, manufacturer_name, contact_info, warranty_details) VALUES
(1, 'LG Electronics', 'contact@lg.com', '1 year warranty for parts and labor'),
(2, 'LG', '1-800-243-0000', '2-year warranty'),
(3, 'Samsung Electronics', 'contact@samsung.com', '1 year warranty for parts and labor'),
(4, 'Whirlpool', '1-866-698-2538', '2-year warranty'),
(5, 'General Electric', '1-800-626-2000', '1 year warranty for parts and labor');

INSERT INTO Maintenance_Repair(maintenance_repair_id, date_last_maintenance, cost_of_repairs, service_provider) VALUES
(1, '2023-04-01 10:00:00', 250.00, 'ABC Repair'),
(2, '2023-03-01 14:00:00', 500.00, 'XYZ Repair'),
(3, '2023-02-01 12:00:00', 100.00, 'DEF Repair'),
(4, '2022-12-01 09:00:00', 350.00, 'GHI Repair'),
(5, '2022-11-01 15:00:00', 200.00, 'JKL Repair');

INSERT INTO Insurance_Policy(policy_id, appliance_id, start_date, end_date) VALUES
(1, 1, '2023-04-01', '2024-04-01'),
(2, 2, '2023-03-01', '2024-08-01'),
(3, 3, '2023-04-15', '2024-04-15'),
(4, 4, '2023-02-01', '2024-02-01'),
(5, 5, '2023-05-01', '2024-05-01'),
(7,11, '2023-04-01', '2024-04-01'),
(8,12, '2023-04-01', '2024-04-01'),
(9,13, '2023-04-01', '2024-04-01'),
(10,14, '2023-04-01', '2024-04-01'),
(11,15, '2023-04-01', '2024-04-01');

INSERT INTO Premium_Payment(payment_id, policy_id, payment_date, amount) VALUES
(1, 1, '2023-04-01', 100.00),
(2, 2, '2023-03-01', 200.00),
(3, 1, '2022-12-31', 150.00),
(4, 3, '2023-01-15', 50.00),
(5, 2, '2022-11-01', 150.00),
(6, 4, '2022-10-01', 75.00);

select * from Appliance;
select * from Room;
select * from User;
select * from Account;
select * from Schedule;
select * from Manufacturer;
select * from Maintenance_Repair;
select * from Insurance_Policy;
select * from Premium_Payment;

