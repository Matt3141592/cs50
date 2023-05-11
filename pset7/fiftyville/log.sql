-- Keep a log of any SQL queries you execute as you solve the mystery.

-- Checking the crime scene reports based on the time and location of the crime
select * from crime_scene_reports where year == 2020 AND month = 7 and day = 28 and street is "Chamberlin Street";
-- Theft of the CS50 duck took place at 10:15am at the Chamberlin Street courthouse. Interviews were conducted today with three witnesses who were present at the time 
-- — each of their interview transcripts mentions the courthouse.

-- List all the interviews that took place on the same date, looking for mentions of the courthouse
SELECT * from interviews where year = 2020 and month = 7 and day = 28;
-- Sometime within ten minutes of the theft, I saw the thief get into a car in the courthouse parking lot and drive away. If you have security footage from the courthouse parking lot, 
-- you might want to look for cars that left the parking lot in that time frame.
-- Eugene - I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at the courthouse, I was walking by the ATM on Fifer Street and saw the thief there withdrawing some money.
-- As the thief was leaving the courthouse, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow.
-- The thief then asked the person on the other end of the phone to purchase the flight ticket.

-- At the time of the theft, the theif drive away in a car from courthouse parking
-- ATM on Fifer street made a withdrawal
-- Made a call as they were leaving the courthouse. (less than a minute). 
-- Taking the earliest flight out of fiftyville tomorrow
-- Telling the person on the other end of the call to purchase the flight ticket.

-- Check courthouse parking log, check for arrival before 10:15 and within 10mins after
select * from courthouse_security_logs where year = 2020 and month = 7 and day = 28 and hour in (9, 10);
-- Likely to be G412CB7 belogns to Roger but isn't xD

-- Chech withdrawals from atm 
select * from atm_transactions where year = 2020 and month = 7 and day = 28 and atm_location = "Fifer Street";
/* 246 | 28500762 | 2020 | 7 | 28 | Fifer Street | withdraw | 48
   264 | 28296815 | 2020 | 7 | 28 | Fifer Street | withdraw | 20
   266 | 76054385 | 2020 | 7 | 28 | Fifer Street | withdraw | 60
   267 | 49610011 | 2020 | 7 | 28 | Fifer Street | withdraw | 50
   269 | 16153065 | 2020 | 7 | 28 | Fifer Street | withdraw | 80
   288 | 25506511 | 2020 | 7 | 28 | Fifer Street | withdraw | 20
   313 | 81061156 | 2020 | 7 | 28 | Fifer Street | withdraw | 30
   336 | 26013199 | 2020 | 7 | 28 | Fifer Street | withdraw | 35*/
-- Likely to be one of the earlier ones because it happened in the morning before 10:15

-- Check account number against bank accounts
select * from bank_accounts where account_number in (28500762, 28296815, 76054385, 49610011 , 16153065, 25506511, 81061156, 26013199);
select name from bank_accounts
join people on people.id = bank_accounts.person_id
where account_number in (28500762, 28296815, 76054385, 49610011 , 16153065, 25506511, 81061156, 26013199);
/* 49610011 | 686048 | 2010
   26013199 | 514354 | 2012
   16153065 | 458378 | 2012
   28296815 | 395717 | 2014
   25506511 | 396669 | 2014
   28500762 | 467400 | 2014
   76054385 | 449774 | 2015
   81061156 | 438727 | 2018*/
   
-- Find airport that thief is going to be leaving from 
select * from airports where city = "Fiftyville";
-- 8 | CSF | Fiftyville Regional Airport | Fiftyville

-- Earliest flight out of fiftyville the next day
select * from flights where origin_airport_id = 8 and year = 2020 and month = 7 and day = 29 order by hour, minute;
-- 36 | 8 | 4 | 2020 | 7 | 29 | 8 | 20

-- Phone calls made on the same day that lasted less than a minute
select * from phone_calls where day = 28 and month = 7 and year = 2020 and duration < 60;
/* 221 | (130) 555-0289 | (996) 555-8899 | 2020 | 7 | 28 | 51
   224 | (499) 555-9472 | (892) 555-8872 | 2020 | 7 | 28 | 36
   233 | (367) 555-5533 | (375) 555-8161 | 2020 | 7 | 28 | 45
   251 | (499) 555-9472 | (717) 555-1342 | 2020 | 7 | 28 | 50
   254 | (286) 555-6063 | (676) 555-6554 | 2020 | 7 | 28 | 43
   255 | (770) 555-1861 | (725) 555-3243 | 2020 | 7 | 28 | 49
   261 | (031) 555-6622 | (910) 555-3251 | 2020 | 7 | 28 | 38
   279 | (826) 555-1652 | (066) 555-9701 | 2020 | 7 | 28 | 55
   281 | (338) 555-6650 | (704) 555-2131 | 2020 | 7 | 28 | 54*/

-- The passengers on the flight
SELECT name, phone_number, license_plate from passengers
JOIN people ON people.passport_number = passengers.passport_number
WHERE flight_id = 36;
/* Doris | (066) 555-9701 | M51FA04
   Roger | (130) 555-0289 | G412CB7
   Ernest | (367) 555-5533 | 94KL13X
   Edward | (328) 555-1152 | 130LD9Z
   Evelyn | (499) 555-9472 | 0NTHK55
   Madison | (286) 555-6063 | 1106N58
   Bobby | (826) 555-1652 | 30G67EN
   Danielle | (389) 555-5198 | 4328GD8*/

-- compare bank accounts to the people on the plane
select name, phone_number from bank_accounts
JOIN people on people.id = bank_accounts.person_id
JOIN passengers on people.passport_number = passengers.passport_number
where flight_id = 36 and account_number in (28500762, 28296815, 76054385, 49610011 , 16153065, 25506511, 81061156, 26013199)
and license_plate in ("5P2BI95", "94KL13X", "6P58WS2", "4328GD8", "G412CB7", "L93JTIZ", "322W7JE", "0NTHK55");
-- Returns Ernest and Danielle but Danielle isn't on the call log so it's Ernest
-- Find the accomplist by finding who Ernest called on the day. 