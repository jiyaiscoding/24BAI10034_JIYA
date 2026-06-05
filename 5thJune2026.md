##### **SALES TABLE-**



db.sales.insertMany(\[

&#x09;{ "\_id" : 1, "item" : "Americanos", "price" : 5, "size": "Short", "quantity" : 22, "date" : ISODate("2022-01-15T08:00:00Z") },

&#x09;{ "\_id" : 2, "item" : "Cappuccino", "price" : 6, "size": "Short","quantity" : 12, "date" : ISODate("2022-01-16T09:00:00Z") },

&#x09;{ "\_id" : 3, "item" : "Lattes", "price" : 15, "size": "Grande","quantity" : 25, "date" : ISODate("2022-01-16T09:05:00Z") },

&#x09;{ "\_id" : 4, "item" : "Mochas", "price" : 25,"size": "Tall", "quantity" : 11, "date" : ISODate("2022-02-17T08:00:00Z") },

&#x09;{ "\_id" : 5, "item" : "Americanos", "price" : 10, "size": "Grande","quantity" : 12, "date" : ISODate("2022-02-18T21:06:00Z") },

&#x09;{ "\_id" : 6, "item" : "Cappuccino", "price" : 7, "size": "Tall","quantity" : 20, "date" : ISODate("2022-02-20T10:07:00Z") },

&#x09;{ "\_id" : 7, "item" : "Lattes", "price" : 25,"size": "Tall", "quantity" : 30, "date" : ISODate("2022-02-21T10:08:00Z") },

&#x09;{ "\_id" : 8, "item" : "Americanos", "price" : 10, "size": "Grande","quantity" : 21, "date" : ISODate("2022-02-22T14:09:00Z") },

&#x09;{ "\_id" : 9, "item" : "Cappuccino", "price" : 10, "size": "Grande","quantity" : 17, "date" : ISODate("2022-02-23T14:09:00Z") },

&#x09;{ "\_id" : 10, "item" : "Americanos", "price" : 8, "size": "Tall","quantity" : 15, "date" : ISODate("2022-02-25T14:09:00Z")}

]);



##### **AGGREGATE FUNCTION WITH AVERAGE**



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: '$item',**

&#x20;     **averageQty: { $avg: '$quantity' },**

&#x20;   **},**

&#x20; **},**

**]);**



{

&#x20; \_id: 'Mochas',

&#x20; averageQty: 11

}

{

&#x20; \_id: 'Cappuccino',

&#x20; averageQty: 16.333333333333332

}

{

&#x20; \_id: 'Americanos',

&#x20; averageQty: 17.5

}

{

&#x20; \_id: 'Lattes',

&#x20; averageQty: 27.5

}



##### **AVERAGE USING MULTIPLYING PRICE AND AGGREGATE AND SORT-**



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: '$item',**

&#x20;     **averageAmount: { $avg: { $multiply: \['$quantity', '$price'] } },**

&#x20;   **},**

&#x20; **},**

&#x20; **{ $sort: { averageAmount: 1 } },**

**])**



{

&#x20; \_id: 'Cappuccino',

&#x20; averageAmount: 127.33333333333333

}

{

&#x20; \_id: 'Americanos',

&#x20; averageAmount: 140

}

{

&#x20; \_id: 'Mochas',

&#x20; averageAmount: 275

}

{

&#x20; \_id: 'Lattes',

&#x20; averageAmount: 562.5

}



##### **TO PRINT AVG>150:**

##### 

**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: '$item',**

&#x20;     **averageAmount: { $avg: { $multiply: \['$quantity', '$price'] } },**

&#x20;   **},**

&#x20; **},**

&#x20; **{ $match: { averageAmount: { $gt: 150 } } },**

&#x20; **{ $sort: { averageAmount: 1 } },**

**]);**



{

&#x20; \_id: 'Mochas',

&#x20; averageAmount: 275

}

{

&#x20; \_id: 'Lattes',

&#x20; averageAmount: 562.5

}



##### 

##### **COUNT**



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: '$item',**

&#x20;     **itemCount: { $count: {} },**

&#x20;   **},**

&#x20; **},**

**])**



{

&#x20; \_id: 'Mochas',

&#x20; itemCount: 1

}

{

&#x20; \_id: 'Cappuccino',

&#x20; itemCount: 3

}

{

&#x20; \_id: 'Americanos',

&#x20; itemCount: 4

}

{

&#x20; \_id: 'Lattes',

&#x20; itemCount: 2

}



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: '$item',**

&#x20;     **itemCount: { $count: {} },**

&#x20;   **},**

&#x20; **},**

&#x20; **{**

&#x20;   **$match: { itemCount: { $gt: 2 } },**

&#x20; **},**

**]);**



{

&#x20; \_id: 'Americanos',

&#x20; itemCount: 4

}

{

&#x20; \_id: 'Cappuccino',

&#x20; itemCount: 3

}



#### 

#### **SUM** 



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: null,**

&#x20;     **totalQty: { $sum: '$quantity' },**

&#x20;   **},**

&#x20; **},**

**]);**



{

&#x20; \_id: null,

&#x20; totalQty: 185

}

items:



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: '$item',**

&#x20;     **totalQty: { $sum: '$quantity' },**

&#x20;   **},**

&#x20; **},**

**]);**



{

&#x20; \_id: 'Mochas',

&#x20; totalQty: 11

}

