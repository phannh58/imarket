<center><h1><b>API Reference</b><h1></center>

##1. Login/Logout/Register
#### Login
**URL:** [api/sessions](api/sessions)

**Method: POST**

**Param request:**

  * `session[email]`, type: string, presence: true
  * `session[password]`, type: string, presence: true

**Request example:**

  * `POST: {"session": {"email": "tran.xuan.thang@framgia.com", "password": "12345678"} }`

**Response:**

  * **Success**

    `{
      "user": {
        "id": 1,
        "full_name": "Tran Xuan Thang",
        "email": "tran.xuan.thang@framgia.com",
        "avatar": "/uploads/user/avatar/1/file.png",
        "birth_day": null,
        "phone_number": "0165939206",
        "auth_token": "ZQhYfFSgQpuCLu79c9sj"
      }
    }`

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
  * `user[phone_number]`, type: string, presence: true, length: {minimum: 10, maximum: 11}
  * `user[password_confirmation]`, type: string, presence: true, length: {minimum: 6}
  * `user[avata]`, type: string

**Request example:**

  * `POST: {"user": {"full_name": "Tran Xuan Thang", "email": "tran.xuan.thang@framgia.com", "password": "12345678", "password_confirmation": "12345678", "phone_number": "0987654321"}}`

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

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `name`, type: string

**Request example:**

  * `POST: https://imarketv1.herokuapp.com/api/commerce_centers`
  * `params: { "commerce_center": { "name": "Ecomart" } }`

