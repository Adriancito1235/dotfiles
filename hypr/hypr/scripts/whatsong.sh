#!/bin/zsh

get_song_info() {
    local player_status=$(playerctl status 2>/dev/null)
    local artist=$(playerctl metadata artist 2>/dev/null)
    local title=$(playerctl metadata title 2>/dev/null)

    if [ "$player_status" = "Playing" ]; then
        echo "  $artist - $title"
    elif [ "$player_status" = "Paused" ]; then
        echo "  $artist - $title"
    else
        echo ""
    fi
}

song_info=$(get_song_info)

if [ -n "$song_info" ]; then
    echo "$song_info"
else
    echo "No music playing"
fi
