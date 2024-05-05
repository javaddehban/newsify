# Newsify

## Overview
Newsify is a Flutter application designed to provide a streamlined and intuitive experience for users interested in reading and discovering news articles. This document provides an overview of the architectural and design choices made in developing the application, ensuring clarity and utility for both users and contributors.

## Architectural and Design Choices
The project adheres to the principles of Clean Architecture to ensure separation of concerns, maintainability, and testability. This architecture promotes a clear distinction between business logic, presentation, and data layers, enhancing both scalability and robustness of the application.

### Clean Architecture Layers:
1. **Presentation Layer (UI)**:
    - Utilizes Flutter for building a cross-platform user interface.
    - Implements the BLoC (Business Logic Component) pattern for managing the application's state.
    - Hydrated BLoC is used for state persistence across app restarts.
    - Routing is handled using GoRouter for efficient navigation between screens.

2. **Domain Layer**:
    - Defines the business logic and use cases of the application.
    - Implements the application's core functionalities independently of any specific framework.

3. **Data Layer**:
    - Dio is used for making HTTP requests to fetch news articles from external APIs.
    - Cached Network Image is employed for efficient caching and loading of news article images.
    - Either Dart is utilized for handling asynchronous operations and error handling in a functional manner.

4. **Dependency Injection**:
    - Get_it is utilized for dependency injection to decouple the code and facilitate easier testing and maintenance.


### Clean Architecture Diagram
```
              +----------------------+
              |      Presentation     |
              | (UI/BLoC/View/Widget) |
              +-----------+----------+
                          |
                          v
              +-----------+----------+
              |        Domain         |
              | (Use Cases/Business   |
              |        Logic)         |
              +-----------+----------+
                          |
                          v
              +-----------+----------+
              |         Data          |
              | (Repositories/Network |
              |       Data Sources)   |
              +----------------------+
```

### Directory Structure
```
newsify/
├── lib/
│   ├── data/
│   │   ├── models/
│   │   ├── repositories/
│   │   └── datasources/
│   ├── domain/
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── use_cases/
│   ├── presentation/
│   │   ├── bloc/
│   │   ├── views/
│   │   └── widgets/
│   └── di/

```

## Features
- **User Interface**: Built with Flutter for a responsive, cross-platform experience.
- **State Management**: Uses the BLoC pattern to manage app state.
- **Networking**: Utilizes Dio for HTTP requests, with support for offline caching of news articles.
- **Error Handling**: Integrates Either Dart for functional error handling in asynchronous operations.

## Getting Started
To run Newsify locally:
1. Clone the repository:
   ```
   git clone https://github.com/javaddehban/newsify.git
   ```
2. Navigate to the project directory:
   ```
   cd newsify
   ```
3. Install dependencies:
   ```
   flutter pub get
   ```
4. Run the application:
   ```
   flutter run
   ```

## Running Tests in Newsify
Newsify includes comprehensive tests to ensure the application functions correctly and meets quality standards. These tests are divided into unit tests, widget tests, and integration tests. Below is the guide on how to execute each type of test.


Run the application:
   ```
flutter test test/widget_test
   ```

## CORS Issue Solutions
When using NewsAPI's free plan, you might face CORS issues. Possible solutions include:

Proxy Server: Setup a proxy server to forward requests.
Serverless Functions: Use Vercel or similar to manage requests.
CORS Proxy Services: Use services like crossorigin.me to bypass CORS.
Paid Plan: Upgrade to a paid plan to avoid CORS restrictions.


## Contributing
Contributions are welcome! Feel free to fork the project, make changes, and submit a pull request. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

