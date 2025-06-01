# 🎨 Quickshell Pywal Integration

Your Quickshell configuration now automatically syncs with **pywal16** colors! This means your shell interface will dynamically match your wallpaper colors.

## 🚀 Features

- **🔄 Automatic Color Sync**: Colors update automatically when you change your wallpaper with pywal
- **📁 File Watching**: The system monitors `~/.cache/wal/colors.json` for changes
- **🎯 Smart Mapping**: Intelligently maps pywal's 16-color palette to Quickshell's UI elements
- **💾 Fallback Support**: Uses sensible defaults if pywal colors aren't available
- **🔧 Manual Refresh**: Helper script for easy color management

## 🛠️ How It Works

The color system reads from pywal's JSON output and maps the colors as follows:

| UI Element | Pywal Color | Description |
|------------|-------------|-------------|
| **Primary** | color4 | Main accent color for interactive elements |
| **Secondary** | color2 | Secondary accent for buttons and highlights |
| **Tertiary** | color6 | Subtle accent for variety |
| **Background** | special.background | Main dark background |
| **Text** | special.foreground | Primary text color |
| **Surfaces** | Generated from background | Container backgrounds with variations |

## 📖 Usage

### Basic Commands

```bash
# Show current colors and status
./refresh_colors.sh -s

# Set new wallpaper and generate colors
./refresh_colors.sh -w ~/Pictures/my-wallpaper.jpg

# Refresh colors from current wallpaper
./refresh_colors.sh -r

# Show help
./refresh_colors.sh -h
```

### Manual pywal Commands

```bash
# Generate colors from wallpaper
wal -i ~/Pictures/wallpaper.jpg

# Generate colors with specific backend
wal -i ~/Pictures/wallpaper.jpg --backend colorz

# Preview colors without setting wallpaper
wal -i ~/Pictures/wallpaper.jpg --preview
```

## 🎨 Color Scheme Examples

Your current pywal colors:
- **Background**: `#0e0e0d` (Very dark)
- **Foreground**: `#c2c2c2` (Light gray)
- **Primary**: `#238a93` (Teal blue)
- **Secondary**: `#22838a` (Darker teal)
- **Tertiary**: `#429497` (Light teal)

## 🔧 Customization

### Modifying Color Mapping

Edit `Data/Colors.qml` to change how pywal colors map to UI elements:

```qml
// Example: Use color5 instead of color4 for primary
readonly property color primary: pywalLoaded ? pywalColors.colors?.color5 || "#249399" : "#b6c4ff"
```

### Manual Color Refresh

```qml
// Call this from QML to manually refresh colors
Dat.Colors.refreshPywalColors()
```

## 🐛 Troubleshooting

### Colors Not Loading
1. Check if pywal is installed: `which wal`
2. Verify colors.json exists: `ls ~/.cache/wal/colors.json`
3. Check Quickshell console for errors
4. Try manual refresh: `./refresh_colors.sh -r`

### Colors Don't Look Right
- Try different pywal backends: `wal -i wallpaper.jpg --backend colorz`
- Adjust brightness: `wal -i wallpaper.jpg -l` (light mode)
- Modify color mapping in `Data/Colors.qml`

### File Watching Issues
- Restart Quickshell: `pkill quickshell && quickshell &`
- Check file permissions: `ls -la ~/.cache/wal/colors.json`

## 🌈 Tips & Tricks

1. **Different Backends**: Try various pywal backends for different color extraction:
   ```bash
   wal -i wallpaper.jpg --backend colorz    # More vibrant
   wal -i wallpaper.jpg --backend wal       # Default
   wal -i wallpaper.jpg --backend schemer2  # More muted
   ```

2. **Color Templates**: Save favorite color schemes:
   ```bash
   # Save current scheme
   cp ~/.cache/wal/colors.json ~/.config/wal/colorschemes/my-favorite.json
   
   # Load saved scheme
   wal --theme my-favorite
   ```

3. **Auto-apply on Login**: Add to your window manager's autostart:
   ```bash
   wal -R  # Restore last color scheme
   ```

## 📝 File Structure

```
~/.config/quickshell/
├── Data/
│   └── Colors.qml          # Main color configuration with pywal integration
├── refresh_colors.sh       # Helper script for color management
└── PYWAL_README.md        # This documentation

~/.cache/wal/
├── colors.json            # Pywal color data (auto-watched)
├── colors                 # Plain text colors
└── wal                    # Current wallpaper path
```

## 🚀 Advanced Usage

### Integration with Other Tools

Synchronize other applications with your pywal colors:

```bash
# Update terminal colors
cat ~/.cache/wal/sequences

# Apply to Alacritty
ln -sf ~/.cache/wal/colors-alacritty.toml ~/.config/alacritty/colors.toml

# Apply to Kitty
ln -sf ~/.cache/wal/colors-kitty.conf ~/.config/kitty/colors.conf
```

### Automatic Wallpaper Changes

Set up automatic wallpaper rotation with color sync:

```bash
# Add to crontab for hourly wallpaper changes
0 * * * * /home/aarsh/.config/quickshell/refresh_colors.sh -w "$(find ~/Pictures/wallpapers -name "*.jpg" | shuf -n 1)"
```

---

**Enjoy your dynamically colored Quickshell! 🎉** 