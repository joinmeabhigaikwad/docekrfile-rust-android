**RUN COMMAND**  

docker run -it (your image name)

**DOCKERFILE VERIFICATION INSTRUCTIONS**

**After completing the build, use these commands to check if Rust and Android have been installed successfully:**

**1. Alpine Linux Version Check**

  cat /etc/*release | grep PRETTY_NAME

**2. Android SDK Installation Check**

  cmdline-tools/latest/bin/sdkmanager --version

**3. Rust Installation Check**

rustup --version
cargo --version
rustc --version

**4. Android Build Tools Listing**

cmdline-tools/latest/bin/sdkmanager --list | grep build-tools

**5. Android Platforms Listing**

cmdline-tools/latest/bin/sdkmanager --list | grep platforms
