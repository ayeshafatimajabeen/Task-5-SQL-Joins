# Task 5: SQL Joins (INNER, LEFT, RIGHT, FULL)

##  Objective
To learn how to combine data from multiple related tables using different types of SQL JOINs.

##  Tools Used
- MySQL Workbench 

## Tables Used

### `Customers` Table

| CustomerID | Name   |
|------------|--------|
| 1          | Ayesha |
| 2          | Zara   |
| 3          | Mehak  |
| 4          | Sara   |

### `Orders` Table

| OrderID | CustomerID | Product   |
|---------|------------|-----------|
| 101     | 1          | Laptop    |
| 102     | 2          | Phone     |
| 103     | 1          | Mouse     |
| 104     | 5          | Keyboard  |

---

##  SQL JOIN Types Explained

### 1.  INNER JOIN

Returns rows that have matching values in both tables.

```sql
SELECT Customers.Name, Orders.Product
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
```

**Result:**

| Name   | Product |
|--------|---------|
| Ayesha | Laptop  |
| Zara   | Phone   |
| Ayesha | Mouse   |

---

### 2.  LEFT JOIN (LEFT OUTER JOIN)

Returns all rows from the left table, and matched rows from the right table. Unmatched rows return `NULL`.

```sql
SELECT Customers.Name, Orders.Product
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
```

**Result:**

| Name   | Product |
|--------|---------|
| Ayesha | Laptop  |
| Zara   | Phone   |
| Ayesha | Mouse   |
| Mehak  | NULL    |
| Sara   | NULL    |

---

### 3.  RIGHT JOIN (RIGHT OUTER JOIN)

Returns all rows from the right table, and matched rows from the left table. Unmatched rows return `NULL`.

>  Note: Not supported in SQLite. Use MySQL.

```sql
SELECT Customers.Name, Orders.Product
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
```

**Result (if CustomerID 5 exists):**

| Name   | Product   |
|--------|-----------|
| Ayesha | Laptop    |
| Zara   | Phone     |
| Ayesha | Mouse     |
| NULL   | Keyboard  |

---

### 4. FULL OUTER JOIN

Returns all records from both tables. Where there is no match, it returns `NULL`.

>  Not directly supported in MySQL/SQLite. Use `UNION` of LEFT + RIGHT joins.

```sql
SELECT Customers.CustomerID, Customers.Name, Orders.Product
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

UNION

SELECT Orders.CustomerID, Customers.Name, Orders.Product
FROM Orders
LEFT JOIN Customers ON Customers.CustomerID = Orders.CustomerID;
```

**Result (if CustomerID 5 is allowed):**

| CustomerID | Name   | Product   |
|------------|--------|-----------|
| 1          | Ayesha | Laptop    |
| 2          | Zara   | Phone     |
| 1          | Ayesha | Mouse     |
| 3          | Mehak  | NULL      |
| 4          | Sara   | NULL      |
| 5          | NULL   | Keyboard  |

---

## 📊 JOIN Comparison Table

| JOIN Type   | Only Matching | Include Left Unmatched | Include Right Unmatched|
|-------------|-------------- |------------------------|-----------------------|
| INNER JOIN  | ✅ Yes       | ❌ No                  | ❌ No                 |
| LEFT JOIN   | ✅ Matches   | ✅ Yes                 | ❌ No                 |
| RIGHT JOIN  | ✅ Matches   | ❌ No                  | ✅ Yes                |
| FULL JOIN   | ✅ Matches   | ✅ Yes                 | ✅ Yes                |

---


## ✅ Outcome

By completing this task, 
- Understand and apply all four types of JOINs.
- Gain the ability to merge and analyze data across related tables.
