# 📊 Nashville Housing Data Cleaning (SQL Project)

## 📌 Overview
This project focuses on cleaning and transforming a real-world housing dataset using SQL to make it analysis-ready.

The dataset contains missing values, duplicate records, and unstructured fields, reflecting common data quality issues faced in real business environments.

---

## 🛠️ Tools & Technologies
- SQL (T-SQL)
- Microsoft SQL Server

---

## 📂 Dataset
- Total Records: 56,477  
- Source Table: portproject2.dbo.NashvilleHousing  
- Working Table: NashvilleHousing_Clean  

---

## ⚙️ Data Cleaning Process

### 1. Data Duplication
Created a working table to preserve raw data integrity.

SQL:
SELECT *
INTO NashvilleHousing_Clean
FROM portproject2.dbo.NashvilleHousing;

---

### 2. Handling Missing Data
- Identified missing PropertyAddress values (29 records)
- Filled missing values using ParcelID-based self-join logic
- Addressed large-scale null fields (30,000+ rows in owner-related columns)

---

### 3. Data Standardization
- Converted SaleDate into consistent DATE format
- Standardized SoldAsVacant values:
  - 'Y' → 'Yes'
  - 'N' → 'No'

---

### 4. Data Transformation
Split unstructured address fields into usable columns:

Property Address →
- PropertySplitAddress
- PropertySplitCity

Owner Address →
- OwnerSplitAddress
- OwnerSplitCity
- OwnerSplitState

Techniques used:
- SUBSTRING
- CHARINDEX
- PARSENAME

---

### 5. Duplicate Detection
Identified duplicate records using ROW_NUMBER() with multiple business keys:

SQL:
ROW_NUMBER() OVER (
    PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference
    ORDER BY UniqueID
) AS row_num

---

### 6. Data Reduction
Removed unnecessary columns to improve dataset usability:
- OwnerAddress  
- TaxDistrict  
- PropertyAddress  
- SaleDate  

---

### 7. Data Validation
Performed validation checks:
- Verified row counts after transformations  
- Checked for remaining null values  
- Ensured categorical consistency  

---

## 📈 Key Results
- Processed dataset with 56,000+ records  
- Reduced missing PropertyAddress values from 29 to 0  
- Standardized categorical variables for analysis  
- Structured previously unorganized address fields  
- Improved dataset readiness for analytics and reporting  

---

## 💡 Skills Demonstrated
- Data cleaning and preprocessing  
- SQL joins, CTEs, and window functions  
- Handling missing and inconsistent data  
- Data transformation and normalization  
- Data validation and quality assurance  

---

## 🚀 Future Improvements
- Build a Power BI dashboard using the cleaned dataset  
- Add before vs after data quality comparison metrics  
- Optimize queries using indexing  
- Automate cleaning pipeline using ETL tools  

---

## 📎 How to Use
1. Load the raw dataset into SQL Server  
2. Run the SQL script step-by-step  
3. Use the cleaned dataset for analysis or visualization  
