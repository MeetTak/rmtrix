## Micronaut 4.9.1 Documentation

- [User Guide](https://docs.micronaut.io/4.9.1/guide/index.html)
- [API Reference](https://docs.micronaut.io/4.9.1/api/index.html)
- [Configuration Reference](https://docs.micronaut.io/4.9.1/guide/configurationreference.html)
- [Micronaut Guides](https://guides.micronaut.io/index.html)
---

- [Shadow Gradle Plugin](https://gradleup.com/shadow/)
- [Micronaut Gradle Plugin documentation](https://micronaut-projects.github.io/micronaut-gradle-plugin/latest/)
- [GraalVM Gradle Plugin documentation](https://graalvm.github.io/native-build-tools/latest/gradle-plugin.html)
## Feature http-client documentation

- [Micronaut HTTP Client documentation](https://docs.micronaut.io/latest/guide/index.html#nettyHttpClient)


## Feature serialization-jackson documentation

- [Micronaut Serialization Jackson Core documentation](https://micronaut-projects.github.io/micronaut-serialization/latest/guide/)

# rmtrix

A CLI tool built with Micronaut and Picocli for efficient system maintenance and automation, leveraging GraalVM native image for optimal performance.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Building the Project](#building-the-project)
- [Running the Application](#running-the-application)
- [Native Image Compilation](#native-image-compilation)
- [Making the CLI Globally Available](#making-the-cli-globally-available)
- [References](#references)

---

## Prerequisites

- **Java 17 (GraalVM 17) installed via SDKMAN**
  ```bash
  sdk install java 17.0.12-graal
  sdk use java 17.0.12-graal
  ```
- **Native Image tool installed:**
  ```bash
  gu install native-image
  ```
  To verify installation:
  ```bash
  gu list
  ```
  You should see output resembling:
  ```
  ComponentId              Version             Component name                Stability     Origin
  -----------------------------------------------------------------------------------------------
  graalvm                  23.0.5              GraalVM Core                  Supported
  native-image             23.0.5              Native Image                  Early adopter
  ```

> **Note:** Native Image is supported only by OpenJDKs (JDK 8 to JDK 17).

---

## Setup

Clone this repository and navigate to its root directory.

---

## Building the Project

### Clean and Build

Use the Gradle Wrapper to clean and build the project:
```bash
./gradlew clean build
```

### Enable Gradle Daemon

Using the Gradle Daemon will speed up builds (similar to JVM for Java).  
Refer to the [Gradle Daemon Documentation](https://docs.gradle.org/current/userguide/gradle_daemon.html) for setup and details.

### Assemble with Daemon

To build the project with the Gradle Daemon:
```bash
./gradlew --daemon assemble
```

---

## Running the Application

After building, you can run the CLI application using:
```bash
java -jar build/libs/rmtrix-0.1-all.jar Search -s ollama
```
Use `Ctrl+C` to terminate the current operation.

---

## Native Image Compilation

Build a native executable using the following command:
```bash
native-image -cp build/libs/rmtrix-0.1-all.jar --initialize-at-run-time=ch.qos.logback,org.slf4j,io.netty --no-fallback com.github.meettak.RmtrixCommand rmtrix
```

### Locate the Native Executable

To find where the binary was created:
```bash
find . -name rmtrix -type f -executable
```
Typically, it may be found in:
```bash
build/native/nativeCompile/rmtrix -s ollama
```

---

## Making the CLI Globally Available

1. Ensure the file is executable:
    ```bash
    chmod +x rmtrix
    ```
2. Move the executable to a directory in your `PATH`:
    ```bash
    sudo mv rmtrix /usr/local/bin/
    ```
3. Now you can run the CLI from anywhere:
    ```bash
    rmtrix Search -s <filename>
    ```

---

## References

- [Gradle Daemon Documentation](https://docs.gradle.org/current/userguide/gradle_daemon.html)
- [GraalVM Native Image](https://www.graalvm.org/reference-manual/native-image/)
- [Micronaut Framework](https://micronaut.io/)
- [Picocli CLI Framework](https://picocli.info/)

---

## Acknowledgements

Special thanks to the [stackoverflow-cli](https://github.com/wololock/stackoverflow-cli) project, which inspired and supported aspects of this CLI's development.

---
