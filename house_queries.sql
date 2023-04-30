
/*
Name: Tarek Solamy
Queries to retreive data from the DML
*/


/*
Query 1: This query retrieves the appliance name, room name, start time, end time, and user's first and last name for
all appliances that are in a common area and currently in use.
*/

SELECT appliance_name, room_name, start_time, end_time, first_name, last_name
FROM Appliance
NATURAL JOIN Room
NATURAL JOIN Schedule
NATURAL JOIN User
WHERE room_type = 'Common Area' AND status = true;


--------------------------------------------------------------------------------
/*
Query 2: This query retrieves the appliance name, manufacturer name, date of last maintenance/repair,
and start date of insurance policy for light sources.
*/

SELECT Appliance.appliance_name, Manufacturer.manufacturer_name, Maintenance_Repair.date_last_maintenance, Insurance_Policy.start_date
FROM Appliance
INNER JOIN Manufacturer ON Appliance.manufacturer_id = Manufacturer.manufacturer_id
LEFT JOIN Maintenance_Repair ON Appliance.maintenance_repair_id = Maintenance_Repair.maintenance_repair_id
INNER JOIN Insurance_Policy ON Appliance.appliance_id = Insurance_Policy.appliance_id
WHERE Appliance.appliance_type = 'Light' ;

--------------------------------------------------------------------------------

/*
Query 3: This query selects appliance_name from Appliance and room_name from Room.
It performs a left outer join between the two tables using the room_id column
*/

SELECT a.appliance_name, r.room_name
FROM Appliance a
LEFT OUTER JOIN Room r ON a.room_id = r.room_id
ORDER BY a.appliance_name;


--------------------------------------------------------------------------------
/*
Query 4: calculate the total cost of repairs for all appliances in the Appliance table
*/

SELECT SUM(cost_of_repairs) AS total_cost_of_repairs
FROM Maintenance_Repair
WHERE maintenance_repair_id IN (SELECT maintenance_repair_id FROM Appliance);

--------------------------------------------------------------------------------
/* Query 5: Query to find all appliances in a room with at least one active schedule*/

SELECT * FROM Appliance
WHERE room_id = (
  SELECT room_id FROM Room WHERE room_name = 'Living Room'
) AND appliance_id IN (
  SELECT appliance_id FROM Schedule WHERE status = true
);

--------------------------------------------------------------------------------

/*Query 6: Query to find all appliances that have had maintenance or repairs costing more than the average cost across all appliances*/
SELECT * FROM Appliance
WHERE maintenance_repair_id IN (
  SELECT maintenance_repair_id FROM Maintenance_Repair
  WHERE cost_of_repairs > (
    SELECT AVG(cost_of_repairs) FROM Maintenance_Repair
  )
);

--------------------------------------------------------------------------------

/* Query 7: Select all the appliances where it is in the living room manufactured by LG*/

SELECT appliance_name FROM Appliance
NATURAL JOIN Room
WHERE room_name = 'Living Room'
INTERSECT
SELECT appliance_name FROM Appliance
NATURAL JOIN Manufacturer
WHERE manufacturer_name = 'LG';


--------------------------------------------------------------------------------

/*Query 8: Display the count of appliances in each room with more than 2 appliances*/

SELECT Room.room_name, COUNT(Appliance.appliance_id) AS appliance_count
FROM Room
LEFT JOIN Appliance ON Room.room_id = Appliance.room_id
GROUP BY Room.room_name
HAVING appliance_count > 2;


--------------------------------------------------------------------------------

/*Query 9: number of rooms in each group using the COUNT() function*/
SELECT room_type, COUNT(room_type) as num_rooms
FROM Room
GROUP BY room_type;



