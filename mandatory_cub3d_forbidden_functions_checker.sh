#!/bin/bash
echo "Forbidden functions checker for mandatory cub3D"

if [ ! -f ./cub3D ]; then
    echo "cub3D executable not found. Compiling..."
    make
    if [ $? -ne 0 ]; then
        echo "Compilation failed. Exiting."
        exit 1
    fi
fi

allowed_funcs=(
    open close read write printf malloc free perror strerror exit gettimeofday
    acos asin atan atan2 cos cosh sin sinh tan tanh exp frexp ldexp log log10 modf pow sqrt ceil fabs floor fmod
    mlx_init mlx_new_window mlx_pixel_put mlx_loop mlx_key_hook mlx_mouse_hook mlx_expose_hook mlx_loop_hook mlx_string_put mlx_xpm_to_image mlx_xpm_file_to_image mlx_png_file_to_image mlx_put_image_to_window mlx_get_color_value mlx_clear_window mlx_destroy_window mlx_hook mlx_do_key_autorepeatoff mlx_do_key_autorepeaton mlx_do_sync mlx_get_screen_size mlx_mouse_hide mlx_mouse_show mlx_mouse_move mlx_mouse_get_pos mlx_mouse_get_pos mlx_mouse_move mlx_mouse_hide mlx_mouse_show mlx_get_data_addr mlx_new_image mlx_destroy_image mlx_get_data_addr mlx_put_image_to_window mlx_get_color_value mlx_clear_window mlx_destroy_window mlx_hook mlx_loop_hook mlx_key_hook mlx_mouse_hook mlx_expose_hook mlx_loop_hook mlx_string_put mlx_xpm_to_image mlx_xpm_file_to_image mlx_png_file_to_image mlx_put_image_to_window mlx_get_color_value mlx_clear_window mlx_destroy_window mlx_hook mlx_do_key_autorepeatoff mlx_do_key_autorepeaton mlx_do_sync mlx_get_screen_size mlx_mouse_hide mlx_mouse_show mlx_mouse_move mlx_mouse_get_pos mlx_mouse_get_pos mlx_mouse_move mlx_mouse_hide mlx_mouse_show mlx_destroy_display
)

forbidden_funcs=()

symbols=$(nm -u ./cub3D)

while read -r symbol; do
    symbol=$(echo "$symbol" | cut -c3- | sed 's/^ *//; s/@.*//')

    if [[ $symbol == _* ]]; then
        continue
    fi

    if [[ ! " ${allowed_funcs[@]} " =~ " ${symbol} " ]]; then
        forbidden_funcs+=("$symbol")
    fi
done <<< "$symbols"

if [ ${#forbidden_funcs[@]} -eq 0 ]; then
    echo "✅ OK: No forbidden functions found. ✅"
else
    echo "❌ Forbidden functions detected ❌:"
    for func in "${forbidden_funcs[@]}"; do
        echo "$func"
    done
fi
