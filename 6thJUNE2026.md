##### **Indexes**



**>db.sales.createIndex({title:1})**



title\_1



**>db.sales.getIndexes()**



\[

&#x20; { v: 2, key: { \_id: 1 }, name: '\_id\_' },

&#x20; { v: 2, key: { title: 1 }, name: 'title\_1' }

]

##### 

##### **UNIQUE-**



**>db.users.insertMany(\[**

&#x20;  **{ email:  "john@test.com", name: "john"},**

&#x20;  **{ email:  "jane@test.com", name: "jane"},**

**]);**



{

&#x20; acknowledged: true,

&#x20; insertedIds: {

&#x20;   '0': ObjectId('6a241e92fd9e189544770069'),

&#x20;   '1': ObjectId('6a241e92fd9e18954477006a')

&#x20; }

}



**>db.users.createIndex({email:1},{unique:true});**



email\_1



**>db.users.insertOne(**

&#x20;  **{ email:  "john@test.com", name: "johny"}**

**);**



MongoServerError: E11000 duplicate key error collection: test.users index: email\_1 dup key: { email: "john@test.com" }

db.users.drop()



**>db.users.insertMany(\[**

&#x20;  **{ email:  "john@test.com", name: "john"},**

&#x20;  **{ email:  "john@test.com", name: "johny"},**

&#x20;  **{ email:  "jane@test.com", name: "jane"},**

**])**



{

&#x20; acknowledged: true,

&#x20; insertedIds: {

&#x20;   '0': ObjectId('6a241edcfd9e18954477006c'),

&#x20;   '1': ObjectId('6a241edcfd9e18954477006d'),

&#x20;   '2': ObjectId('6a241edcfd9e18954477006e')

&#x20; }

}



**>db.users.deleteOne({name:'johny', email: 'john@test.com'});**



{

&#x20; acknowledged: true,

&#x20; deletedCount: 1

}



**>db.users.createIndex({email: 1},{unique:true})**



email\_1



##### **DROP INDEXES**









