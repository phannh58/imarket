<center><h1><b>API Reference</b><h1></center>

##1. Login/Logout/Register
#### Login
**URL:** [api/sessions](api/sessions)

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
**URL:** [api/sessions](api/sessions/1)

**Method: DELETE**

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)

**Request example:**

  * `DELETE: https://imarketv1.herokuapp.com/api/sessions/1`

**Response:**

   * **Success**

    `Blank`

  * **Unsuccess**

    `{ "errors": "Invalid id of user or authorization" }`

    *status: 422*

--------------
### Register

**URL:** [api/users](api/users)

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
**URL:** [api/social](api/login/google)

**Method: GET**

**Param request:**

  * `ACCESS_TOKEN`, type: string, presence: true (In Headers of request)

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/login/facebook`

**Response:**

  * **Success**

    `{ "id": 1, "full_name": "Tran Xuan Thang", "email": "tran.xuan.thang@framgia.com", "password_digest": "$2a$10$DaBvSpp0hCcV4WoA9g2ideAnlvHwlnSm6zj2vaxPcaNRG4FTZ7sbG", "avatar": null, "auth_token": "ZkEqEXmswb-5kzkTDEcy", "created_at": "2016-07-26T03:53:13.000Z", "updated_at": "2016-07-26T06:28:49.671Z" }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------
#### Login Google

**URL:** [api/social](api/login/google)

**Method: GET**

**Param request:**

  * `ACCESS_TOKEN`, type: string, presence: true (In Headers of request)

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/login/google`

**Response:**

  * **Success**

    `{ "id": 1, "full_name": "Tran Xuan Thang", "email": "tran.xuan.thang@framgia.com", "password_digest": "$2a$10$DaBvSpp0hCcV4WoA9g2ideAnlvHwlnSm6zj2vaxPcaNRG4FTZ7sbG", "avatar": null, "auth_token": "ZkEqEXmswb-5kzkTDEcy", "created_at": "2016-07-26T03:53:13.000Z", "updated_at": "2016-07-26T06:28:49.671Z" }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------
##2. Commerce Center

### Create new Commerce Center

**URL:** [api/commerce_centers](api/commerce_centers)

**Method: POST **

**Param request:**

  * `auth_token`, type: string
  * `name`, type: string

**Request example:**

  * `POST: https://imarketv1.herokuapp.com/api/commerce_centers`
  * `params: { "auth_token": "EjBV_mV-d9GmYxmxRdcP", "commerce_center": { "name": "Ecomart" } }`

**Response:**
  * **Success**

    `{"commerce_center":{"id":4,"name":"Ecomart","image":{"image":{"url":null}}}}`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

### Update Commerce Center

**URL:** [api/commerce_centers](api/commerce_center/1)

**Method: PUT **

**Param request:**

  * `auth_token`, type: string
  * `name`, type: string

**Request example:**

  * `params: { "auth_token": "EjBV_mV-d9GmYxmxRdcP", "commerce_center": { "name": "Ecomart Thang Long" } }`

**Response:**
  * **Success**

    `{"commerce_center":{"id":4,"name":"Ecomart Thang Long","image":{"image":{"url":null}}}}`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

### Show list Commerce Center

**URL:** [api/commerce_centers](api/commerce_centers)

**Method: GET **

**Param request:**

  * `params[:search]`, type: string

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/commerce_centers?search='string'`

**Response:**
  * `search=`

    * `{"commerce_centers":[{"id":3,"name":"Media-mart"},{"id":2,"name":"Metro Thang Long"},{"id":1,"name":"Big C Thang Long"}]}`

  * `search=Metro`

    * `{"commerce_centers":[{"id":2,"name":"Metro Thang Long"}]}`


--------------

#### Show commerce center information
**URL:** [api/commerce_centers](api/commerce_centers/1)

**Method: GET**

**Param request:**

  * `id`, type: integer

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/commerce_centers/1`

**Response:**

  * `{ "commerce_center": { "id": 1, "name": "Big C", "stores": [ { "id": 1, "name": "eos" }, { "id": 2, "name": "ut" }, { "id": 3, "name": "ut" }, { "id": 4, "name": "ut" }, { "id": 5, "name": "ut" }, { "id": 6, "name": "ut" }, { "id": 7, "name": "ut" }, { "id": 8, "name": "ut" }, { "id": 9, "name": "ut" }, { "id": 10, "name": "ut" }, { "id": 11, "name": "ut" }, { "id": 12, "name": "ut" } ], "store_types": [ { "id": 1, "name": "dolores", "stores": [ { "id": 1, "name": "eos" }, { "id": 2, "name": "ut" } ] }, { "id": 2, "name": "minima", "stores": [ { "id": 3, "name": "ut" }, { "id": 4, "name": "ut" } ] }, { "id": 3, "name": "minima", "stores": [ { "id": 5, "name": "ut" }, { "id": 6, "name": "ut" } ] }, { "id": 4, "name": "minima", "stores": [ { "id": 7, "name": "ut" }, { "id": 8, "name": "ut" } ] }, { "id": 5, "name": "minima", "stores": [ { "id": 9, "name": "ut" }, { "id": 10, "name": "ut" } ] }, { "id": 6, "name": "minima", "stores": [ { "id": 11, "name": "ut" }, { "id": 12, "name": "ut" } ] } ] } }`