**Response:**

  * **Success**

    `{"commerce_center":{"id":4,"name":"Ecomart","image":null } }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

### Update Commerce Center

**URL:** [api/commerce_centers](api/commerce_centers/1)

**Method: PUT **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `name`, type: string

**Request example:**

  * `params: { "commerce_center": { "name": "DHCN", "image": "/9j/4AAQSkZJRgABAgEBLAEsAAD/4RhFRXhpZgAATU0AKgAAAAgABwESAAMAAAABAAEAAAEaAAUAAAABAAAAYgEbAAUAAAABAAAAagEoAAMAAAABAAIAAAExAAIAAAAcAAAAcgEyAAIAAAAUAAAAjodpAAQAAAABAAAApAAAANAALcbAAAAnEAAtxsAAACcQQWRvYmUgUGhvdG9zaG9wIENTMyBXaW5kb3dzADIwMTU6MDc6MjEgMTA6NTY6MDkAAAAAA6ABAAMAAAAB//8AAKACAAQAAAABAAACdqADAAQAAAABAAABYgAAAAAAAAAGAQMAAwAAAAEABgAAARoABQAAAAEAAAEeARsABQAAAAEAAAEmASgAAwAAAAEAAgAAAgEABAAAAAEAAAEuAgIABAAAAAEAABcPAAAAAAAAAEgAAAABAAAASAAAAAH/2P/gABBKRklGAAECAABIAEgAAP/tAAxBZG9iZV9DTQAC/+4ADkFkb2JlAGSAAAAAAf/bAIQADAgICAkIDAkJDBELCgsRFQ8MDA8V...... } }`

**Response:**

  * **Success**

    `{"commerce_center":{"id":1,"name":"DHCN","image":"http://res-5.cloudinary.com/dnvmk5bvc/image/upload/v1481082897/o1kjarlvllkyghznxayo.jpg"}}`

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

  * `{"commerce_center":{"id":1,"name":"ĐHCN-ĐHQGHN","image":null}}`

--------------

##3. Floor

### Create new Floor

**URL:** [api/floors](api/commerce_centers/1/floors)

**Method: POST **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `name`, type: string

**Request example:**

  * `POST: https://imarketv1.herokuapp.com/api/commerce_centers/1/floors`
  * `params: { "floor": { "name": "Tang 1", "commerce_center_id": "1" } }`

**Response:**

  * **Success**

    `{"commerce_center":{"id":1,"name":"Tang 1","commerce_center_id": "1"}}`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

### Show list Floor in Commerce Center

**URL:** [api/floors](api/commerce_centers/1/floors)

**Method: GET **

**Param request:**

  * `commerce_center_id`, type: integer

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/commerce_centers/:commerce_center_id/floors`

  * `GET: https://imarketv1.herokuapp.com/api/commerce_centers/1/floors`


**Response:**

    `{
      "floors": [
        {
          "id": 1,
          "name": "Tầng 1",
          "commerce_center_id": 1
        },
        {
          "id": 2,
          "name": "Tầng 2",
          "commerce_center_id": 1
        },
        {
          "id": 3,
          "name": "Tầng 3",
          "commerce_center_id": 1
        }
      ]
    }`

--------------

### Update Floor

**URL:** [api/commerce_centers](api/commerce_centers/1/floors/1)

**Method: PUT **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `name`, type: string

**Request example:**

  * `params: { "floor": { "name": "First floor" } }`

**Response:**

  * **Success**

    `{"commerce_center":{"id":1,"name":"First floor","commerce_center_id": "1"}}`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

##4. Store Type

### List store type in commerce center

**URL:** [api/store_types](api/commerce_centers/1/store_types)

**Method: GET **

**Param request:**

  * `commerce_center_id`, type: integer

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/commerce_centers/:commerce_center_id/store_types`

  * `GET: https://imarketv1.herokuapp.com/api/commerce_centers/1/store_types`


**Response:**

    `{
      "store_types": [
        {
          "id": 1,
          "name": "Cua hang quan ao",
          "image": "http://res-4.cloudinary.com/dnvmk5bvc/image/upload/v1481083494/gwcccnde10xhdtlraffl.jpg"
        },
        {
          "id": 2,
          "name": "Cua hang dien thoai",
          "image": "http://res-2.cloudinary.com/dnvmk5bvc/image/upload/v1481083515/ixvhtulxuiwwrt6jtyn4.jpg"
        },
        {
          "id": 3,
          "name": "Cua hang sach",
          "image": "http://res-5.cloudinary.com/dnvmk5bvc/image/upload/v1481083531/c7mgimzwe3bjsl4onzla.jpg"
        },
        {
          "id": 4,
          "name": "Cua hang an uong",
          "image": "http://res-3.cloudinary.com/dnvmk5bvc/image/upload/v1481083551/h0wd0cznweokfyrbwyyg.png"
        },
        {
          "id": 5,
          "name": "Cua hang my pham",
          "image": "http://res-3.cloudinary.com/dnvmk5bvc/image/upload/v1481083571/ped7euinjmmhhcadgtc1.jpg"
        },
        {
          "id": 6,
          "name": "rap chieu phim",
          "image": "http://res-4.cloudinary.com/dnvmk5bvc/image/upload/v1481083614/hwndjhy79mxjkynyjkef.jpg"
        },
        {
          "id": 7,
          "name": "Cua hang giai tri",
          "image": "http://res-5.cloudinary.com/dnvmk5bvc/image/upload/v1481083647/d1ovw3gglz8vqax6iv1x.jpg"
        }
        ]
      }`

--------------

##5. Store

### Create new Store

**URL:** [api/stores](api/floors/1/stores)

**Method: POST **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `name`, type: string
  * `image`, type: string
  * `store_type`, type: string

**Request example:**

  * `POST: https://imarketv1.herokuapp.com/api/stores`
  * `params: { "store": { "name": "Minh Cuong", "floor_id": "1", "store_type_id": "1"} }`

**Response:**

  * **Success**

    `{
      "store": {
        "id": 3,
        "name": "Minh Cuong",
        "image": null
      }
    }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 402*

--------------


### Update Store

**URL:** [api/stores](api/floors/1/stores/1)

**Method: PATCH **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `name`, type: string
  * `store_type`, type: string
  * `image`, type: string

**Request example:**

  * `PATCH: https://imarketv1.herokuapp.com/api/floors/1/stores/1`
  * `params: { "store": { "name": "Minh Cuong 1", "store_code": "CH11", "image": "/9j/4AAQSkZJRgABAgEBLAEsAAD/4RhFRXhpZgAATU0AKgAAAAgABwESAAMAAAABAAEAAAEaAAUAAAABAAAAYgEbAAUAAAABAAAAagEoAAMAAAABAAIAAAExAAIAAAAcAAAAcgEyAAIAAAAUAAAAjodpAAQAAAABAAAApAAAANAALcbAAAAnEAAtxsAAACcQQWRvYmUgUGhvdG9zaG9wIENTMyBXaW5kb3dzADIwMTU6MDc6MjEgMTA6NTY6MDkAAAAAA6ABAAMAAAAB//8AAKACAAQAAAABAAACdqADAAQAAAABAAABYgAAAAAAAAAGAQMAAwAAAAEABgAAARoABQAAAAEAAAEeARsABQAAAAEAAAEmASgAAwAAAAEAAgAAAgEABAAAAAEAAAEuAgIABAAAAAEAABcPAAAAAAAAAEgAAAABAAAASAAAAAH/2P/gABBKRklGAAECAABIAEgAAP/tAAxBZG9iZV9DTQAC/+4ADkFkb2JlAGSAAAAAAf/bAIQADAgICAkIDAkJDBELCgsRFQ8MDA8VGBMTFRMTGBEMDAwMDAwRDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAENCwsNDg0QDg4QFA4ODhQUDg4ODhQRDAwMDAwREQwMDAwMDBEMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwM/8AAEQgAWgCgAwEiAAIRAQMRAf/dAAQAC.... } }`

**Response:**

  * **Success**

    `{
      "store": {
        "id": 1,
        "name": "Apple",
        "image": "http://res-5.cloudinary.com/dnvmk5bvc/image/upload/v1481084746/bnipe5urzp34qdnoulpm.png"
      }
    }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 402*

--------------

#### Search stores with a store_type

**URL:** [api/stores](api/floors/1/stores?store_type_id=1)

**Method: GET**

**Param request:**

  * `store_type_id`, type: integer, presence: true

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/floors/1/stores?store_type_id=1`

**Response:**

  `{
    "stores": [
      {
        "id": 1,
        "name": "Apple",
        "image": "http://res-5.cloudinary.com/dnvmk5bvc/image/upload/v1481084746/bnipe5urzp34qdnoulpm.png"
      },
      {
        "id": 2,
        "name": "SamSung",
        "image": "http://res-2.cloudinary.com/dnvmk5bvc/image/upload/v1481084775/gdpykzgnsc8ydv7jq5sb.png"
      }
    ]
  }`


--------------

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

###6 Event

### Create new Event

**URL:** [api/events](api/stores/1/events)

**Method: POST **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `name`, type: string
  * `store_id`, type: string
  * `event_type`, type: integer
  * `start_event`, type: date
  * `finish_event`, type: date

**Request example:**

  * `POST: https://imarketv1.herokuapp.com/api/stores/1/events`
  * `params: { "event": {"name": "Tung Bung Khuyen Mai 123", "content": "Giam Gia 30% tat ca cac mat hang!!!sayohyeah", "start_event": "Thu, 29 Sep 2016", "finish_event": "Thu, 30 Sep 2016", "store_id": "1", "event_type": "1"} }`

**Response:**

  * **Success**

    `{"events":[{"id":1,"name":"Tung Bung Khuyen Mai 123","content":"Giam Gia 30% tat ca cac mat hang","event_type":1,"start_event":"2016-09-29T00:00:00.000Z","finish_event":"2016-09-30T00:00:00.000Z","store_id":1}]}`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 402*

--------------

### Show events in a store

**URL:** [api/stores](api/stores/1/events)

**Method: GET **

**Param request:**

  * `store_id`, type: integer

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/stores/:store_id/events`

  * `GET: https://imarketv1.herokuapp.com/api/stores/1/events`

**Response:**

  *`{
    "events": [
      {
        "id": 1,
        "name": "Tung Bung Khuyen Mai 123",
        "content": "Giam Gia 30% tat ca cac mat hang",
        "event_type": 1,
        "start_event": "2016-09-29T00:00:00.000Z",
        "finish_event": "2016-09-30T00:00:00.000Z",
        "store_id": 1
      }
    ]
  }`

--------------


##7. Category


### Create new Category

**URL:** [api/categories](api/stores/1/categories)

**Method: POST **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `name`, type: string
  * `store_id`, type: string

**Request example:**

  * `POST: https://imarketv1.herokuapp.com/api/stores/1/categories`
  * `params: { "category": {"name": "Xiaomi", "store_id": "1" } }`

**Response:**

  * **Success**

    `{"category":{"id":4,"name":"Xiaomi","image":null,"store_id":1}}`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 402*

--------------

### Show information category

**URL:** [api/categories](api/stores/1/categories/1)

**Method: GET **

**Param request:**

  * `category_id`, type: integer

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/stores/1/categories/:category_id`

  * `GET: https://imarketv1.herokuapp.com/api/stores/1/categories/1`

**Response:**

  * **Success**

    `{"categories":[{"id":10,"name":"Iphone 1","price":"0.0","quantity":1000,"description":"The he moi nhat cua dong dien thoai Iphone","promotion_percent":0},{"id":11,"name":"Iphone 2","price":"0.0","quantity":1000,"description":"The he moi nhat cua dong dien thoai Iphone","promotion_percent":0},{"id":12,"name":"Iphone 3","price":"0.0","quantity":1000,"description":"The he moi nhat cua dong dien thoai Iphone","promotion_percent":0}]}`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

### Update Category

**URL:** [api/categories](api/stores/1/categories/1)

**Method: PATCH **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `name`, type: string
  * `image`, type: string

**Request example:**

  * `PATCH: https://imarketv1.herokuapp.com/api/stores/1/categories/1`
  * `params: { "category": { "name": "Apple1", "image": "/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCAFoAtADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQo........"} }`

**Response:**

  * **Success**

    `{"category":{"id":1,"name":"Apple1","image":"/uploads/category/image/1/file.png","store":{"id":1,"name":"Cửa Hàng số 1","store_code":"CH1","image":"/uploads/store/image/1/file.png","commerce_center":{"id":1,"name":"DHCN","image":"/uploads/commerce_center/image/1/file.png"}}}}`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 402*

--------------

###8 Product

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

    `{"products":[{"id":10,"name":"Iphone 1","price":"0.0","quantity":1000,"description":"The he moi nhat cua dong dien thoai Iphone","promotion_percent":0},{"id":11,"name":"Iphone 2","price":"0.0","quantity":1000,"description":"The he moi nhat cua dong dien thoai Iphone","promotion_percent":0},{"id":12,"name":"Iphone 3","price":"0.0","quantity":1000,"description":"The he moi nhat cua dong dien thoai Iphone","promotion_percent":0}]}`

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

    `{"product":{"id":1,"name":"Iphone 100","price":0,"quantity":null,"description":null,"promotion_percent":0}}`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

##9.Point

### List Point

**URL:** [api/points](api/points)

**Method: GET **

**Param request:**

**Request example:**

  * `GET: https://imarketv1.herokuapp.com/api/points`

  * `GET: https://imarketv1.herokuapp.com/api/points`


**Response:**

    ` {
      "points": [
        {
          "name": "A",
          "point_type": 0,
          "latitude": "21.007166",
          "longtitude": "105.801308",
          "store_type_id": 1
        },
        {
          "name": "B",
          "point_type": 1,
          "latitude": "21.036757",
          "longtitude": "105.780543",
          "store_type_id": 1
        },
        {
          "name": "D",
          "point_type": 0,
          "latitude": "21.037742",
          "longtitude": "105.782478",
          "store_type_id": 3
        },
        {
          "name": "E",
          "point_type": 4,
          "latitude": "21.006947",
          "longtitude": "105.796382",
          "store_type_id": 4
        }
      ]
    }`

--------------

##10. User

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

  * `{ "id": 1, "full_name": "Tran Xuan Thang", "email": "tran.xuan.thang@framgia.com", "avatar": null, "phone_number": "0123456789", "birth_day": "1989-09-03", "auth_token": "ZkEqEXmswb-5kzkTDEcy" }`

--------------
### Update

**URL:** [api/users](api/users/1)

**Method: PATCH **

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `user[full_name]`, type: string, presence: true, length: {maximum: 50}
  * `user[email]`, type: string, presence: true, length: {maximum: 255}
  * `user[password]`, type: string, presence: true, length: {minimum: 6}
  * `user[password_confirmation]`, type: string, presence: true, length: {minimum: 6}
  * `user[avata]`, type: string
  * `user[phone_number]`, type: string, length: {minimun: 10, maximum: 11}
  * `user[birth_day]`, type: date

**Request example:**

  * `PATCH: { "user": { "avatar": "/9j/4gIcSUNDX1BST0ZJTEUAAQEAAAIMbGNtcwIQAABtbnRyUkdCIFhZWiAH3AABABkAAwApADlhY3NwQVBQTAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9tYAAQAAAADTLWxjbXMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAApkZXNjAAAA/AAAAF5jcHJ0AAABXAAAAAt3dHB0AAABaAAAABRia3B0AAABfAAAABRyWFlaAAABkAAAABRnWFlaAAABpAAAABRiWFlaAAABuAAAABRyVFJDAAABzAAAAEBnVFJDAAABzAAAAEBiVFJDAAABzAAAAEBkZXNjAAAAAAAAAANjMgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB0ZXh0AAAAAEZCAABYWVogAAAAAAAA9tYAAQAAAADTLVhZWiAAAAAAAAADFgAAAzMAAAKkWFlaIAAAAAAAAG+iAAA49QAAA5BYWVogAAAAAAAAYpkAALeFAAAY2lhZWiAAAAAAAAAkoAAAD4QAALbPY3VydgAAAAAAAAAaAA......", "birth_day": "08/11/1995", "phone_number": "01632203543"}}`

**Response:**

  * **Success**

    `{
      "user": {
        "id": 1,
        "full_name": "Tran Xuan Thang",
        "email": "tran.xuan.thang@gmail.com",
        "avatar": "/uploads/user/avatar/2/file.png",
        "birth_day": "1995-11-08T00:00:00.000Z",
        "phone_number": "01632203543",
        "auth_token": "qffcZXwDxBxigsxLQaxF"
      }
    }`

    *status: 200*

  * **Unsuccess**

    `{ "errors": "..." }`

    *status: 422*

--------------

##11. Follow Store

###Follow

**URL:** [api/relationships](api/relationships)

**Method: PUSH**

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `follower_id`, type: int, presence: true, class: "User"
  * `followed_id`, type: int, presence: true, class: "Store"

**Request example:**

  * ` POST: {"relationship": { "follower_id": "1", "followed_id": "2"} }`

  **Response**

    * **Success**

      `{
        "id": 4,
        "follower_id": 1,
        "followed_id": 2
      }`

      *status: 200*

    * **Unsucess**

      `{"message": "Failed Follow store"}`

      *status: 422*

---------------

###Unfollow

**URL:** [api/relationships/1](api/relationships/1)

**Method: Delete**

**Param request:**

  * `Authorization`, type: string, presence: true (In Headers of request)
  * `id`, type:int, presence: true

**Request example:**

  * `DELETE: https://imarketv1.herokuapp.com/api/relationships/1`

  **Response:**

   * **Success**

    `Blank`

  * **Unsuccess**

    `{ "message": "Failed unfollow store" }`

    *status: 422*

--------------

