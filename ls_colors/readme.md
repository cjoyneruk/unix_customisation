# LS colors

Customisation of the color output for the `ls` command. This is controlled by the `LS_COLORS` environment variable and can be viewed using `dircolors`. For full customisation you can create `~/.dircolors` file with the appropriate prescription. Either copy/symlink the one here from `src/` or generate the current setting via

```
dircolors --print-database > ~/.dircolors
```

## Color profiles

The color codes you can use in the `LS_COLORS` environment variable are based on ANSI color codes, which are standardized for use in terminal emulators. Here is a more comprehensive list of the codes and their corresponding colors or effects:

### Text Colors:

- `30`: Black
- `31`: Red
- `32`: Green
- `33`: Yellow (or Orange, depending on the terminal)
- `34`: Blue
- `35`: Magenta
- `36`: Cyan
- `37`: Light Gray

### Background Colors:

- `40`: Black background
- `41`: Red background
- `42`: Green background
- `43`: Yellow background
- `44`: Blue background
- `45`: Magenta background
- `46`: Cyan background
- `47`: Light Gray background

### Bright Colors:

Some terminals support bright color variants, which are often more vivid:

- `90`: Dark Gray
- `91`: Bright Red
- `92`: Bright Green
- `93`: Bright Yellow
- `94`: Bright Blue
- `95`: Bright Magenta
- `96`: Bright Cyan
- `97`: White

### Bright Background Colors:

- `100`: Dark Gray background
- `101`: Bright Red background
- `102`: Bright Green background
- `103`: Bright Yellow background
- `104`: Bright Blue background
- `105`: Bright Magenta background
- `106`: Bright Cyan background
- `107`: White background

### Formatting:

- `0`: Default color and style
- `1`: Bold/brighter
- `2`: Dim
- `4`: Underlined
- `5`: Blink (not widely supported, and often disabled)
- `7`: Reverse (swap foreground and background colors)
- `8`: Hidden (useful for passwords)

### Combining Codes:

You can combine these codes to achieve various effects. For example, `1;32` would be bold green text. Combine them by separating with a semicolon (`;`).

## Testing Colors:

To see how these colors look in your terminal, you can run a simple script:

```bash
for code in {30..37}; do echo -e "\e[${code}m \e[0m$code"; done
for code in {90..97}; do echo -e "\e[${code}m \e[0m$code"; done
for code in {40..47}; do echo -e "\e[${code}m \e[0m$code"; done
for code in {100..107}; do echo -e "\e[${code}m \e[0m$code"; done
```

This script will show a series of color blocks along with their codes, helping you to visualize what each code represents.

Remember that the exact appearance of these colors can vary depending on your terminal's color scheme and settings. Some terminals also support 256-color modes, which offer a much broader palette, but using them is more complex and not widely supported by `LS_COLORS`.