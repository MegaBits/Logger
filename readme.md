Logger is a simple, categorised logger for Swift.

Features:
- Log, simply, with minimal code
- Optionally prefix logs with a time interval
- Optionally use identifiers to categorise each log
- Optionally prefix logs belonging to an identifier
- Print logs for only specified identifiers

# Usage

## Logging
`Logger.log(“This is my log.”)`
> This is my log.

`Logger.log(“This is another log.”, withTimeIntervalPrefix: true)`
> 1423242662.61711 This is another log.

## Register for logs
`Logger.registerForLogs(logTypeIdentifier: “SpaceLog”, appendedPrefix: “SPACELOG: “)`

`Logger.registerForLogs(logTypeIdentifier: “EarthLog”, appendedPrefix: “EARTHLOG: “, withTimeIntervalPrefix: true)`

## Logging with identifiers

`Logger.log(logTypeIdentifier: "SpaceLog", log: "I'm in space”)`

> SPACELOG: I'm in space

`Logger.log(logTypeIdentifier: "MarsLog", log: "I'm on Mars”)`

_No log printed, because of unregistered identifier._

`Logger.log(logTypeIdentifier: "EarthLog", log: "I'm on Earth”)`

> 1423242662.61872 EARTHLOG: I'm on Earth

_Log printed with time interval prefix, as requested in registration._