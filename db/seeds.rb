# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#------------ Users ------------#
# 1. Harry Potter, driver, admin
User.create(email: 'harry@hogwarts.com', password: '11111111', name: "Harry Potter", ic_number: "920706111111", sjam_id: "WP-0001", division: "Kuala Lumpur Pudu Combined Adult Division", phone_number: "011-1111111", driver_status: true, role: "Administrator")

# 2. Ron Weasley, non-driver, PDC
User.create(email: 'ron@hogwarts.com', password: '11111111', name: "Ron Weasley", ic_number: "920101111111", sjam_id: "WP-0002", division: "Kuala Lumpur Pudu Combined Adult Division", phone_number: "012-1111111", driver_status: false, role: "PDC")

# 3. Hermione Granger, non-driver, CVSC
User.create(email: 'herm@hogwarts.com', password: '11111111', name: "Hermione Granger", ic_number: "920102111111", sjam_id: "WP-0003", division: "Kuala Lumpur Sri Bintang Utara Combined Cadet", phone_number: "013-1111111", driver_status: false, role: "CVSC")

# 4. Neville Longbottom, non-driver, member
User.create(email: 'neville@hogwarts.com', password: '11111111', name: "Neville Longbottom", ic_number: "920102111131", sjam_id: "WP-0004", division: "Kuala Lumpur Sri Bintang Utara Combined Cadet", phone_number: "013-1111111", driver_status: false, role: "Member")

# 5. Albus Dumbledore, non-driver, admin
User.create(email: 'albus@hogwarts.com', password: '11111111', name: "Albus Dumbledore", ic_number: "890101111111", sjam_id: "WP-0005", division: "Wilayah Persekutuan Regional Headquarters", phone_number: "011-2111111", driver_status: false, role: "Administrator")

# 6. Severus Snape, driver, admin
User.create(email: 'snape@hogwarts.com', password: '11111111', name: "Severus Snape", ic_number: "900203111111", sjam_id: "WP-0006", division: "Wilayah Persekutuan Regional Headquarters", phone_number: "011-3111111", driver_status: true, role: "Administrator")

#------------ Duties ------------#
Duty.create(user_id: "1", duty_name: "CNY Lion Dance", venue: "Leisure Mall, Cheras", start_date_time: "2018-Feb-16 10:00 AM", end_date_time: "2018-02-16 6:30 PM",contact_person: "Chang Chee Kok", contact_number: "014-1111111")

Duty.create(user_id: "5", duty_name: "Hari Raya Open House", venue: "Dr. Mahathir's Mansion, Putrajaya", start_date_time: "2018-Jun-23 09:45 AM", end_date_time: "2018-06-23 6:00 PM",contact_person: "Wang Siew Hong", contact_number: "015-1111111")

Duty.create(user_id: "5", duty_name: "Deepavali Dinner", venue: "Kuil Sri Mahapahit, Petaling Jaya", start_date_time: "2018-Nov-06 1:00 PM", end_date_time: "2018-Nov-06 10:00 PM",contact_person: "Dr. Siv Azhar", contact_number: "016-1111111")

Duty.create(user_id: "6", duty_name: "Standard Chartered KL Marathon 2018", venue: "Dataran Merdeka", start_date_time: "2018-Apr-07 11:00 PM", end_date_time: "2018-Apr-08 1:00 PM",contact_person: "Woo Chong You", contact_number: "017-1111111")

Duty.create(user_id: "5", duty_name: "Jacky Cheung Live in Kuala Lumpur 2018", venue: "Axiata Indoor Stadium, Bukit Jalil", start_date_time: "2018-Jan-26 5:00 PM", end_date_time: "2018-Jan-26 11:00 PM",contact_person: "Lum Sir", contact_number: "018-1111111")
