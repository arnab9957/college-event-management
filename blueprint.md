
# Project Blueprint

## Overview

This document outlines the structure and implementation details of the Flutter application.

## Implemented Features

### Authentication

*   **Firebase Authentication:** The application uses Firebase for user authentication, supporting email and password sign-in and sign-up.
*   **Authentication Service:** An `AuthenticationService` class encapsulates all Firebase authentication logic, including sign-in, sign-up, sign-out, and tracking the user's authentication state.
*   **UI:** The authentication UI consists of an `AuthPage` that displays an `AuthCard` for users to enter their credentials.

## Current Plan

### Address Login Error

*   **Issue:** The user has reported an error in the login flow. The `AuthCard` widget is not width-constrained, which can cause UI overflow errors.
*   **Fix:** I will wrap the `AuthCard` widget in a `SizedBox` to constrain its width and prevent overflow.

### Fix Web Authentication Error

*   **Issue:** The web application is using an incorrect API key, causing a "Bad Request" error during sign-in.
*   **Fix:** I will update the `firebase_options.dart` file to use the correct Firebase web API key.

### Implement Navigation

*   **Issue:** The application is missing a global navigation system, preventing users from accessing different pages.
*   **Fix:** I will implement a `BottomNavigationBar` in the `HomePage` and create a `ScaffoldWithNestedNavigation` to manage the nested navigation for each tab.
