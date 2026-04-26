# ASUS ROG Keyboard RGB Control (asus-rgb-control)

A lightweight suite of tools and a graphical setup utility to control the RGB keyboard lighting on ASUS ROG laptops (specifically built and tested for the ROG Scar III / G531 series) on Linux.

This package wraps the excellent [`rogauracore`](https://github.com/wroberts/rogauracore) utility, providing user-friendly interactive CLI menus, custom GNOME keybinding setups, and automated `udev` permissions.

## Features
* **ASUS RGB Setup (GUI):** A Python GTK tool to automatically bind your `Fn` + Aura keys (or any custom keys) to cycle your RGB effects seamlessly within GNOME.
* **ASUS RGB Control (CLI):** An interactive terminal menu using `whiptail` to manually set static colors, brightness, or breathing/rainbow effects without needing to remember hex codes.
* **ASUS RGB Cycle (Background):** A tiny background script that cycles through popular RGB presets when triggered.
* **Zero Sudo Required:** Automatically installs the required `udev` rules so your user account can communicate with the keyboard controller without needing root privileges.

## Dependencies
* `rogauracore` (Automatically downloaded and built if you install via `.deb`)
* `whiptail` (for the CLI menu)
* `python3-gi`, `gir1.2-gtk-3.0` (for the setup GUI)
* **Build Dependencies:** `make`, `gcc`, `autoconf`, `libusb-1.0-0-dev`, `git`, `debhelper`

## Installation

### Method 1: Building the Debian Package (Recommended for Ubuntu/Debian)
This is the recommended method. It automatically handles dependencies and compiles `rogauracore` for you.

1. Ensure you have the Debian build tools installed:
   ```bash
   sudo apt update
   sudo apt install debhelper
   ```
2. Build the package using the provided build script:
   ```bash
   ./build.sh
   ```
3. Install the generated `.deb` file (located in the new `dist/` directory):
   ```bash
   sudo apt install ./dist/asus-rgb-control_1.0.0-1_all.deb
   ```

### Method 2: Manual Source Installation (For Arch, Fedora, etc.)
If you are not on a Debian-based system, you can install the scripts manually using the provided Makefile. *Note: You must install `rogauracore` manually first.*

```bash
sudo make install
```

## Usage

### 1. Automated Keybinding (GUI)
Open your desktop application menu and launch **ASUS RGB Setup**. 
Click the main button and press your Aura Key (e.g., `Fn+Right`). The utility will automatically map that key to the RGB cycle script in your GNOME desktop settings.

### 2. Interactive Terminal Control
Run the following command from your terminal to open the RGB menu:
```bash
asus-rgb-control
```

## Uninstallation
If installed via the Debian package:
```bash
sudo apt remove asus-rgb-control
```
*(This safely reloads your udev rules and removes the tools. Note: Custom GNOME shortcuts you bound must be removed manually from `Settings -> Keyboard -> Custom Shortcuts`)*

If installed via Make:
```bash
sudo make uninstall
```

## License
Provided as-is by the community. Underlying keyboard communication handled by `rogauracore` (c) 2019 Will Roberts.
