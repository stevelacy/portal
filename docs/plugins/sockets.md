## Plugins sockets


available system sockets:

#### system:notification
options:
```coffee-script
title: 
  type: String
  required: true

message: 
  type: String

type:
  type: String
  default: info
  options: alert | error | warning 


// example

socket.emit 'system:notification',
  title: 'title'
  message: 'the is a message'
  type: 'success'


```
