# Dotfiles

This repository contains my personal dotfiles for various applications.

## Setup

> [!NOTE]
>
> - You might need to adjust some parts for your particular system, make sure to back up your configs first.
> - This setup requires [Pywal16](https://github.com/dylanaraps/pywal) (for the colorschemes) to work properly.

1. **Clone the repository:**

   ```bash
   git clone <repository-url> ~/dots
   ```

2. **Create symbolic links:** For each application, create a symbolic link from the configuration file in this repository to the corresponding location in your home directory. For example, to set up the `kitty` configuration:

   ```bash
   ln -s ~/.dotfiles/kitty ~/.config/kitty
   ```

   Repeat this for all desired configurations. Refer to the directory structure in this repository to find the configuration files for each application.

3. **Install pywal16:** This setup uses `pywal16` to manage color schemes. Install it by following the instructions in the [pywal16 repository](https://github.com/dylanaraps/pywal). Note: The original `HYPRSTELLAR` setup uses a fork: [eylles/pywal16](https://github.com/eylles/pywal16).

4. **Apply a color scheme:** After installing `pywal16`, you can apply a color scheme by running:

   ```bash
   wal -i /path/to/your/wallpaper.jpg
   ```

   This will generate and apply a color scheme based on the selected wallpaper. The color schemes will be automatically applied to supported applications.

## Software Used

This repository includes configurations for the following applications:

### Base

| Type              | Name                                             |
| ----------------- | ------------------------------------------------ |
| Window Compositor | [Hyprland](https://hyprland.org/)                |
| Shell             | zsh                                              |
| ZSH Prompt        | [Starship](https://github.com/starship/starship) |
| Terminal          | [Kitty](https://github.com/kovidgoyal/kitty)     |
| Bar               | QuickShell                                       |

### Utilities

| Type                              | Name                                                                             |
| --------------------------------- | -------------------------------------------------------------------------------- |
| Text Editor                       | [Neovim](https://neovim.io/)                                                     |
| Better ls                         | [Lsd](https://github.com/lsd-rs/lsd)                                             |
| Apps Launcher                     | [Rofi](https://github.com/davatorium/rofi)                                       |
| Notification Daemon               | [Sway Notification Center](https://github.com/ErikReider/SwayNotificationCenter) |
| Dotfile specific color management | [Wal](https://github.com/dylanaraps/pywal)                                       |
| Editor                            | Zed                                                                              |
| Multiplexer                       | Tmux                                                                             |

## Hotkeys

For a detailed list of hotkeys, please refer to the `hypr/configs/binds.conf` file in this repository.

## Contributing

Feel free to fork this repository and customize it to your own needs. If you have any suggestions or improvements, please open an issue or submit a pull request.

