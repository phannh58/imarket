<center><h1><b>API Reference</b><h1></center>

##1. Login/Logout/Register
#### Login
**URL:** <http://localhost:3000/api/sessions>

**Method: POST**

**Param request:**

  * `session[email]`, type: string
  * `session[password]` type: string

**Request example:**

  * `GET: http://localhost:3000/api/sessions`

**Response:**

  * `{ "id": 1, "full_name": "Tran Xuan Thang", "email": "tran.xuan.thang@framgia.com", "password_digest": "$2a$10$DaBvSpp0hCcV4WoA9g2ideAnlvHwlnSm6zj2vaxPcaNRG4FTZ7sbG", "avatar": null, "auth_token": "ZkEqEXmswb-5kzkTDEcy", "created_at": "2016-07-26T03:53:13.000Z", "updated_at": "2016-07-26T06:28:49.671Z" }`

--------------
#### Logout
**URL:** <http://localhost:3000/api/sessions/1>

**Method: DELETE**

**Param request:**

  * `Authorization`, type: string <In Headers of request>

**Request example:**

  * `GET: http://localhost:3000/api/sessions/1`

**Response:**

  * `Blank`

--------------
##2. Commerce Center
#### Show commerce center information
**URL:** <http://localhost:3000/api/commerce_centers>

**Method: GET**

**Param request:**

  * `id`, type: integer

**Request example:**

  * `GET: http://localhost:3000/api/commerce_centers/1`

**Response:**

  * `{ "commerce_center": { "id": 1, "name": "Big C", "stores": [ { "id": 1, "name": "eos" }, { "id": 2, "name": "ut" }, { "id": 3, "name": "ut" }, { "id": 4, "name": "ut" }, { "id": 5, "name": "ut" }, { "id": 6, "name": "ut" }, { "id": 7, "name": "ut" }, { "id": 8, "name": "ut" }, { "id": 9, "name": "ut" }, { "id": 10, "name": "ut" }, { "id": 11, "name": "ut" }, { "id": 12, "name": "ut" } ], "store_types": [ { "id": 1, "name": "dolores", "stores": [ { "id": 1, "name": "eos" }, { "id": 2, "name": "ut" } ] }, { "id": 2, "name": "minima", "stores": [ { "id": 3, "name": "ut" }, { "id": 4, "name": "ut" } ] }, { "id": 3, "name": "minima", "stores": [ { "id": 5, "name": "ut" }, { "id": 6, "name": "ut" } ] }, { "id": 4, "name": "minima", "stores": [ { "id": 7, "name": "ut" }, { "id": 8, "name": "ut" } ] }, { "id": 5, "name": "minima", "stores": [ { "id": 9, "name": "ut" }, { "id": 10, "name": "ut" } ] }, { "id": 6, "name": "minima", "stores": [ { "id": 11, "name": "ut" }, { "id": 12, "name": "ut" } ] } ] } }`

--------------
#### Search stores with a store_type

**URL:** <http://localhost:3000/api/stores>

**Method: GET**

**Param request:**

  * `store_type_id`, type: integer

**Request example:**

  * `GET: http://localhost:3000/api/stores.json?store_type_id=1`

**Response:**

  * `{"stores": [{"id": 1,"name": "ut"},{"id": 2,"name": "iure"}]}`

--------------
##3. Store

### Show categories in a store

**URL:** <http://localhost:3000/api/stores/1/categories>

**Method: GET **

**Param request:**

  * `Blank`

**Request example:**

  * `GET: http://localhost:3000/api/stores/1/categories`

**Response:**

  * `{"categories":[{"id":1,"name":"culpa"},{"id":2,"name":"neque"},{"id":3,"name":"neque"},{"id":4,"name":"neque"},{"id":5,"name":"neque"},{"id":6,"name":"neque"}]}`

--------------
