# Patient Readmission Risk Prediction

## Problem Statement

Patient readmissions within 30 days of discharge pose a significant challenge in healthcare. High readmission rates are not only indicators of suboptimal care but also lead to financial penalties under programs such as the Hospital Readmissions Reduction Program (HRRP). This project aims to predict the likelihood of patient readmission by leveraging advanced SQL for data preparation, Python for predictive modeling, and Tableau for data visualization.

## Table of Contents

- [Problem Statement](#problem-statement)
- [Project Overview](#project-overview)
- [Folder Structure](#folder-structure)
- [Data Collection and Preparation](#data-collection-and-preparation)
- [Predictive Analytics](#predictive-analytics)
- [Data Visualization](#data-visualization)
- [Technical Details](#technical-details)
- [Key Features](#key-features)
- [Outcome and Impact](#outcome-and-impact)

## Project Overview

The project is structured into the following phases:

1. **Data Collection and Preparation**: SQL-based extraction, transformation, and loading (ETL) of patient data.
2. **Predictive Analytics**: Developing a logistic regression model to predict 30-day readmission risks.
3. **Data Visualization**: Using Tableau and Python libraries to create interactive dashboards and visual representations of key metrics.

## Folder Structure

- **Data_loading_in_MySQL.ipynb**: MySQL-based data loading script to manage and insert patient data into a relational database.
- **generating_data.ipynb**: Python script to generate synthetic patient data, simulating real-world scenarios.
- **readmission_risk_prediction.ipynb**: Jupyter notebook for running SQL queries and implementing predictive models using Python.
- **Visualisation_script.ipynb**: Notebook to create visualizations using seaborn and matplotlib, along with Tableau for interactive dashboards.

## Data Collection and Preparation

### 1. Data Loading
- **MySQL Operations**: The `Data_loading_in_MySQL.ipynb` script performs the following SQL operations:
  - **Database Connection**: Utilizes the `mysql.connector` Python library to establish a connection to the MySQL server.
  - **Data Insertion**: Reads a CSV file into a pandas DataFrame, and inserts the data using appropriate SQL commands. The script includes error handling for data types, particularly for date fields, using the `datetime.strptime` function for proper formatting.Ensured the generated data integrity and that all the tables have related data creating a relational database.

### 2. Data Generation
- **Synthetic Data Creation**: The `generating_data.ipynb` script:
  - Creates synthetic patient data using numpy and pandas, simulating various patient attributes such as age, comorbidity count, medication count, and lab results.
  - **Feature Engineering**: Derives additional fields like `readmission_risk` using a combination of boolean logic and statistical methods, ensuring the synthetic data is representative of real-world scenarios.

## Predictive Analytics

### 3. Risk Prediction
- **Data Extraction**: In `readmission_risk_prediction.ipynb`, patient data is extracted from the MySQL database using SQL queries.
- **Feature Encoding**: Uses pandas to encode categorical variables into numerical formats suitable for modeling, utilizing techniques such as one-hot encoding.
- **Correlation Matrix**: Computes correlations between features using pandas `.corr()` method, helping identify key predictors of readmission.
- **Predictive Modeling**: Implements logistic regression using `sklearn.linear_model.LogisticRegression` to predict the probability of a patient being readmitted within 30 days.

## Data Visualization

### 4. Visualization
- **Boxplots and Heatmaps**: `Visualisation_script.ipynb` includes:
  - **Age Distribution Analysis**: Boxplot visualization using seaborn’s `sns.boxplot()` to compare age across different readmission risk levels.
  - **Correlation Heatmap**: Utilizes seaborn’s `sns.heatmap()` to display a correlation matrix, identifying relationships between variables such as length of stay, comorbidity count, and medication count.
  - **Additional Visualizations**: Multiple boxplots and scatter plots that provide insights into how various factors like medication duration and lab results impact readmission risks.

- **Tableau Dashboards**: 
  - Interactive dashboards created in Tableau, providing healthcare professionals with tools to explore and filter data dynamically. Dashboards include trend analyses, patient segmentation, and real-time risk scoring.

## Technical Details

- **SQL Expertise**: Proficient use of SQL for data extraction, manipulation, and integration within a Python environment.
- **Data Processing**: Extensive use of pandas for data cleaning, transformation, and feature engineering.
- **Machine Learning**: Implementation of logistic regression for classification tasks, utilizing scikit-learn.
- **Visualization Tools**: Expertise in seaborn and matplotlib for static plots; proficiency in Tableau for interactive dashboards.

## Key Features

- **ETL Process**: Comprehensive ETL pipeline that extracts, transforms, and loads data into a MySQL database.
- **Predictive Analytics**: Develops a logistic regression model that accurately predicts patient readmission, offering actionable insights.
- **Interactive Dashboards**: (If applicable) Tableau dashboards that allow for dynamic exploration of patient data.


## Outcome and Impact

### Outcome
- **Predictive Insights**: The model predicts patient readmission risk, allowing healthcare providers to take preemptive actions, such as closer monitoring or additional follow-up care.

### Impact
- **Reduction in Readmission Rates**: Targeted interventions can lower the number of 30-day readmissions, improving patient outcomes.
- **Cost Efficiency**: Avoidance of financial penalties under HRRP and reduced overall healthcare costs through better resource allocation.
- **Enhanced Patient Care**: Improved discharge planning and patient management based on data-driven insights.

---
