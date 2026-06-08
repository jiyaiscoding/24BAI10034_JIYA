### **MONGODB TEST**





#### **EMPLOYEE TABLE**



db.employees.insertMany(\[ { empId: 101, name: "Arun", age: 25, gender: "Male", department: "IT", salary: 45000, city: "Chennai", skills: \["Java", "MongoDB", "Spring"], experience: 3, active: true }, { empId: 102, name: "Priya", age: 28, gender: "Female", department: "HR", salary: 55000, city: "Bangalore", skills: \["Recruitment", "Training"], experience: 5, active: true }, { empId: 103, name: "Rahul", age: 32, gender: "Male", department: "IT", salary: 75000, city: "Mumbai", skills: \["Python", "MongoDB", "AWS"], experience: 8, active: true }, { empId: 104, name: "Sneha", age: 26, gender: "Female", department: "Finance", salary: 50000, city: "Delhi", skills: \["Excel", "Taxation"], experience: 4, active: false }, { empId: 105, name: "Karthik", age: 30, gender: "Male", department: "IT", salary: 68000, city: "Chennai", skills: \["NodeJS", "MongoDB", "React"], experience: 7, active: true }, { empId: 106, name: "Meena", age: 24, gender: "Female", department: "Marketing", salary: 42000, city: "Coimbatore", skills: \["SEO", "Content Writing"], experience: 2, active: true } ]);



#### **STUDENTS TABLE**



db.students.insertMany(\[

&#x20; { \_id: 1, name: "Ananya",  age: 21, dept: "CS",  marks: 88, grades: \["A","B","A"], address: { city: "Chennai",   pin: "600001" }, active: true  },

&#x20; { \_id: 2, name: "Arjun",   age: 23, dept: "IT",  marks: 74, grades: \["B","C","B"], address: { city: "Madurai",   pin: "625001" }, active: true  },

&#x20; { \_id: 3, name: "Meena",   age: 20, dept: "CS",  marks: 95, grades: \["A","A","A"], address: { city: "Chennai",   pin: "600002" }, active: true  },

&#x20; { \_id: 4, name: "Ravi",    age: 22, dept: "ECE", marks: 61, grades: \["C","C","B"], address: { city: "Trichy",    pin: "620001" }, active: false },

&#x20; { \_id: 5, name: "Kavya",   age: 24, dept: "IT",  marks: 82, grades: \["A","B","B"], address: { city: "Coimbatore", pin: "641001" }, active: true  },

&#x20; { \_id: 6, name: "Dinesh",  age: 19, dept: "CS",  marks: 55, grades: \["C","D","C"], address: { city: "Salem",     pin: "636001" }, active: true  },

&#x20; { \_id: 7, name: "Priya",   age: 22, dept: "ECE", marks: 79, grades: \["B","B","A"], address: { city: "Chennai",   pin: "600003" }, active: true  },

&#x20; { \_id: 8, name: "Suresh",  age: 25, dept: "IT",  marks: 90, grades: \["A","A","B"], address: { city: "Madurai",   pin: "625002" }, active: false },

&#x20; { \_id: 9, name: "Rekha",   age: 21, dept: "CS",  marks: 68, grades: \["B","C","B"], address: { city: "Trichy",    pin: "620002" }, active: true  },

&#x20; { \_id: 10,name: "Vijay",   age: 23, dept: "ECE", marks: 45, grades: \["D","F","D"], address: { city: "Coimbatore", pin: "641002" }, active: false }

]);

#### 

#### **PRODUCTS TABLE**



db.products.insertMany(\[

&#x20; { \_id: 101, name: "Laptop",     category: "Electronics", price: 55000, stock: 20,  tags: \["portable","powerful"],         rating: 4.5, sold: 150 },

&#x20; { \_id: 102, name: "Phone",      category: "Electronics", price: 18000, stock: 50,  tags: \["portable","compact"],          rating: 4.2, sold: 320 },

&#x20; { \_id: 103, name: "Headphones", category: "Electronics", price: 3500,  stock: 80,  tags: \["audio","wireless"],           rating: 4.0, sold: 210 },

&#x20; { \_id: 104, name: "Desk Chair", category: "Furniture",    price: 8000,  stock: 15,  tags: \["ergonomic","office"],          rating: 4.3, sold: 45  },

&#x20; { \_id: 105, name: "Bookshelf",  category: "Furniture",    price: 4200,  stock: 30,  tags: \["storage","wood"],             rating: 3.8, sold: 60  },

&#x20; { \_id: 106, name: "Python Book",category: "Books",        price: 650,   stock: 100, tags: \["programming","education"],     rating: 4.7, sold: 500 },

&#x20; { \_id: 107, name: "Data Science",category:"Books",        price: 800,   stock: 70,  tags: \["data","education"],           rating: 4.6, sold: 380 },

&#x20; { \_id: 108, name: "Keyboard",   category: "Electronics", price: 2200,  stock: 0,   tags: \["mechanical","portable"],       rating: 4.4, sold: 275 },

&#x20; { \_id: 109, name: "Monitor",    category: "Electronics", price: 12000, stock: 10,  tags: \["display","4k"],               rating: 4.1, sold: 90  },

&#x20; { \_id: 110, name: "Mouse",      category: "Electronics", price: 900,   stock: 120, tags: \["wireless","compact"],         rating: 3.9, sold: 430 }

]);





