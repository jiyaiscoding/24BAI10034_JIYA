# **MONGODB TEST**



#### **DATABASE**



db.employees.insertMany(\[

{

&#x20;   empId: 101,

&#x20;   name: "Arun",

&#x20;   age: 25,

&#x20;   department: "IT",

&#x20;   salary: 45000,

&#x20;   city: "Chennai",

&#x20;   experience: 3,

&#x20;   skills: \["Java","MongoDB","Spring"],

&#x20;   active: true

},

{

&#x20;   empId: 102,

&#x20;   name: "Priya",

&#x20;   age: 28,

&#x20;   department: "HR",

&#x20;   salary: 55000,

&#x20;   city: "Bangalore",

&#x20;   experience: 5,

&#x20;   skills: \["Recruitment","Training"],

&#x20;   active: true

},

{

&#x20;   empId: 103,

&#x20;   name: "Rahul",

&#x20;   age: 32,

&#x20;   department: "IT",

&#x20;   salary: 75000,

&#x20;   city: "Mumbai",

&#x20;   experience: 8,

&#x20;   skills: \["Python","MongoDB","AWS"],

&#x20;   active: true

},

{

&#x20;   empId: 104,

&#x20;   name: "Sneha",

&#x20;   age: 26,

&#x20;   department: "Finance",

&#x20;   salary: 50000,

&#x20;   city: "Delhi",

&#x20;   experience: 4,

&#x20;   skills: \["Excel","Taxation"],

&#x20;   active: false

},

{

&#x20;   empId: 105,

&#x20;   name: "Karthik",

&#x20;   age: 30,

&#x20;   department: "IT",

&#x20;   salary: 68000,

&#x20;   city: "Chennai",

&#x20;   experience: 7,

&#x20;   skills: \["NodeJS","MongoDB","React"],

&#x20;   active: true

}

]);







#### **QUESTIONS**



> Q1. Insert one employee document.



**db.employees.insertOne({**

&#x20;   **empId: 106,**

&#x20;   **name: "Jiya",**

&#x20;   **age: 20,**

&#x20;   **department: "HR",**

&#x20;   **salary: 80000,**

&#x20;   **city: "Gurgaon",**

&#x20;   **experience: 2,**

&#x20;   **skills: \["Communication", "Recruitment"],**

&#x20;   **active: true**

**})**



> Q2. Insert multiple employee documents.



**db.employees.insertMany(\[**

**{**

&#x20;   **empId: 106,**

&#x20;   **name: "Jiya",**

&#x20;   **age: 20,**

&#x20;   **department: "HR",**

&#x20;   **salary: 80000,**

&#x20;   **city: "Gurgaon",**

&#x20;   **experience: 2,**

&#x20;   **skills: \["Communication", "Recruitment"],**

&#x20;   **active: true**

**},**

**{**

&#x20;   **empId: 107,**

&#x20;   **name: "Viraj",**

&#x20;   **age: 27,**

&#x20;   **department: "Sales",**

&#x20;   **salary: 48000,**

&#x20;   **city: "Hyderabad",**

&#x20;   **experience: 4,**

&#x20;   **skills: \["Communication"],**

&#x20;   **active: true**

**}**

**])**



> Q3. Find one employee from IT department.



**db.employees.findOne({**

&#x20;   **department: "IT"**

**})**



> Q4. Display all employees.



**db.employees.find()**



> Q5. Display only name and salary.



**db.employees.find(**

&#x20;   **{},**

&#x20;   **{**

&#x20;       **\_id: 0,**

&#x20;       **name: 1,**

&#x20;       **salary: 1**

&#x20;   **}**

**)**



> Q6. Find employees with salary equal to 50000.



**db.employees.find({**

&#x20;   **salary: 50000**

**})**



> Q7. Find employees with salary less than 60000.



**db.employees.find({**

&#x20;   **salary: {**

&#x20;       **$lt: 60000**

&#x20;   **}**

**})**



> Q8. Find employees with salary greater than or equal to 60000.



**db.employees.find({**

&#x20;   **salary: {**

&#x20;       **$gte: 60000**

&#x20;   **}**

**})**



> Q9. Find employees whose age is not equal to 30.



**db.employees.find({**

&#x20;   **age: {**

&#x20;       **$ne: 30**

&#x20;   **}**

**})**



> Q10. Find employees from Chennai or Mumbai.



**db.employees.find({**

&#x20;   **city: {**

&#x20;       **$in: \["Chennai", "Mumbai"]**

&#x20;   **}**

**})**



> Q11. Find employees not from Chennai.



**db.employees.find({**

&#x20;   **city: {**

&#x20;       **$ne: "Chennai"**

&#x20;   **}**

**})**





**>** Q12. Find IT employees with salary > 50000.



db.employees.find({

&#x20;   department: "IT",

&#x20;   salary: {

&#x20;       $gt: 50000

&#x20;   }

})



> Q13. Find employees from Chennai OR Bangalore.



db.employees.find({

&#x20;   city: {

&#x20;       $in: \["Chennai", "Bangalore"]

&#x20;   }

}) 



> Q14. Find employees NOT earning above 60000.



db.employees.find({

&#x20;   salary: {

&#x20;       $not: {

&#x20;           $gt: 60000

&#x20;       }

&#x20;   }

})



> Q15. Find employees neither in IT nor HR.



db.employees.find({

&#x20;   department: {

&#x20;       $nin: \["IT", "HR"]

&#x20;   }

})



> Q16. Find documents containing experience field.



db.employees.find({

&#x20;   experience: {

&#x20;       $exists: true

&#x20;   }

})



> Q17. Find documents where salary is Integer.



db.employees.find({

&#x20;   salary: {

&#x20;       $type: "int"

&#x20;   }

})



> Q18. Find employees having MongoDB skill.



db.employees.find({

&#x20;   skills: "MongoDB"

})



> Q19. Find employees having both MongoDB and AWS.



db.employees.find({

&#x20;   skills: {

&#x20;       $all: \["MongoDB", "AWS"]

&#x20;   }

})



> Q20. Find employees with exactly 3 skills.



db.employees.find({

&#x20;   skills: {

&#x20;       $size: 3

&#x20;   }

})

&#x20;

> Q21. Find employees having Java skill using elemMatch.



db.employees.find({

&#x20;   skills: {

&#x20;       $elemMatch: {

&#x20;           $eq: "Java"

&#x20;       }

&#x20;   }

})



> Q22. Display employees sorted by salary descending.



db.employees.find()

.sort({

&#x20;   salary: -1

})



> Q23. Display top 3 highest paid employees.



db.employees.find()

.sort({

&#x20;   salary: -1

})

.limit(3)



> Q24. Increase salary of employee 101 by 5000.



db.employees.updateOne(

&#x20;   { empId: 101 },

&#x20;   {

&#x20;       $inc: {

&#x20;           salary: 5000

&#x20;       }

&#x20;   }

)



> Q25. Increase salary of all IT employees by 10%.



db.employees.updateMany(

&#x20;   { department: "IT" },

&#x20;   {

&#x20;       $mul: { salary: 1.1 }

&#x20;   }

)

