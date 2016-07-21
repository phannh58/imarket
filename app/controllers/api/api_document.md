<center><h1><b>API Reference</b><h1></center>

#1. Store Api

###Get list stores in a store_type

**URL:** <http://localhost:3000/api/stores.json>

**Method: GET**

**Param request:**

  * `store_type_id`, type: integer

**Request example:**

  * `GET: http://localhost:3000/api/stores.json?store_type_id=1`

**Response:**

  * `{"stores": [{"id": 1,"name": "ut"},{"id": 2,"name": "iure"}]}`

###Get list categories in store

**URL:** <http://localhost:3000/api/stores/1/categories.json>

**Method: GET **

**Param request:**

  * `Blank`

**Request example:**

  * `GET: http://localhost:3000/api/stores/1/categories.json`

**Response:**

  * `{"categories":[{"id":1,"name":"culpa"},{"id":2,"name":"neque"},{"id":3,"name":"neque"},{"id":4,"name":"neque"},{"id":5,"name":"neque"},{"id":6,"name":"neque"}]}`

--------------