#### **QUESTIONS**



1\. Find all students from the CS department with marks greater than 80.



**db.students.find({**

&#x20;   **dept: "CS",**

&#x20;   **marks: { $gt: 80 }**

**})**



2\. Find students whose marks are between 60 and 85 (inclusive) using $gte and $lte.



**db.students.find({**

&#x20;   **marks: {**

&#x20;      **$gte: 60,**

&#x20;       **$lte: 85**

&#x20;   **}**

**})**



3\. Find all students who are either from IT or ECE department using $in operator.



**db.students.find({**

&#x20;   **dept: {**

&#x20;       **$in: \["IT", "ECE"]**

&#x20;   **}**

**})**



4\. Find students NOT in the CS department using $nin and project only name and dept.



**db.students.find(**

&#x20;   **{**

&#x20;       **dept: {**

&#x20;           **$nin: \["CS"]**

&#x20;       **}**

&#x20;   **},**

&#x20;   **{**

&#x20;       **\_id: 0,**

&#x20;       **name: 1,**

&#x20;       **dept: 1**

&#x20;   **}**

**)**



5\. Find students where the address.city is 'Chennai' using dot notation.



**db.students.find({**

&#x20;   **"address.city": "Chennai"**

**})**



6\. Find total revenue per category using $group and $sum on a computed field (price × sold).



**db.products.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: "$category",**

&#x20;     **totalRevenue: {**

&#x20;       **$sum: {**

&#x20;         **$multiply: \["$price", "$sold"]**

&#x20;       **}**

&#x20;     **}**

&#x20;   **}**

&#x20; **}**

**])**



7\. Use aggregation to find total number of students and average marks per department.



**db.students.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: "$dept",**

&#x20;     **totalStudents: { $sum: 1 },**

&#x20;     **averageMarks: { $avg: "$marks" }**

&#x20;   **}**

&#x20; **}**

**])**



8\. Remove the 'scholarship' field from all students using $unset.


**db.students.updateMany(**

&#x20; **{},**

&#x20; **{**

&#x20;   **$unset: { scholarship: "" }**

&#x20; **}**

**)**

9. Add a new field 'scholarship' with value false to all CS students using $set.



**db.students.updateMany(**

&#x20; **{ dept: "CS" },**

&#x20; **{**

&#x20;   **$set: { scholarship: false }**

&#x20; **}**

**)**



10\. Increment marks of student with \_id:6 by 10 using $inc.

**db.students.updateOne(**

&#x20; **{ \_id: 6 },**

&#x20; **{**

&#x20;   **$inc: { marks: 10 }**

&#x20; **}**

**)**



11\. Find the 3rd and 4th highest scoring students using sort, skip, and limit (pagination).



**db.students.find()**

**.sort({ marks: -1 })**

**.skip(2)**

**.limit(2)**



12\. Find employees whose salary is greater than 50000 and experience greater than 5.



**db.employees.find({**

&#x20; **salary: { $gt: 50000 },**

&#x20; **experience: { $gt: 5 }**

**})**



13\. Find employees whose skills array size is greater than 2.



**db.employees.aggregate(\[**

&#x20; **{**

&#x20;   **$match: {**

&#x20;     **$expr: {**

&#x20;       **$gt: \[{ $size: "$skills" }, 2]**

&#x20;     **}**

&#x20;   **}**

&#x20; **}**

**])**



14\. Find departments whose average salary is greater than 50000.



**db.employees.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: "$department",**

&#x20;     **avgSalary: { $avg: "$salary" }**

&#x20;   **}**

&#x20; **},**

&#x20; **{**

&#x20;   **$match: {**

&#x20;     **avgSalary: { $gt: 50000 }**

&#x20;   **}**

&#x20; **}**

**])**



15\. Find minimum salary in each department.



**db.employees.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: "$department",**

&#x20;     **minSalary: { $min: "$salary" }**

&#x20;   **}**

&#x20; **}**

**])**



16\. Rename field city to location.



**db.employees.updateMany(**

&#x20; **{},**

&#x20; **{**

&#x20;   **$rename: {**

&#x20;     **"city": "location"**

&#x20;   **}**

&#x20; **}**

**)**



17\. Find products where stock is of type Number using $type operator.



**db.products.find({**

&#x20; **stock: {**

&#x20;   **$type: "number"**

&#x20; **}**

**})**



18\. Set the active status to true for all inactive students using updateMany and $set.



**db.students.updateMany(**

&#x20; **{ active: false },**

&#x20; **{**

&#x20;   **$set: { active: true }**

&#x20; **}**

**)**



