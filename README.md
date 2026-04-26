# ASUS ROG Keyboard RGB Control (asus-rgb-control)

A lightweight suite of tools and a graphical setup utility to control the RGB keyboard lighting on ASUS ROG laptops (specifically built and tested for the ROG Scar III / G531 series) on Linux.

This package wraps the excellent [`rogauracore`](https://github.com/wroberts/rogauracore) utility, providing user-friendly interactive CLI menus, custom GNOME keybinding setups, and automated `udev` permissions.

## Features
* **ASUS Aura Control (GUI):** A modern Python GTK application to directly control lighting effects, colors, and brightness. It also includes an automated setup for mapping `Fn` + Aura keys to cycle effects.
* **ASUS RGB Control (CLI):** An interactive terminal menu using `whiptail` for quick adjustments without a desktop environment.
* **ASUS RGB Cycle (Background):** A background script that cycles through presets, used by the GUI and custom keybindings.
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
   sudo apt install ./dist/*.deb
   ```

### Method 2: Manual Source Installation (For Arch, Fedora, etc.)
If you are not on a Debian-based system, you can install the scripts manually using the provided Makefile. *Note: You must install `rogauracore` manually first.*

```bash
sudo make install
```

## Usage

### 1. ASUS Aura Control (GUI)
Open your desktop application menu and launch **ASUS Aura Control**. 
From here you can:
*   **Switch Effects:** Choose between Static, Breathing, Colorcycle, and Rainbow modes.
*   **Pick Colors:** Use the color picker to set your preferred primary and secondary colors.
*   **Adjust Parameters:** Tweak brightness and effect speed on the fly.
*   **Bind Keys:** Use the "Shortcuts" tab to map keys (like `Fn+Right`) to cycle effects.

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

## Development

### Conventional Commits
This project follows the [Conventional Commits](https://www.conventionalcommits.org/) specification for commit messages. This allows for automated version bumping and changelog generation.

Common types:
- `feat`: A new feature (corresponds to a MINOR version bump)
- `fix`: A bug fix (corresponds to a PATCH version bump)
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to the build process or auxiliary tools and libraries

### Automated Versioning
The project uses `semantic-release` via GitHub Actions to automatically:
1. Analyze commits since the last release.
2. Bump the version in `debian/changelog` and `package.json`.
3. Create a new GitHub Release and Git tag.

To trigger a release, simply merge your PR into the `main` branch.
