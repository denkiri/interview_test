# interview_test

Mobile Test.

## How to run the app on Android Studio
# Step 1: Clone the GitHub Repository

1. **Open Android Studio**.
2. **Clone the GitHub Repository**:
   - Click on **File > New > Project from Version Control**.
   - Select **Git** from the dropdown menu.
   - In the **URL** field, enter the GitHub repository URL (https://github.com/denkiri/interview_test).
   - Choose a **Directory** where you want to save the project on your local machine.
   - Click **Clone** to download the project files to your local machine.

# Step 2: Open the Cloned Project

1. **Open the Cloned Project**:
   - After cloning, Android Studio will automatically prompt you to open the newly cloned project. Click **Yes**.
   - Alternatively, you can go to **File > Open** and navigate to the folder where the repository was cloned. Select the project and click **OK** to open it.

# Step 3: Install Flutter and Dart Plugins

If you haven't already installed the Flutter and Dart plugins in Android Studio:

1. Go to **File > Settings** (on macOS, **Android Studio > Preferences**).
2. Select **Plugins** from the sidebar.
3. Search for **Flutter** and click **Install**.
4. The Dart plugin will automatically be installed with Flutter.
5. Restart Android Studio to apply the changes.

# Step 4: Configure Flutter SDK Path

Ensure that Android Studio is configured to use the correct Flutter SDK:

1. Go to **File > Settings** (on macOS, **Android Studio > Preferences**).
2. Select **Languages & Frameworks > Flutter**.
3. Check that the **Flutter SDK path** is correctly set to the directory where Flutter is installed on your computer.
4. Click **Apply** and **OK** if you need to update the path.

# Step 5: Install Dependencies

1. **Open the Terminal** inside Android Studio (you can find it at the bottom toolbar or use **View > Tool Windows > Terminal**).
2. Run the following command to get all dependencies:

   ```bash
   flutter pub get
# Step 6: Set Up an Android Emulator or Connect a Physical Device

To run your Flutter project on Android Studio, you need to use an emulator or a physical device.

### Option A: Using an Emulator

1. **Open the Device Manager**:
   - Go to **Tools > Device Manager**.

2. **Create a New Virtual Device** (if none exists):
   - Click **Create device**, select a device model, click **Next**, choose a system image, and then click **Finish**.

3. **Start the Emulator**:
   - Click the **Play** button next to your virtual device to launch the emulator.

### Option B: Using a Physical Device

1. **Connect Your Android Device** to your computer via USB.

2. **Enable USB Debugging** on the device:
   - Go to **Settings > About Phone** and tap **Build Number** seven times to enable **Developer Options**.
   - Go back to **Settings > Developer Options** and enable **USB Debugging**.

3. **Authorize Your Computer** to access your device if prompted.

## Step 7: Run the Flutter Project

1. **Select the Target Device**:
   - In the top toolbar of Android Studio, select your connected device or running emulator from the dropdown menu.

2. **Run the Project**:
   - Click the **Run** button (green triangle) in the toolbar, or press **Shift + F10**.

   Android Studio will build the project and install it on the selected device.
   
# App Screenshots For Android and ios
<img src="https://github.com/denkiri/interview_test/blob/master/Screenshot_20240829_195054.png" width="340" height="540">|<img src="https://github.com/denkiri/interview_test/blob/master/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-08-29%20at%2019.53.44.png" width="340" height="540">
