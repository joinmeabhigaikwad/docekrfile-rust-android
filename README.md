**RUN COMMAND**  

docker run -it (your image name)

**DOCKERFILE VERIFICATION INSTRUCTIONS**

**AFTER COMPLETING THE BUILD, USE THESE COMMANDS TO CHECK IF RUST AND ANDROID HAVE BEEN INSTALLED SUCCESSFULLY:**

**1. ust Version: Run the following commands to verify the Rust version and related components:**

rustup --version
cargo --version
rustc --version

**2. Android SDK Manager: Execute the following command to check the Android SDK Manager version:**

sdkmanager --version

**3. Android Platform Tools: Use the following command to ensure that Android Platform Tools are installed and functioning properly:**

adb version

**4. Android Build Tools: Check the installed Android Build Tools by running:**

sdkmanager --list | grep build-tools

**5. Android Platforms: Verify installed Android platforms with:**

sdkmanager --list | grep platforms

**6. SDK Components: Ensure that necessary Android SDK components are installed by executing:**

sdkmanager --list

