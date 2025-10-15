# 🏠 Nashville Housing Data Cleaning Project

## 📋 Project Overview
This project demonstrates my ability to clean and prepare real-world data using **SQL** — focusing on accuracy, consistency, and structure.  
I used the **Nashville Housing Dataset** to showcase how raw housing records can be transformed into a clean, analysis-ready table using only SQL in **SQL Server Management Studio (SSMS)**.

The goal: turn messy data into reliable insights while following best practices for data cleaning.

---

## 🧰 Tools & Technologies
- **SQL Server Management Studio (SSMS)**
- **T-SQL** (Transact-SQL)
- **Nashville Housing Dataset (Kaggle)**

---

## 🧹 Key Data Cleaning Steps
The following operations were performed within SQL to clean and standardize the dataset:

1. **Standardized Date Formats**  
   - Converted `SaleDate` fields into a consistent `DATE` format for accurate time-based analysis.

2. **Populated Missing Property Addresses**  
   - Filled in null address values using matching `ParcelID` data from duplicate entries.

3. **Split Combined Address Fields**  
   - Parsed full address strings into separate columns: `Address`, `City`, and `State`.

4. **Normalized Owner Address Data**  
   - Broke owner address data into distinct columns for better usability and joins.

5. **Standardized Categorical Values**  
   - Unified inconsistent labels in the `SoldAsVacant` column (e.g., “Y/N” → “Yes/No”).

6. **Removed Duplicates**  
   - Identified and removed duplicate records based on unique property and sale combinations.

7. **Dropped Unused Columns**  
   - Eliminated redundant or irrelevant columns to keep the dataset lean and focused.

---

## 📊 Why This Project Matters
Clean data is the foundation of every good analysis.  
This project highlights:
- My ability to **identify and correct data quality issues**
- Use of **SQL string, date, and conditional functions**
- Attention to **data integrity and reproducibility**

It’s a great example of how I approach **real-world data preparation** — methodical, readable, and efficient.

---

## 🚀 How to Run
1. Open the `.sql` file in **SQL Server Management Studio (SSMS)**  
2. Import the **Nashville Housing Dataset** into your SQL environment  
3. Execute the SQL script step by step — each section is commented and logically structured  
4. Review the final cleaned table for analysis or visualization

---

## 🧠 Key Takeaways
- Strong grasp of SQL cleaning functions (`UPDATE`, `ALTER`, `JOIN`, `CASE`, etc.)  
- Practical experience preparing housing data for analytics  
- Emphasis on readable, well-documented SQL scripts

---

## 📂 File
- `Nashville Housing Data Cleaning Project.sql` — full SQL cleaning script

---

## 💬 Connect
If you’d like to discuss this project or my data workflow, feel free to reach out or connect on **[LinkedIn](#www.linkedin.com/in/mkhanyisi-zulu-75bba5270)**.