--------------
#### Search stores with a store_type

**URL:** [api/stores](api/stores)

**Method: GET**

**Param request:**

  * `store_type_id`, type: integer, presence: true

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/stores?store_type_id=1`

**Response:**

  * `{"stores": [{"id": 1,"name": "ut"},{"id": 2,"name": "iure"}]}`

--------------
##3. Store

### Show categories in a store

**URL:** [api/categories](api/stores/1/categories)

**Method: GET **

**Param request:**

  * `store_id`, type: integer

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/stores/:store_id/categories`

  * `GET: https://imarketv1.herokuapp.com/api/stores/1/categories`

**Response:**

  * `{"categories":[{"id":1,"name":"culpa"},{"id":2,"name":"neque"},{"id":3,"name":"neque"},{"id":4,"name":"neque"},{"id":5,"name":"neque"},{"id":6,"name":"neque"}]}`

--------------

### Show events in a store

**URL:** [api/events](api/stores/1/events)

**Method: GET **

**Param request:**

  * `store_id`, type: integer

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/stores/:store_id/events`

  * `GET: https://imarketv1.herokuapp.com/api/stores/1/events`

**Response:**

  * {
    "events":
    [
      {
        "id": 1,
        "name": "event 1",
        "content": null,
        "start_event": "2016-09-09",
        "finish_event": "2016-09-20",
        "store": {
          "id": 1,
          "name": "store 1"
        }
      },
      {
        "id": 2,
        "name": "event 2",
        "content": "this is event 2 in store",
        "start_event": "2016-09-09",
        "finish_event": "2016-09-20",
        "store": {
          "id": 1,
          "name": "store 1"
        }
      }
    ]
  }

--------------

##4. Category

### Show products in a category

**URL:** [api/products](api/categories/1/products)

**Method: GET **

**Param request:**

  * `category_id`, type: integer

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/stores/1/categories/:category_id`

  * `GET: https://imarketv1.herokuapp.com/api/stores/1/categories/1`

**Response:**

  * **Success**

    `{"categories":[{"id":1,"name":"product 1","price":30000000,"quantity":2,"product_code":"MSP1","sale_off":0},{"id":2,"name":"product 2","price":100000000,"quantity":3,"product_code":"MSP2","sale_off":0}]}`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

### Show information for product

**URL:** [api/products](api/categories/1/products/1)

**Method: GET **

**Param request:**

  * `product_id`, type: integer

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/categories/1/products/:product_id`

  * `GET: https://imarketv1.herokuapp.com/api/categories/1/products/1`

**Response:**

  * **Success**

    `{"product":{"id":1,"name":"product 1","price":30000000,"quantity":2,"product_code":"MSP1","sale_off":0}}`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

##5. User

### Show user information

**URL:** [api/users](api/users/1)

**Method: GET **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `id`, type: integer

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/users/:id`

  * `GET: https://imarketv1.herokuapp.com/api/users/1`

**Response:**

  * `{ "id": 1, "full_name": "Tran Xuan Thang", "email": "tran.xuan.thang@framgia.com", "password_digest": "$2a$10$DaBvSpp0hCcV4WoA9g2ideAnlvHwlnSm6zj2vaxPcaNRG4FTZ7sbG", "avatar": null, "phone_number": "0123456789", "birth_day": "1989-09-03", "auth_token": "ZkEqEXmswb-5kzkTDEcy", "created_at": "2016-07-26T03:53:13.000Z", "updated_at": "2016-07-26T06:28:49.671Z" }`

--------------
### Update

**URL:** [api/users](api/users/1)

**Method: PATCH **

**Param request:**

  * `user[full_name]`, type: string, presence: true, length: {maximum: 50}
  * `user[email]`, type: string, presence: true, length: {maximum: 255}
  * `user[password]`, type: string, presence: true, length: {minimum: 6}
  * `user[password_confirmation]`, type: string, presence: true, length: {minimum: 6}
  * `user[avata]`, type: string
  * `user[phone_number]`, type: string, length: {minimun: 10, maximum: 11}
  * `Authorization`, type: string, presence: true (In Headers of request)

**Request example:**

  * `PATCH: {"user": {"full_name": "Tran Xuan Thang Rau", "email": "tran.xuan.thang@framgia.com", "password": "12345678", "password_confirmation": "12345678"}}`

**Response:**

  * **Success**

    `{ "id": 1, "full_name": "Tran Xuan Thang", "email": "tran.xuan.thang@framgia.com", "password_digest": "$2a$10$DaBvSpp0hCcV4WoA9g2ideAnlvHwlnSm6zj2vaxPcaNRG4FTZ7sbG", "avatar": null, "phone_number": "0123456789", "birth_day": "1989-09-03", "auth_token": "ZkEqEXmswb-5kzkTDEcy", "created_at": "2016-07-26T03:53:13.000Z", "updated_at": "2016-07-26T06:28:49.671Z" }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------
