# Installation:
## 1.
```sh
$ npm install
```
## 2.
```sh
$ npm start
```
## 3.
### Server started at:
```sh
http://localhost:8080/api
```

# Usage

**Show items**
----
  Returns json data about items.

* **URL**

    `/items`

* **Method:**

    `GET`
  
*  **URL Params**

    **Optional:**
 
    *   `timestamp=[long]`
        
        example:
        `/items?timestamp=1468595269800`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:**
    ```
    [
            {
                id: 0,
                name: "Item (0)",
                description: "Description of item (0)",
                icon: "http://localhost:8080/api/items/0/icon.png",
                timestamp: 1468595269800,
                url: "http://localhost:8080/api/items/0"
            },
            {
                id: 1,
                name: "Item (1)",
                description: "Description of item (1)",
                icon: "http://localhost:8080/api/items/1/icon.png",
                timestamp: 1468595269800,
                url: "http://localhost:8080/api/items/1"
            }
    ]
    ```

* **Error Response:**

  * **Code:** 404 <br />
    **Content:**
    ```
    {
            error: {
                message: "Not Found",
                error: {
                    status: 404
                }
            }
    }
    ```

**Show singe item**
----
  Returns json data about single item.

* **URL**

    `/items/:id`

* **Method:**

    `GET`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:**
    ```
        {
            id: 0,
            name: "Item (0)",
            description: "Description of item (0)",
            icon: "http://localhost:8080/api/items/0/icon.png",
            timestamp: 1468595269800,
            url: "http://localhost:8080/api/items/0"
        }
    ```

* **Error Response:**

  * **Code:** 404 <br />
    **Content:**
    ```
    {
            error: {
                message: "Not Found",
                error: {
                    status: 404
                }
            }
    }
    ```

# Configuration

You can change server configuration in `config.js` file in root directory.

Default configuration:
```
  port: 8080,
  prefix: "/api",
  itemsCount: 100,
  random: false,
  sortRandom: false, // true only if random is false
  incrementItems: true // adds item on every request, true only if random is false
```