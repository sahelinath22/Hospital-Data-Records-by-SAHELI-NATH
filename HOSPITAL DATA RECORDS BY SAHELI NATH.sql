DROP TABLE IF EXISTS Hospital_Data;

CREATE TABLE Hospital_Data (	
    Hospital_Name VARCHAR(50),	
	Location VARCHAR(30),
	Department VARCHAR(20),
	Doctors_Count INT,
	Patients_Count INT,
	Admission_Date DATE,
	Discharge_Date DATE,
	Medical_Expenses NUMERIC
);

SELECT * FROM Hospital_Data;


--1) Write an SQL query to find the total number of patients across all hospital
SELECT Hospital_name, SUM(patients_count)
FROM Hospital_data
GROUP BY Hospital_name;


--2)Retrieve the average count of doctors available in each hospital.

SELECT Hospital_Name, Avg(doctors_count) as AVG_No_OF_DOCTORS
FROM Hospital_data
GROUP BY Hospital_name;


--3)Find the top 3 hospital departments that have the highest number of patients.

SELECT 
    Department,
    SUM(Patients_Count) AS total_patients
FROM hospital_data
GROUP BY Department
ORDER BY total_patients DESC
LIMIT 3;


--4)Identify the hospital that recorded the highest medical expenses.

SELECT 
    Hospital_Name,
    SUM(Medical_Expenses) AS total_expenses
FROM hospital_data
GROUP BY Hospital_Name
ORDER BY total_expenses DESC
LIMIT 1;


--5)Calculate the average medical expenses per day for each hospital.

SELECT 
      Hospital_name,
	  AVG(Medical_Expenses) AS avg_expenses
FROM hospital_data
GROUP BY Hospital_Name
ORDER BY avg_expenses DESC


--6)Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.

SELECT 
    hospital_name,
    admission_date,
    discharge_date,
    (discharge_date - admission_date) AS stay_duration
FROM hospital_data
ORDER BY stay_duration DESC
LIMIT 1;


--7)Count the total number of patients treated in each city.


SELECT 
    location,
    SUM(DISTINCT patients_count) AS total_patients
FROM hospital_data
GROUP BY location
ORDER BY total_patients DESC;


--8)Calculate the average number of days patients spend in each department.

SELECT 
    department,
    AVG(discharge_date - admission_date) AS avg_stay_days
FROM hospital_data
GROUP BY department
ORDER BY avg_stay_days DESC;


--9)Find the department with the least number of patients.

SELECT 
    department,
    SUM(DISTINCT patients_count) AS total_patients
FROM hospital_data
GROUP BY department
ORDER BY total_patients LIMIT 1;


--10)Group the data by month and calculate the total medical expenses for each month.

SELECT 
    DATE_TRUNC('month', admission_date) AS month,
    SUM(medical_expenses) AS total_expenses
FROM HOSPITAL_DATA
GROUP BY month
ORDER BY month;