{

&#x20; \_id: 'Cappuccino',

&#x20; totalQty: 49

}

{

&#x20; \_id: 'Americanos',

&#x20; totalQty: 70

}

{

&#x20; \_id: 'Lattes',

&#x20; totalQty: 55

}



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: '$item',**

&#x20;     **totalQty: { $sum: '$quantity' },**

&#x20;   **},**

&#x20; **},**

&#x20; **{ $sort: { totalQty: -1 } },**

**]);**



{

&#x20; \_id: 'Americanos',

&#x20; totalQty: 70

}

{

&#x20; \_id: 'Lattes',

&#x20; totalQty: 55

}

{

&#x20; \_id: 'Cappuccino',

&#x20; totalQty: 49

}

{

&#x20; \_id: 'Mochas',

&#x20; totalQty: 11

}



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: '$item',**

&#x20;     **totalQty: { $sum: '$quantity' },**

&#x20;   **},**

&#x20; **},**

&#x20; **{ $match: { totalQty: { $gt: 50 } } },**

&#x20; **{ $sort: { totalQty: -1 } },**

**]);**



{

&#x20; \_id: 'Americanos',

&#x20; totalQty: 70

}

{

&#x20; \_id: 'Lattes',

&#x20; totalQty: 55

}



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: '$size',**

&#x20;     **totalAmount: { $sum: { $multiply: \['$price', '$quantity'] } },**

&#x20;   **},**

&#x20; **},**

&#x20; **{ $sort: { totalAmount: -1 } },**

**]);**



{

&#x20; \_id: 'Tall',

&#x20; totalAmount: 1285

}

{

&#x20; \_id: 'Grande',

&#x20; totalAmount: 875

}

{

&#x20; \_id: 'Short',

&#x20; totalAmount: 182

}



##### 

##### **MAX**



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: null,**

&#x20;     **maxQty: { $max: '$quantity' },**

&#x20;   **},**

&#x20; **},**

&#x20; **{**

&#x20;   **$project: {**

&#x20;     **\_id: 0,**

&#x20;   **},**

&#x20; **},**

**]);**



{

&#x20; maxQty: 30

}



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: '$item',**

&#x20;     **maxQty: { $max: '$quantity' },**

&#x20;   **},**

&#x20; **},**

**]);**



{

&#x20; \_id: 'Cappuccino',

&#x20; maxQty: 20

}

{

&#x20; \_id: 'Americanos',

&#x20; maxQty: 22

}

{

&#x20; \_id: 'Lattes',

&#x20; maxQty: 30

}

{

&#x20; \_id: 'Mochas',

&#x20; maxQty: 11

}



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: '$item',**

&#x20;     **maxQty: { $max: { $multiply: \['$quantity', '$price'] } },**

&#x20;   **},**

&#x20; **},**

**]);**



{

&#x20; \_id: 'Lattes',

&#x20; maxQty: 750

}

{

&#x20; \_id: 'Americanos',

&#x20; maxQty: 210

}

{

&#x20; \_id: 'Cappuccino',

&#x20; maxQty: 170

}

{

&#x20; \_id: 'Mochas',

&#x20; maxQty: 275

}



##### 

##### **MIN**



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: null,**

&#x20;     **maxQty: { $min: '$quantity' },**

&#x20;   **},**

&#x20; **},**

&#x20; **{**

&#x20;   **$project: {**

&#x20;     **\_id: 0,**

&#x20;   **},**

&#x20; **},**

**]);**



{

&#x20; maxQty: 11

}

&#x20;

**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: '$item',**

&#x20;     **minQty: { $min: '$quantity' },**

&#x20;   **},**

&#x20; **},**

**]);**



{

&#x20; \_id: 'Mochas',

&#x20; minQty: 11

}

{

&#x20; \_id: 'Cappuccino',

&#x20; minQty: 12

}

{

&#x20; \_id: 'Americanos',

&#x20; minQty: 12

}

{

&#x20; \_id: 'Lattes',

&#x20; minQty: 25

}



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: '$item',**

&#x20;     **maxQty: { $min: { $multiply: \['$quantity', '$price'] } },**

&#x20;   **},**

&#x20; **},**

**]);**



{

&#x20; \_id: 'Mochas',

&#x20; maxQty: 275

}

{

&#x20; \_id: 'Lattes',

&#x20; maxQty: 375

}

{

&#x20; \_id: 'Americanos',

&#x20; maxQty: 110

}

{

&#x20; \_id: 'Cappuccino',

&#x20; maxQty: 72

}





##### WITH CRUD



**>db.sales.aggregate(\[**

&#x20; **{**

&#x20;   **$group: {**

&#x20;     **\_id: "$item",                  // Group by the coffee name**

&#x20;     **ordersCount: { $sum: 1 },      // Count the total number of orders**

&#x20;     **totalQty: { $sum: "$quantity" } // Add up all the quantities**

&#x20;   **}**

&#x20; **}**

**]);**



{

&#x20; \_id: 'Mochas',

&#x20; ordersCount: 1,

&#x20; totalQty: 11

}

{

&#x20; \_id: 'Lattes',

&#x20; ordersCount: 2,

&#x20; totalQty: 55

}

{

&#x20; \_id: 'Americanos',

&#x20; ordersCount: 4,

&#x20; totalQty: 70

}

{

&#x20; \_id: 'Cappuccino',

&#x20; ordersCount: 3,

&#x20; totalQty: 49

}





