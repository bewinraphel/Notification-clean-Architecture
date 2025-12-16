 ![GroSnap App Screenshot](assets/png/feature_image.png)

# GroSnap App

A modern and intuitive **GroSnap App** built with **Flutter**, following **Clean Architecture** principles, using **Bloc** for state management. The app features a beautiful home screen and a dedicated notification screen to view all notifications. The UI is inspired by **Dart's modern design** with clean and minimal styling. The app fetches data from an API using **Dio** for efficient HTTP requests and includes comprehensive testing to ensure reliability and performance.

---

## Features

- Beautiful home screen
- Dedicated notification screen to view all notifications
- Data fetching from an API using Dio
- State management using Bloc
- Clean and minimal Dart-style UI
- Organized using Clean Architecture
- Comprehensive unit and widget testing

---

## Tech Stack

- Flutter
- flutter_bloc
- get_it
- dartz
- dio
- connectivity_plus
- intl
- mockito
- http_mock_adapter
- bloc_test

---

## API Integration

- **Dio**: Used for making HTTP requests to fetch data from the API. Dio provides a clean and efficient way to handle network requests with features like interceptors, timeouts, and error handling, ensuring robust communication with the backend.

---

## Testing

- **Unit Testing**: Utilizes `mockito` to mock dependencies and test business logic in isolation, ensuring core functionality works as expected.
- **Widget Testing**: Tests Flutter widgets to verify UI components render correctly and respond to user interactions.
- **Bloc Testing**: Uses `bloc_test` to test Bloc states and events, ensuring state management logic is robust.
- **Mocked API Testing**: Employs `http_mock_adapter` to simulate API responses, allowing for reliable testing of network-dependent features without hitting the actual API.

---

## Getting Started

### Prerequisites

- Flutter SDK installed [](https://flutter.dev/docs/get-started/install)
- Android Studio / VS Code or any IDE
- Emulator or physical device

---

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Azeemmtk/grosnap.git
   cd grosnap