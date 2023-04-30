# Smart_Home_Appliance_Database

Description: The schema represents a database for managing smart home appliances, their maintenance and repair, insurance policies, and premium payments. It includes tables for users, their login details, rooms, appliances, manufacturers, schedules, maintenance and repair details, insurance policies, and premium payments. The schema is designed to help users keep track of their smart home appliances, their maintenance and repair schedules, insurance policies, and premium payments. The system allows users to add, update, and delete their appliances and their details, as well as schedule maintenance and repair tasks and manage their insurance policies and premium payments.

User: This table stores user details such as user_id, first name, last name, username, password, and phone number. Each user can have multiple accounts and multiple appliances.

Account: This table stores login details of users including user_in_id, log_in_Time, and log_out_time. Each account is associated with a user through the user_id foreign key reference.

Room: This table stores information about rooms such as room_id, room_name, room_type, and parent_room_id. Each room can have multiple appliances, and each room can be a sub-room of another room.

Appliance: This table stores information about appliances such as appliance_id, appliance_name, appliance_type, appliance_brand, appliance_model, and foreign key references to room_id, manufacturer_id, and maintenance_repair_id tables. Each appliance is associated with a room, a manufacturer, and a maintenance and repair record.

Schedule: This table stores information about the schedule of maintenance and repair tasks for appliances such as schedule_id, start_Time, end_time, recurances, status, and foreign key reference to the appliance_id table. Each schedule is associated with an appliance.

Manufacturer: This table stores information about manufacturers of appliances such as manufacturer_id, manufacturer_name, contact_info, and warranty_details. Each manufacturer can be associated with multiple appliances.

Maintenance_Repair: This table stores information about maintenance and repair tasks such as maintenance_repair_id, date_last_maintenance, cost_of_repairs, and service_provider. Each maintenance and repair record is associated with an appliance.

Insurance_Policy: This table stores information about insurance policies such as policy_id, start_date, end_date, and foreign key reference to the appliance_id table. Each insurance policy is associated with an appliance.

Premium_Payment: This table stores information about premium payments for insurance policies such as payment_id, payment_date, amount, and foreign key reference to the policy_id table. Each payment is associated with an insurance policy.
