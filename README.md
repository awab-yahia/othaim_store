# othaim_store
Othaim Store - Flutter E-commerce App , simple e-commerce mobile application built with Flutter.


<!-- project architucure  -->
lib/
├── core/
├── features/
│   ├── product/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── product_local_data_source.dart
│   │   │   │   └── product_remote_data_source.dart
│   │   │   ├── models/
│   │   │   │   └── product_model.dart
│   │   │   └── repositories/
│   │   │       └── product_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── product.dart
│   │   │   ├── repositories/
│   │   │   │   └── product_repository.dart
│   │   │   ├── usecases/
│   │   │   │   ├── get_products.dart
│   │   │   │   └── add_product.dart
│   │   ├── presentation/
│   │   │   ├── controllers/
│   │   │   │   └── product_controller.dart
│   │   │   ├── screens/
│   │   │   │   └── product_list_screen.dart
│   │   │   └── widgets/
│   │   │       └── product_item.dart
│   ├── cart/
│   │   ├── data/
│   │   │   └── models/
│   │   │       └── cart_item_model.dart
│   │   ├── domain/
│   │   │   └── entities/
│   │   │       └── cart_item.dart
│   │   │   ├── usecases/
│   │   │   │   ├── get_cart_items.dart
│   │   │   │   └── add_to_cart.dart
│   │   ├── presentation/
│   │   │   ├── controllers/
│   │   │   │   └── cart_controller.dart
│   │   │   ├── screens/
│   │   │   │   └── cart_screen.dart
│   │   │   └── widgets/
│   │   │       └── cart_item.dart
│   ├── order/
│   │   ├── domain/
│   │   │   ├── usecases/
│   │   │   │   └── place_order.dart
│   │   ├── presentation/
│   │   │   └── screens/
│   │   │       └── order_screen.dart
├── app.dart
├── main.dart





<!-- Application Testing  -->

This Application the test will be Unit Testing focus on testing the product fetching, cart state management, and order confirmation functionalities.


Got it! Here's a revised structure for your `test` folder, excluding the `core` folder:

# Simplified Test Folder Structure for Unit Tests
```
test/
├── features/
│   ├── product/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── product_local_data_source_test.dart
│   │   │   │   └── product_remote_data_source_test.dart
│   │   │   ├── models/
│   │   │   │   └── product_model_test.dart
│   │   │   └── repositories/
│   │   │       └── product_repository_impl_test.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── product_test.dart
│   │   │   └── repositories/
│   │   │       └── product_repository_test.dart
│   │   ├── presentation/
│   │   │   ├── controllers/
│   │   │   │   └── product_controller_test.dart
│   ├── cart/
│   │   ├── data/
│   │   │   └── models/
│   │   │       └── cart_item_model_test.dart
│   │   ├── domain/
│   │   │   └── entities/
│   │   │       └── cart_item_test.dart
│   │   ├── presentation/
│   │   │   ├── controllers/
│   │   │   │   └── cart_controller_test.dart
│   ├── order/
│   │   ├── presentation/
│   │   │   └── controllers/
│   │   │       └── order_controller_test.dart
└── test_helpers/
    └── mock_data.dart
```



<!-- package documentation -->


# State Management
**Get** (^4.6.6)
- **Description**: A powerful state management solution for Flutter that also offers dependency injection and route management.
- **Alternatives**: Provider, Riverpod, Bloc.
- **Reason for Choice**: GetX is chosen for its simplicity, performance, and the fact that it combines state management, dependency injection, and routing in one package.

# Connectivity
**internet_connection_checker** (^1.0.0+1)
- **Description**: Checks for an internet connection by opening a socket to a list of addresses.
- **Alternatives**: connectivity_plus.
- **Reason for Choice**: Provides a simple and reliable way to check for internet connectivity with minimal setup.

