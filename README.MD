A# Portable Apps Shortcut Creator

This PowerShell script is designed to create shortcuts to your portable applications inside a directory named "PortableApps" in the Start Menu. This makes it easier for Flow Launcher or other alternative launchers to index your portable apps. All shortcuts will be saved to 'PortableApps' directory in the start menu. Shortcut names will be formatted. Shortcuts overwrite, can run as needed.

## Usage

1. Run the script.
2. Enter the root path to search for portable apps when prompted (e.g., C:\Users\User\PortableApps).
3. The script will parse the specified directory for executable files ending with 'portable.exe'.
4. Shortcuts for the portable applications will be created in the "PortableApps" directory in the Start Menu.
5. Once the process is complete, the script will open the directory for you to access your portable apps easily.

## Features

- Shortcuts will be saved to 'PortableApps' directory in the start menu. 
- Shortcut names will be formatted. Script overwrites exisitng shortcuts, can run as needed.
- Automatically creates shortcuts for portable applications.
- Colorful console output for improved visibility.

## Author

Written by Whale Linguini

## Requirements

- Windows operating system
- PowerShell

## Installation

1. Clone or download the script file.
2. Run the script in PowerShell.

## License

This project is licensed under the [MIT License](LICENSE).

