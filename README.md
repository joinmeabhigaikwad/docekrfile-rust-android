**RUN COMMAND**  

docker run -it (your image name)

**DOCKERFILE VERIFICATION INSTRUCTIONS**

**After completing the build, use these commands to check if Rust and Android have been installed successfully:**

**Rust Version: Run the following commands to verify the Rust version and related components:**
rustup --version
cargo --version
rustc --version

**Android SDK Manager: Execute the following command to check the Android SDK Manager version:**
sdkmanager --version

**Android Platform Tools: Use the following command to ensure that Android Platform Tools are installed and functioning properly:**
adb version

**Android Build Tools: Check the installed Android Build Tools by running:**
sdkmanager --list | grep build-tools

**Android Platforms: Verify installed Android platforms with:**
sdkmanager --list | grep platforms

**SDK Components: Ensure that necessary Android SDK components are installed by executing:**
sdkmanager --list

