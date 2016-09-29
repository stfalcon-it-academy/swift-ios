# Snowdog iOS Recruitment test

### Task 1
Fork this repo :) Remember to commit changes after every task (if necessary ofc).

### Task 2
Install test server - backend for the application.
You can fetch it from [this repo](https://lab.snowdog.pro/open-source/server-for-mobile-recruitment-node.js).

This should end with running server on http://localhost:8080/api/items.json

### Task 3
Implement following features:
* Download data from /items.json and save it into local database. Remember: do not perform network communication in UI. thread.
* Show items on the list from the local database.
* Pull-to-refresh. When user pulls down the list then download data again and refresh the list.
* Save images in cache - do not download image from the server every time.
* Search - when user types string into the SearchBar, narrow down the list content to data that fits the query (contains text, case insensitive)

## Thats it!
Send us link to your repo and wait for answer. Bye!
