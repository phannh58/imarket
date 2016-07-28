<center><h1><b>API Reference</b><h1></center>

##1. Login/Logout/Register
#### Login
**URL:** <https://imarket-api.herokuapp.com/api/sessions>

**Method: POST**

**Param request:**

  * `session[email]`, type: string, presence: true
  * `session[password]`, type: string, presence: true

**Request example:**

  * `POST: {"session": {"email": "tran.xuan.thang@framgia.com", "password": "12345678"}`

**Response:**

  * **Success**

    `{ "id": 1, "full_name": "Tran Xuan Thang", "email": "tran.xuan.thang@framgia.com", "password_digest": "$2a$10$DaBvSpp0hCcV4WoA9g2ideAnlvHwlnSm6zj2vaxPcaNRG4FTZ7sbG", "avatar": null, "auth_token": "ZkEqEXmswb-5kzkTDEcy", "created_at": "2016-07-26T03:53:13.000Z", "updated_at": "2016-07-26T06:28:49.671Z" }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "Invalid email or password" }`

    *status: 422*

--------------
#### Logout
**URL:** <https://imarket-api.herokuapp.com/api/sessions/1>

**Method: DELETE**

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)

**Request example:**

  * `DELETE: https://imarket-api.herokuapp.com/api/sessions/1`

**Response:**

   * **Success**

    `Blank`

  * **Unsuccess**

    `{ "errors": "Invalid id of user or authorization" }`

    *status: 422*

--------------
### Register

**URL:** <https://imarket-api.herokuapp.com/api/users>

**Method: POST **

**Param request:**

  * `user[full_name]`, type: string, presence: true, length: {maximum: 50}
  * `user[email]`, type: string, presence: true, length: {maximum: 255}
  * `user[password]`, type: string, presence: true, length: {minimum: 6}
  * `user[password_confirmation]`, type: string, presence: true, length: {minimum: 6}
  * `user[avata]`, type: string

**Request example:**

  * `POST: {"user": {"full_name": "Tran Xuan Thang", "email": "tran.xuan.thang@framgia.com", "password": "12345678", "password_confirmation": "12345678"}}`

**Response:**

  * **Success**

    `{ "id": 1, "full_name": "Tran Xuan Thang", "email": "tran.xuan.thang@framgia.com", "password_digest": "$2a$10$DaBvSpp0hCcV4WoA9g2ideAnlvHwlnSm6zj2vaxPcaNRG4FTZ7sbG", "avatar": null, "auth_token": "ZkEqEXmswb-5kzkTDEcy", "created_at": "2016-07-26T03:53:13.000Z", "updated_at": "2016-07-26T06:28:49.671Z" }`

    *status: 201*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------
#### Login Facebook
**URL:** <https://imarket-api.herokuapp.com/login/facebook>

**Method: GET**

**Param request:**

  * `ACCESS_TOKEN`, type: string, presence: true (In Headers of request)

**Request example:**

  * `GET: https://imarket-api.herokuapp.com/api/login/facebook`

**Response:**

  * **Success**

    `{ "id": 1, "full_name": "Tran Xuan Thang", "email": "tran.xuan.thang@framgia.com", "password_digest": "$2a$10$DaBvSpp0hCcV4WoA9g2ideAnlvHwlnSm6zj2vaxPcaNRG4FTZ7sbG", "avatar": null, "auth_token": "ZkEqEXmswb-5kzkTDEcy", "created_at": "2016-07-26T03:53:13.000Z", "updated_at": "2016-07-26T06:28:49.671Z" }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------
#### Login Google
**URL:** <https://imarket-api.herokuapp.com/api/login/google>

**Method: GET**

**Param request:**

  * `ACCESS_TOKEN`, type: string, presence: true (In Headers of request)

**Request example:**

  * `GET: https://imarket-api.herokuapp.com/api/login/google`

**Response:**

  * **Success**

    `{ "id": 1, "full_name": "Tran Xuan Thang", "email": "tran.xuan.thang@framgia.com", "password_digest": "$2a$10$DaBvSpp0hCcV4WoA9g2ideAnlvHwlnSm6zj2vaxPcaNRG4FTZ7sbG", "avatar": null, "auth_token": "ZkEqEXmswb-5kzkTDEcy", "created_at": "2016-07-26T03:53:13.000Z", "updated_at": "2016-07-26T06:28:49.671Z" }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------
##2. Commerce Center
#### Show commerce center information
**URL:** <https://imarket-api.herokuapp.com/api/commerce_centers>

**Method: GET**

**Param request:**

  * `id`, type: integer

**Request example:**

  * `GET: https://imarket-api.herokuapp.com/api/commerce_centers/1`

