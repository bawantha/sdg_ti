# SDG TI

SDG-TI is a location search app designed to demonstrate the use of Flutter for mobile app development. This document outlines the architecture of the app, key decisions made during its development, and instructions for setting up and running the app.


## Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:

- Flutter SDK, version 3.19.4 or higher
- Dart SDK (comes with Flutter)
- A suitable IDE (e.g., Android Studio, VS Code)

> **Important Note:** You need to add a `.env` file at the project root directory. See `.env.example` for the format.

### Installation

Follow these steps to install and run SDG TI:

1. **Setup**

```bash
git clone https://github.com/bawantha/sdg_ti
cd sdg-ti
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```
2. **Run**

To run app app, you can use different build flavors depending on your target environment. I have configured two flavors for this project: `stage` for staging and `prod` for production. Here's how to run the app for each environment:

-stage
  ```bash
  flutter run --flavor stage --dart-define=variant=stage
  ```
  -prod
  ```bash
  flutter run --flavor prod --dart-define=variant=prod
  ```
  
  
  ## Directory Structure and Architecture

 app is structured using Feature-Driven Development (FDD) combined with clean architecture principles. This approach ensures that codebase is organized around the individual features of the app, each of which is encapsulated within its own directory. Here’s a breakdown of the structure and the rationale behind FDD:

- `/features`
  - Each feature of the app, like `search`, is contained in its own directory. This allows for focused development and maintenance.
    - `/search`
      - `/data` - The data layer is responsible for the data handling logic, including data sources and models.
        - `/data_source`
          - `/remote` - Handles data retrieval from remote sources, such as APIs.
            - `search_api.dart` - Defines the interface for search-related API calls.
        - `/models` - Defines the structure of the data objects.
          - `country_model.dart` - Represents the data model for countries.
          - `state_model.dart` - Represents the data model for states.
        - `/repository`
          - `search_repository_impl.dart` - Implements the data retrieval and storage logic defined by the repository interfaces.
      - `/domain`
        - `/repository` - Contains abstract definitions of data repositories.
          - `search_repository.dart` - Outlines the contract for the search repository functionalities.
        - `/usecase` - Encapsulates business rules and use cases.
          - `get_countries_use_case.dart` - Business logic for retrieving country data.
          - `get_states_use_case.dart` - Business logic for retrieving state data.
      - `/presentation`
        - `/cubit` - Implements the Cubit pattern for state management.
          - `search_cubit.dart` - Manages state transitions and business logic invocation for the search feature.
        - `/pages`
          - `search_page.dart` - UI layer that users interact with.


Combining FDD with clean architecture also ensures that the separation of concerns is respected at both the high level (across features) and the low level (within the feature's internal layers).

## State Management with Bloc

For state management in the SDG TI app, I utilize the Bloc library. Bloc helps me maintain a clear separation between presentation and business logic, which is crucial for building a robust, maintainable application. Here's an overview of how Bloc fits into the app's architecture:

## Dependency Management with get_it and injectable

For the SDG TI app, I employ `get_it` in conjunction with `injectable` to manage dependencies. This combination provides a robust and scalable solution for Dependency Injection (DI), allowing for loose coupling and more maintainable code. Below is an explanation of the setup and the advantages it offers:

## Secret Management

App prioritizes the secure handling of environment-specific variables, such as API keys. To achieve this, I use a `.env` file for development.

### The `.env` File
- The `.env` file, located at the project's root, contains all the secrets

### `.env.example` Template

maintain `.env.example` to update to reffer for users
> ```
> API_KEY=xxxxxxx
> USER_AGENT="xxx.xxx.xxx/x.x.x"
> ```


## Testing

Testing is a crucial part of the development process for the SDG TI app, ensuring that each part of the app functions as expected and improves overall code quality. Flutter provides a rich set of testing features that allow for unit, widget, and integration tests.

### Running Tests

To run all the tests in the SDG TI app, you can use the following command:

```bash
flutter test
```

