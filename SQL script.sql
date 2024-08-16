-- Create database
CREATE DATABASE patient_readmission;

-- Use database
USE patient_readmission;

-- Create patients table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    admission_date DATE,
    discharge_date DATE
);

-- Create diagnoses table
CREATE TABLE diagnoses (
    diagnosis_id INT PRIMARY KEY,
    patient_id INT,
    icd_code VARCHAR(10),
    diagnosis_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Create medications table
CREATE TABLE medications (
    medication_id INT PRIMARY KEY,
    patient_id INT,
    medication_name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Create lab_results table
CREATE TABLE lab_results (
    lab_result_id INT PRIMARY KEY,
    patient_id INT,
    lab_test VARCHAR(50),
    result_value DECIMAL(10, 2),
    result_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

    -- Use window functions to calculate comorbidity index
WITH patient_comorbidities AS (
    SELECT 
        patient_id,
        COUNT(DISTINCT icd_code) AS comorbidity_index
    FROM 
        diagnoses
    GROUP BY 
        patient_id
)
SELECT 
    p.patient_id,
    p.age,
    p.gender,
    pc.comorbidity_index
FROM 
    patients p
JOIN 
    patient_comorbidities pc ON p.patient_id = pc.patient_id;
    
-- Use common table expressions to calculate medication duration
WITH patient_medications AS (
    SELECT 
        patient_id,
        medication_name,
        start_date,
        end_date,
        DATEDIFF(end_date, start_date) AS medication_duration
    FROM 
        medications
)
SELECT 
    p.patient_id,
    p.age,
    p.gender,
    pm.medication_duration
FROM 
    patients p
JOIN 
    patient_medications pm ON p.patient_id = pm.patient_id;
    
-- Use subqueries to calculate lab result average
SELECT 
    p.patient_id,
    p.age,
    p.gender,
    (SELECT AVG(result_value) FROM lab_results WHERE patient_id = p.patient_id) AS lab_result_average
FROM 
    patients p;
    
-- Use indexing and optimization techniques to improve query performance
CREATE INDEX idx_patients_patient_id ON patients (patient_id);
CREATE INDEX idx_diagnoses_patient_id ON diagnoses (patient_id);
CREATE INDEX idx_medications_patient_id ON medications (patient_id);
CREATE INDEX idx_lab_results_patient_id ON lab_results (patient_id);

CREATE TABLE readmission_risk (
    patient_id INT PRIMARY KEY,
    readmission_risk INT
);
    
WITH patient_medications AS (
    SELECT 
        patient_id,
        medication_name,
        start_date,
        end_date,
        DATEDIFF(end_date, start_date) AS medication_duration
    FROM 
        medications
),
lab_result_averages AS (
    SELECT 
        patient_id,
        AVG(result_value) AS lab_result_average
    FROM 
        lab_results
    GROUP BY 
        patient_id
)
SELECT 
    p.patient_id,
    p.age,
    p.gender,
    d.comorbidity_count,
    pm.medication_duration,
    lra.lab_result_average,
    r.risk
FROM 
    patients p
JOIN 
    diagnoses d ON p.patient_id = d.patient_id
JOIN 
    patient_medications pm ON p.patient_id = pm.patient_id
JOIN 
    lab_result_averages lra ON p.patient_id = lra.patient_id
JOIN 
    readmission_risk r ON p.patient_id = r.patient_id;
    SHOW COLUMNS FROM diagnoses;

LOAD DATA INFILE "C:\\Users\\Hp\\Desktop\\IITK\\patient readmission project\\patients2.csv" INTO TABLE patients FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE "C:\\Users\\Hp\\Desktop\\IITK\\patient readmission project\\diagnoses2.csv" INTO TABLE diagnoses FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE "C:\\Users\\Hp\\Desktop\\IITK\\patient readmission project\\medications2.csv" INTO TABLE medications FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE "C:\\Users\\Hp\\Desktop\\IITK\\patient readmission project\\lab_results2.csv" INTO TABLE lab_results FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE "C:\\Users\\Hp\\Desktop\\IITK\\patient readmission project\\readmission_risk2.csv" INTO TABLE readmission_risk FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;



LOAD DATA INFILE "C:\\Users\\Hp\\Desktop\\IITK\\patient readmission project\\patients2.csv" 
REPLACE
INTO TABLE patients 
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;


select  discharge_date, admission_date, DATEDIFF(discharge_date,admission_date) as duration_admit from patients


