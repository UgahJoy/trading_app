# Flutter Trading Application

This project is a Flutter application designed for trading, currently configured for multi-platform development.
## 🎬 App Demo

Click the link below to see a live demonstration of the application's UI and features:

[Demo Video on Google Drive](https://drive.google.com/file/d/1VQg17lW_KFjlSMZV1AiuQEEvAAFel35A/view?usp=share_link)

---
## 🚀 Status: Environment Check

This project environment is ready for development across Android, iOS, web, and desktop. The Flutter doctor output shows no issues.

| Component | Status | Details | 
| :--- | :--- | :--- | 
| **Flutter SDK** | Stable (v3.35.5) | Running on macOS 26.0 (darwin-arm64) | 
| **Android Toolchain** | Ready | Android SDK version 36.1.0 | 
| **iOS/macOS Toolchain** | Ready | Xcode 26.0 |  
| **IDE** | Ready | Android Studio (2025.1), VS Code (1.104.2) | 
| **Devices** | 5 Available | Ready for testing | 
| **Issues** | **None** | All dependencies and setup complete. | 

### ⚠️ Critical Note on API Access

Due to local restrictions (specifically in **Nigeria**) that block direct access to Binance and other crypto APIs, you **MUST** use a **VPN (Virtual Private Network)** set to an unrestricted region (e.g., US or Europe) to successfully call the data services in `lib/services/`.


## ⚙️ Development Setup

To get a local copy up and running, follow these steps.

### Prerequisites

You must have the following installed:

* Flutter SDK (v3.35.5 or higher)
* Xcode (v26.0 or higher)
* Android Studio (2025.1 or higher)

### Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/UgahJoy/trading_app.git
    cd trading-app
    ```

2.  **Install dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Run the application:**
    Ensure one of the 5 connected devices or simulators is selected.

    ```bash
    flutter run
    ```

## 💻 Recommended Tools

* **IDE:** VS Code is the primary development environment.
* **Extensions:** Ensure you have the official Dart and Flutter extensions installed in VS Code.

## 📦 Project Structure Overview

* `lib/`: Main application source code.
* `lib/services/`: External API calls (e.g., VPN service, data fetching).
* `lib/shared_widgets/`: Reusable UI components (like `AppChartItem`).
* `lib/theme/`: Custom color palette and theme definitions.
* `assets/`: Project assets (images).