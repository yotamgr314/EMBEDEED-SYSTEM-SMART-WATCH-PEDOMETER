# Wearable Smart Watch Firmware

## Overview
The application is designed to run on a low-power 16-bit PIC24FJ256GA705 microcontroller board, transforming it into a wearable smart watch. The watch provides real-time functionalities including a motion sensor-based real-time clock, pedometer, accelerometer-based step tracking, and interactive time and date setup. It also features real-time graph rendering for step tracking on an OLED interface. The implementation uses multithread programming and interrupt handling in C to achieve low-power and responsive performance.

## Features
- **Real-Time Clock & Date Display**  
  - Displays the current time (with a resolution of one second) and date on a high-contrast OLED screen.
  - Supports both 12-hour (with AM/PM) and 24-hour formats.
  
- **Pedometer and Accelerometer Functionality**  
  - Tracks steps and computes the walking rate (steps per minute) using an integrated accelerometer.
  - Provides an animated step icon that alternates between two images to simulate walking.

- **Step Rate Graph**  
  - Renders a real-time graph of step rate history for the last 90 seconds (1.5 minutes) with a resolution of one data point per second.

- **Menu and User Interaction**  
  - Features a menu-driven interface for switching displays and configuring settings.
  - Allows users to set the time and date via on-screen controls.
  - Navigation is accomplished using two buttons:
    - **S1**: Move selection up.
    - **S2**: Move selection down.
    - **S1 + S2 Together**: Execute the selected menu item.
  - The settings screens allow for incremental adjustments and visual feedback for time and date configuration.

## Hardware Requirements
- **Board**: PIC24FJ256GA705 (Microchip PIC24 series)
- **Display**: OLED screen
- **Sensors/Inputs**:
  - Accelerometer for step tracking and gesture detection (e.g., shake/flip for confirming settings)
  - Two user buttons (S1 and S2) for menu navigation and selection
  - Additional components such as analog potentiometer, user LEDs, and an RGB LED

## Software Requirements
- **MPLAB X IDE & XC16 Compiler**  
  The project is built using MPLAB X IDE with the XC16 compiler.
- **Pre-Implemented APIs**  
  The project leverages a set of pre-implemented API files (e.g., `colors.h`, `oledC_shapeHandler.h`) for managing the OLED display and graphics. These are included in the provided base library.

## Installation and Setup
1. **Install MPLAB X IDE and XC16 Compiler**  
   Download and install MPLAB X IDE along with the XC16 compiler from [Microchip's website](https://www.microchip.com/en-us/tools-resources/develop/mplab-x-ide).

2. **Import the Project**  
   Open MPLAB X IDE and import the complete project folder.

3. **Include Provided API Files**  
   Ensure that the pre-implemented API files (available in the `CuriosityOledBase.zip` folder) are correctly included in your project.

4. **Connect the Board**  
   Connect the PIC24FJ256GA705 board to your computer via USB.

5. **Build and Program**  
   Compile the project using MPLAB X IDE with the XC16 compiler, and program the board using the integrated programmer/debugger.

## Project Structure
```
├── src
│   ├── main.c             // Main entry point: initializes the system and starts the application
│   ├── system.c           // System initialization and configuration (clock, pins, etc.)
│   ├── app.c              // Application logic for timekeeping, pedometer, menu, and graph display
│   ├── Accel_i2c.c        // Accelerometer and I2C communication functions
│   └── [Other source files...]
├── include
│   ├── system.h           // System configuration header
│   ├── app.h              // Application definitions and global variables
│   ├── Accel_i2c.h        // Accelerometer I2C communication header
│   └── [Other header files...]
├── libraries
│   ├── oledDriver         // OLED driver and graphics API (includes colors.h, oledC_shapeHandler.h, etc.)
│   └── i2cDriver          // I2C driver source files
├── CuriosityOledBase.zip   // Pre-implemented API files provided as a base library
└── README.md              // This file
```

## Usage
- **Time/Date Display**  
  On power-up, the watch displays the current time and date. The time is updated every second, and the date is updated at midnight.

- **Pedometer Mode**  
  When motion is detected, the system displays an animated step icon along with the current walking rate (in steps per minute).

- **Graph Mode**  
  Switch to the step rate graph display to view the walking rate history over the last 90 seconds.

- **Menu Navigation and Settings**  
  - **S1 Button**: Moves the selection up in the menu.
  - **S2 Button**: Moves the selection down in the menu.
  - **S1 + S2 Together**: Executes the selected menu item.
  - **Time and Date Setup**: In the setup screens, users adjust values by incrementing or decrementing with S1 and S2. Confirm settings by performing a gesture (e.g., shaking or flipping the board for 2 seconds).
---