**connectivity_plus** (^6.0.5)
- **Description**: A Flutter plugin for discovering the state of the network (WiFi & mobile/cellular) connectivity on Android and iOS.
- **Alternatives**: internet_connection_checker.
- **Reason for Choice**: Offers more detailed network information and is actively maintained.

# Data Handling
**equatable** (^2.0.5)
- **Description**: Simplifies equality comparisons between objects by overriding `==` and `hashCode`.
- **Alternatives**: Built-in Dart `==` and `hashCode` methods.
- **Reason for Choice**: Reduces boilerplate code and makes equality checks more readable and maintainable.

**sqflite** (^2.4.0)
- **Description**: SQLite plugin for Flutter to handle local database operations.
- **Alternatives**: Moor (Drift), Hive.
- **Reason for Choice**: SQLite is a well-known, reliable database engine, and sqflite is a mature package with extensive community support.

**path** (^1.9.0)
- **Description**: Provides common operations for manipulating paths, such as joining, splitting, and normalizing.
- **Alternatives**: None (path is the standard package for path manipulation in Dart).
- **Reason for Choice**: Essential for file and directory path manipulations.

# Networking
**dio** (^5.7.0)
- **Description**: A powerful HTTP client for Dart, which supports interceptors, global configuration, FormData, request cancellation, file downloading, and timeout.
- **Alternatives**: http, Chopper.
- **Reason for Choice**: Dio offers more features and flexibility compared to the basic http package.

# Testing
**mockito** (^5.4.4)
- **Description**: A popular mocking framework for Dart, used in unit tests to create mock objects.
- **Alternatives**: mocktail.
- **Reason for Choice**: Mockito is widely used and has extensive documentation and community support.

**flutter_test**
- **Description**: Provides a testing framework for Flutter applications.
- **Alternatives**: None (flutter_test is the standard testing package for Flutter).
- **Reason for Choice**: Essential for writing and running tests in Flutter.

**test** (^1.16.0)
- **Description**: A testing framework for Dart.
- **Alternatives**: None (test is the standard testing package for Dart).
- **Reason for Choice**: Essential for writing and running tests in Dart.

# UI Components
**flutter_snake_navigationbar** (^0.6.1)
- **Description**: A customizable bottom navigation bar with a snake animation.
- **Alternatives**: BottomNavigationBar, ConvexBottomBar.
- **Reason for Choice**: Provides a unique and visually appealing navigation bar.

**like_button** (^2.0.5)
- **Description**: A Flutter package for creating a like button with animation effects.
- **Alternatives**: Custom implementation using AnimatedIcon.
- **Reason for Choice**: Simplifies the implementation of a like button with built-in animations.

**flutter_svg** (^2.0.10+1)
- **Description**: A Flutter package for rendering SVG (Scalable Vector Graphics) files.
- **Alternatives**: None (flutter_svg is the standard package for SVG rendering in Flutter).
- **Reason for Choice**: Essential for displaying SVG images in Flutter applications.

**lottie** (^3.1.2)
- **Description**: A Flutter package for rendering Lottie animations.
- **Alternatives**: Rive.
- **Reason for Choice**: Lottie animations are widely used and the package is well-supported.

**flutter_slidable** (^3.1.1)
- **Description**: A Flutter package for adding slide actions to list items.
- **Alternatives**: Custom implementation using GestureDetector.
- **Reason for Choice**: Simplifies the implementation of slide actions with built-in animations and customization options.

# Image Handling
**cached_network_image** (^3.4.1)
- **Description**: A Flutter library for loading and caching network images.
- **Alternatives**: NetworkImage, image.
- **Reason for Choice**: Provides efficient image caching and loading, reducing network usage and improving performance.

# Code Generation
**build_runner** (^2.4.13)
- **Description**: A package for generating code in Dart projects.
- **Alternatives**: None (build_runner is the standard package for code generation in Dart).
- **Reason for Choice**: Essential for code generation tasks, such as JSON serialization.
