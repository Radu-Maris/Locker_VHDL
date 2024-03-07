# Locker Security System

## Overview
This VHDL project implements a locker security system allowing users to secure a locker with a 3-character code. It utilizes a 7-segment display (SSD) for output and features a "FREE/OCCUPIED" LED to indicate the locker status.

## Team
- [AlinTcaci](https://github.com/AlinTcaci)
- [Radu-Maris](https://github.com/Radu-Maris)

## Functional Requirements
- A "FREE/OCCUPIED" LED indicates locker availability.
- A "SELECT" button starts the code entry process.
- Users input 3 characters using a "BUTTON" and an "UP/DOWN" switch.
- Characters range from 0-1 and A-F.
- The current character is displayed on the SSD.
- Pressing "SELECT" moves to the next character.
- The system locks upon entering the third character, indicated by the LED.
- A "RST" button resets the display during input without clearing the stored code.
- To unlock, the process repeats and the code is verified.

## Components
- **Debouncer:** Ensures accurate button press detection.
- **Frequency Divider:** Reduces the clock frequency for the system.
- **Counter:** A reversible hexadecimal counter for character selection.
- **SSD:** Converts input signals for display.
- **Encoder:** Stores the input code and verifies it upon re-entry.

## Implementation and Results
The project employs a debouncer for button inputs, a frequency divider to manage clock signals, and a counter for character selection. The SSD displays input characters, and the encoder module stores and verifies the entered code.

## Development Possibilities
Future enhancements could include the selection of multiple lockers using additional displays and buttons to navigate between locker choices.
