# Extracting Every 3rd Sample from a Dataset

## Problem Statement
The goal of this assignment is to extract **every 3rd sample** from a dataset in **both descending and ascending order of scores**. To achieve this, we:

1. **Created a table (`mydataset`)** containing `image_id` and `score`.
2. **Inserted 50 manually selected values** into the table.
3. **Generated row numbers** using the `ROW_NUMBER()` function.
4. **Created two views (`v1` and `v2`)**:
   - `v1`: Row numbers assigned in **descending order of scores**.
   - `v2`: Row numbers assigned in **ascending order of scores**.
5. **Used a `WHERE` clause** to extract every **3rd row** from both views.

---

## Steps & SQL Queries Used

### **1. Creating the Table**
```sql
CREATE TABLE mydataset (
    image_id INT,
    score FLOAT
);
```

### **2. Inserting Sample Data**
Manually inserted 50 rows with `image_id` (3-digit numbers) and `score` (between 0 and 1):
```sql
INSERT INTO mydataset (image_id, score) VALUES
(101, 0.1234), (102, 0.8765), (103, 0.4321), (104, 0.9876), ... (150, 0.7356);
```

### **3. Creating Views with Row Numbers**
#### **View `v1` (Descending Order of Scores)**
```sql
CREATE VIEW v1 AS
SELECT
    ROW_NUMBER() OVER (ORDER BY score DESC) AS rownumber,
    *
FROM mydataset;
```

#### **View `v2` (Ascending Order of Scores)**
```sql
CREATE VIEW v2 AS
SELECT
    ROW_NUMBER() OVER (ORDER BY score ASC) AS rownumber,
    *
FROM mydataset;
```

### **4. Extracting Every 3rd Row**
#### **From `v1` (Descending Order)**
```sql
SELECT * FROM v1 WHERE rownumber % 3 = 0 LIMIT 10000;
```

#### **From `v2` (Ascending Order)**
```sql
SELECT * FROM v2 WHERE rownumber % 3 = 0 LIMIT 10000;
```

---

## Sample Output Screenshots

| View | Image |
|------|-------|
| **v1 - Descending Order** | ![Descending View](/Users/consultadd/Desktop/task/Task_1/assets/img/finaloutput1.png) |
| **v2 - Ascending Order**  | ![Ascending View](Task_1/assets/img/finaloutput2.png) |



---

## **Conclusion**
By using the `ROW_NUMBER()` function and `WHERE rownumber % 3 = 0`, we successfully extracted **every 3rd sample** from a dataset in **both descending and ascending order of scores**. This approach ensures efficient querying while keeping the dataset structured and accessible.

---

**Author:** Abdul Rahim  
**Date:** March 2025

