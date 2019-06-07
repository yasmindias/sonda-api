# Sonda
Implementation of an API with a visual representation.

## Setup

#### Run on Docker

1. Run ``` docker build -t sonda . ``` to build the docker image. 
(Don't forget to add the dot ( . ) after the command).

2. Run ``` docker run -p 8080:3000 sonda rails server ``` to start the server.

To access the API send requests to ``` http://localhost:8080 ```. 
To access the visual side access ``` other link. ``` 

#### Run on local machine

1. Run ``` bundle install ``` to install all necessary gems 
2. Run ``` rails server ``` to start server

To access the API send requests to ``` http://localhost:3000 ```. 
To access the visual side access ``` other link. ```

#### Run Tests
 
- If you're running on Docker use the command ``` docker run -p 8080:3000 sonda rake test ```.
- If you're running on a local machine run ```rake test``` on your terminal

## Requests

#### GET /start
This endpoint _always_ sets the sonda to the initial position (1,1) and returns the current position and direction.

**Response**
```json
{
    "x": 1,
    "y": 1,
    "direction": 1
}
```

#### POST /move
The request body must have an array of strings with any sort of combination of the valid movements: 
**TL**: Turn Left, **TR**: Turn Right, **M**: Move.

If the array represents a valid movement this endpoint will return the current position and direction, 
else it will return the error message.

**Example**

The array used in the example will move the sonda from (1,1) to (3,2).
```json
{
  "movements": ["M", "M", "TR", "M"]
}
```

**Error response**
```json
{
    "code": 403,
    "error": "Can't go down, out of bounds!"
}
```

#### GET /current
Returns the current position and direction of the sonda.

**Response**
```json
{
    "x": 1,
    "y": 1,
    "direction": 1
}
```