**Response:**

  * `{ "commerce_center": { "id": 1, "name": "Big C", "stores": [ { "id": 1, "name": "eos" }, { "id": 2, "name": "ut" }, { "id": 3, "name": "ut" }, { "id": 4, "name": "ut" }, { "id": 5, "name": "ut" }, { "id": 6, "name": "ut" }, { "id": 7, "name": "ut" }, { "id": 8, "name": "ut" }, { "id": 9, "name": "ut" }, { "id": 10, "name": "ut" }, { "id": 11, "name": "ut" }, { "id": 12, "name": "ut" } ], "store_types": [ { "id": 1, "name": "dolores", "stores": [ { "id": 1, "name": "eos" }, { "id": 2, "name": "ut" } ] }, { "id": 2, "name": "minima", "stores": [ { "id": 3, "name": "ut" }, { "id": 4, "name": "ut" } ] }, { "id": 3, "name": "minima", "stores": [ { "id": 5, "name": "ut" }, { "id": 6, "name": "ut" } ] }, { "id": 4, "name": "minima", "stores": [ { "id": 7, "name": "ut" }, { "id": 8, "name": "ut" } ] }, { "id": 5, "name": "minima", "stores": [ { "id": 9, "name": "ut" }, { "id": 10, "name": "ut" } ] }, { "id": 6, "name": "minima", "stores": [ { "id": 11, "name": "ut" }, { "id": 12, "name": "ut" } ] } ] } }`

--------------
#### Search stores with a store_type

**URL:** <https://imarket-api.herokuapp.com/api/stores>

**Method: GET**

**Param request:**

  * `store_type_id`, type: integer, presence: true

**Request example:**

  * `GET: https://imarket-api.herokuapp.com/api/stores?store_type_id=1`

**Response:**

  * `{"stores": [{"id": 1,"name": "ut"},{"id": 2,"name": "iure"}]}`

--------------
##3. Store

### Show categories in a store

**URL:** <https://imarket-api.herokuapp.com/api/stores/1/categories>

**Method: GET **

**Param request:**

  * `store_id`, type: integer

**Request example:**

  * `GET: https://imarket-api.herokuapp.com/api/stores/:store_id/categories`

  * `GET: https://imarket-api.herokuapp.com/api/stores/1/categories`

**Response:**

  * `{"categories":[{"id":1,"name":"culpa"},{"id":2,"name":"neque"},{"id":3,"name":"neque"},{"id":4,"name":"neque"},{"id":5,"name":"neque"},{"id":6,"name":"neque"}]}`

--------------
##4. User

### Show user information

**URL:** <https://imarket-api.herokuapp.com/api/users/1>

**Method: GET **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `id`, type: integer

**Request example:**

  * `GET: https://imarket-api.herokuapp.com/api/users/:id`

  * `GET: https://imarket-api.herokuapp.com/api/users/1`

**Response:**

  * `{ "id": 1, "full_name": "Tran Xuan Thang", "email": "tran.xuan.thang@framgia.com", "password_digest": "$2a$10$DaBvSpp0hCcV4WoA9g2ideAnlvHwlnSm6zj2vaxPcaNRG4FTZ7sbG", "avatar": null, "auth_token": "ZkEqEXmswb-5kzkTDEcy", "created_at": "2016-07-26T03:53:13.000Z", "updated_at": "2016-07-26T06:28:49.671Z" }`

--------------
### Update

**URL:** <https://imarket-api.herokuapp.com/api/users/1>

**Method: PATCH **

**Param request:**

  * `user[full_name]`, type: string, presence: true, length: {maximum: 50}
  * `user[email]`, type: string, presence: true, length: {maximum: 255}
  * `user[password]`, type: string, presence: true, length: {minimum: 6}
  * `user[password_confirmation]`, type: string, presence: true, length: {minimum: 6}
  * `user[avata]`, type: string
  * `Authorization`, type: string, presence: true (In Headers of request)

**Request example:**

  * `PATCH: {"user": {"full_name": "Tran Xuan Thang Rau", "email": "tran.xuan.thang@framgia.com", "password": "12345678", "password_confirmation": "12345678"}}`

**Response:**

  * **Success**

    `{ "id": 1, "full_name": "Tran Xuan Thang", "email": "tran.xuan.thang@framgia.com", "password_digest": "$2a$10$DaBvSpp0hCcV4WoA9g2ideAnlvHwlnSm6zj2vaxPcaNRG4FTZ7sbG", "avatar": null, "auth_token": "ZkEqEXmswb-5kzkTDEcy", "created_at": "2016-07-26T03:53:13.000Z", "updated_at": "2016-07-26T06:28:49.671Z" }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------
