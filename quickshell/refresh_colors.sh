#!/bin/bash

# Quickshell Pywal Color Refresh Script
# This script regenerates pywal colors and refreshes your Quickshell theme

echo "🎨 Quickshell Pywal Color Manager"
echo "=================================="

# Check if pywal is installed
if ! command -v wal &> /dev/null; then
    echo "❌ Error: pywal is not installed"
    echo "Install with: pip install pywal"
    exit 1
fi

# Function to refresh with current wallpaper
refresh_current() {
    echo "🔄 Refreshing colors from current wallpaper..."
    if [ -f ~/.cache/wal/wal ]; then
        current_wallpaper=$(cat ~/.cache/wal/wal)
        wal -i "$current_wallpaper" -n
        echo "✅ Colors refreshed from: $current_wallpaper"
    else
        echo "❌ No current wallpaper found in pywal cache"
        return 1
    fi
}

# Function to set new wallpaper and generate colors
set_wallpaper() {
    if [ -z "$1" ]; then
        echo "❌ Error: Please provide a wallpaper path"
        echo "Usage: $0 -w /path/to/wallpaper.jpg"
        return 1
    fi
    
    if [ ! -f "$1" ]; then
        echo "❌ Error: Wallpaper file not found: $1"
        return 1
    fi
    
    echo "🖼️  Setting wallpaper and generating colors..."
    wal -i "$1" -n
    echo "✅ Colors generated from: $1"
}

# Function to show current colors
show_colors() {
    echo "🎨 Current pywal colors:"
    echo "======================="
    if [ -f ~/.cache/wal/colors.json ]; then
        echo "📁 Source: $(jq -r '.wallpaper' ~/.cache/wal/colors.json 2>/dev/null || echo 'Unknown')"
        echo "🎯 Background: $(jq -r '.special.background' ~/.cache/wal/colors.json 2>/dev/null || echo 'N/A')"
        echo "📝 Foreground: $(jq -r '.special.foreground' ~/.cache/wal/colors.json 2>/dev/null || echo 'N/A')"
        echo ""
        echo "🌈 Color palette:"
        for i in {0..15}; do
            color=$(jq -r ".colors.color$i" ~/.cache/wal/colors.json 2>/dev/null)
            printf "color%-2d: %s\n" $i "$color"
        done
    else
        echo "❌ No pywal colors found. Run 'wal -i /path/to/wallpaper' first."
    fi
}

# Function to reload Quickshell
reload_quickshell() {
    echo "🔄 Reloading Quickshell..."
    pkill quickshell 2>/dev/null
    sleep 1
    quickshell &
    echo "✅ Quickshell reloaded with new colors"
}

# Parse command line arguments
case "$1" in
    -w|--wallpaper)
        set_wallpaper "$2"
        reload_quickshell
        ;;
    -r|--refresh)
        refresh_current
        reload_quickshell
        ;;
    -s|--show)
        show_colors
        ;;
    -h|--help)
        echo "Usage: $0 [options]"
        echo ""
        echo "Options:"
        echo "  -w, --wallpaper <path>   Set wallpaper and generate colors"
        echo "  -r, --refresh            Refresh colors from current wallpaper" 
        echo "  -s, --show               Show current colors"
        echo "  -h, --help               Show this help message"
        echo ""
        echo "Examples:"
        echo "  $0 -w ~/Pictures/wallpaper.jpg"
        echo "  $0 -r"
        echo "  $0 -s"
        ;;
    *)
        echo "📖 Usage: $0 [options]"
        echo "Run '$0 -h' for help"
        show_colors
        ;;
esac 