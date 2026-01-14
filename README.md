# VIPER-UnitTest

This repository provides a UIKit VIPER starter kit with a focus **clean architecture** and **unit testing**.


## Why this exists
VIPER can become hard to maintain when:
- dependencies are created inside layers
- singletons are used everywhere
- the Presenter becomes coupled to UIKit

This template avoids that by using:
- **Protocols** for all boundaries
- **Dependency Injection** via a Module Builder
- **Mock-friendly design** for XCTest

## What's included
- VIPER module example ('Example'')
- Service abstraction ('TitleService')
- Mock service & mocks for tests
- Unit tests for:
  - Presenter behaviour (View calls, Interactor calls)
  - Interactor behaviour (Service result -> Output callback)
  
## How to run
- Open the project in Xcode
- 'command⌘ + R' to run
- 'command⌘ + U' to run tests

## Module wiring (DI)
All dependencies are created in one place:
- 'ExampleModuleBuilder.build(service:)'

This makes it easy to:
- swap real services with mock services
- write deterministic unit tests

## License
MIT
