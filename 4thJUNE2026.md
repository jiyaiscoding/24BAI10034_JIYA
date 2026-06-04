##### **MUL OPERATOR-**



**>db.products.updateOne({ \_id: 5 }, { $mul: { price: 1.1 } })**



{

&#x20; acknowledged: true,

&#x20; insertedId: null,

&#x20; matchedCount: 1,

&#x20; modifiedCount: 1,

&#x20; upsertedCount: 0

}



**>db.products.updateOne({**

&#x20;   **\_id: 1**

**}, {**

&#x20;   **$mul: {**

&#x20;       **"storage.0": 2,**

&#x20;       **"storage.1": 2,**

&#x20;       **"storage.2": 2**

&#x20;   **}**

**})**



{

&#x20; acknowledged: true,

&#x20; insertedId: null,

&#x20; matchedCount: 1,

&#x20; modifiedCount: 1,

&#x20; upsertedCount: 0

}



**>db.products.updateMany({}, {**

&#x20;   **$mul: {**

&#x20;       **"spec.ram": 2**

&#x20;   **}**

**})**



{

&#x20; acknowledged: true,

&#x20; insertedId: null,

&#x20; matchedCount: 5,

&#x20; modifiedCount: 5,

&#x20; upsertedCount: 0

}



##### 

##### **UNSET OPERATOR-**



**>db.products.updateOne({**

&#x20;   **\_id: 1**

**}, {**

&#x20;   **$unset: {**

&#x20;       **price: ""**

&#x20;   **}**

**})**



{

&#x20; acknowledged: true,

&#x20; insertedId: null,

&#x20; matchedCount: 1,

&#x20; modifiedCount: 1,

&#x20; upsertedCount: 0

}



**>db.products.updateMany({}, {**

&#x20;   **$unset: {**

&#x20;       **"spec.ram": ""**

&#x20;   **}**

**})**



{

&#x20; acknowledged: true,

&#x20; insertedId: null,

&#x20; matchedCount: 5,

&#x20; modifiedCount: 5,

&#x20; upsertedCount: 0

}



**>db.products.updateMany({}, { $unset: { "storage.0": "" } })**

{

&#x20; acknowledged: true,

&#x20; insertedId: null,

&#x20; matchedCount: 5,

&#x20; modifiedCount: 5,

&#x20; upsertedCount: 0

}



**>db.products.updateMany({}, {**

&#x20;   **$unset: {**

&#x20;       **releaseDate: "",**

&#x20;       **spec: ""**

&#x20;   **}**

**})**



{

&#x20; acknowledged: true,

&#x20; insertedId: null,

&#x20; matchedCount: 5,

&#x20; modifiedCount: 5,

&#x20; upsertedCount: 0

}



##### **RENAME OPERATOR**



**>db.products.updateMany({}, {**

&#x20;   **$rename: {**

&#x20;       **nmea: "name"**

&#x20;   **}**

**})**



{

&#x20; acknowledged: true,

&#x20; insertedId: null,

&#x20; matchedCount: 5,

&#x20; modifiedCount: 0,

&#x20; upsertedCount: 0

}



**>db.products.updateMany({}, {**

&#x20;   **$rename: {**

&#x20;       **"spec.screen": "spec.screenSize"**

&#x20;   **}**

**})**



{

&#x20; acknowledged: true,

&#x20; insertedId: null,

&#x20; matchedCount: 5,

&#x20; modifiedCount: 0,

&#x20; upsertedCount: 0

}



**>db.products.updateOne({**

&#x20;**\_id: 1**

**},** 

{

&#x20;   **$rename: {**

&#x20;       **"spec.cpu": "cpu"**

&#x20;   **}**

**})**



{

&#x20; acknowledged: true,

&#x20; insertedId: null,

&#x20; matchedCount: 1,

&#x20; modifiedCount: 0,

&#x20; upsertedCount: 0

}



**>db.products.updateOne({**

&#x20;   **\_id: 2**

**}, {**

&#x20;   **$rename: {**

&#x20;       **"color": "storage"**

&#x20;   **}**

**})**





{

&#x20; acknowledged: true,

&#x20; insertedId: null,

&#x20; matchedCount: 1,

&#x20; modifiedCount: 1,

&#x20; upsertedCount: 0

}





##### **UPSERT** 



**>db.products.updateMany(**

&#x20;   **{ \_id: 6 },**

&#x20;   **{ $set: {price: 999} },**

&#x20;   **{ upsert: true}**

**)**



{

&#x20; acknowledged: true,

&#x20; insertedId: 6,

&#x20; matchedCount: 0,

&#x20; modifiedCount: 0,

&#x20; upsertedCount: 1

}

##### 

##### **DELETE ONE-**



**>db.products.deleteOne({ \_id: 1 })**



{

&#x20; acknowledged: true,

&#x20; deletedCount: 1

}



**>db.products.deleteOne({})**



{

&#x20; acknowledged: true,

&#x20; deletedCount: 1

}



##### **DELETE MANY-**



**>db.products.deleteMany({ price: 899 })**



{

&#x20; acknowledged: true,

&#x20; deletedCount: 1

}



**>db.products.deleteMany({})**



{

&#x20; acknowledged: true,

&#x20; deletedCount: 3

}



##### **RENAME AND UNSET-**



**>db.users.updateMany(**

&#x20; **{ status: "active" },** 

&#x20; **{**

&#x20;   **$rename: { "oldName": "newName" },**   

&#x20;   **$unset: { "temporaryField": "" }**     

&#x20; **}**

**);**



{

&#x20; acknowledged: true,

&#x20; insertedId: null,

&#x20; matchedCount: 0,

&#x20; modifiedCount: 0,

&#x20; upsertedCount: 0

}

test







