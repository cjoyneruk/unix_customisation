# Key mappings for Ubuntu

Methodology for swapping the ctrl and cmd keys on a Mac keyboard to simulate the Mac setup on Ubuntu.

This guide is based upon this [YouTube video](https://www.youtube.com/watch?app=desktop&v=utqpa_8SXkA) and associated [GitHub page](https://github.com/NapoleonWils0n/cerberus/blob/master/ubuntu/wayland-xkb.org) from [NapoleonWils0n](https://github.com/NapoleonWils0n)

I don't understand how this methodology is working but it produces the desired output. It is a modification on the aformentioned guide in that only the ctrl and cmd keys are swapped, as opposed to include the alt key in that mapping as well. I did try utilising `xmodmap` however I couldn't get it to work. Apparently `xkb` works differently to `xmodmap`. 

## Install Gnome tweaks

First install `gnome-tweaks` using

```
sudo apt install gnome-tweaks
```

We come back to that later.

## xkb customisation

### Create directories

create the ~/.config/xkb directory and sub directories

```
mkdir -p ~/.config/xkb/{symbols,rules,compat,keycodes,types}
```

### Create xkb files

Now create the following files

```
rules/evdev
rules/evdev.xml
symbols/custom
symbols/gb
```

#### `rules/evdev`

```
! option = symbols
  custom:swap_ctrl_cmd = +custom(swap_ctrl_cmd)
  custom:swap_alt = +custom(swap_alt)

! include %S/evdev
```

#### `rules/evdev.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xkbConfigRegistry SYSTEM "xkb.dtd">
<xkbConfigRegistry version="1.1">
  <layoutList>
    <layout>
      <configItem>
        <name>gb</name>
      </configItem>
      <variantList>
        <variant>
          <configItem>
            <name>swap_ctrl_cmd</name>
            <shortDescription>swap_ctrl_cmd</shortDescription>
            <description>GB(swap_ctrl_cmd)</description>
          </configItem>
        </variant>
      </variantList>
    </layout>
  </layoutList>
  <optionList>
    <group allowMultipleSelection="true">
      <configItem>
        <name>custom</name>
        <description>custom options</description>
      </configItem>
      <option>
        <configItem>
          <name>custom:swap_ctrl_cmd</name>
          <description>Swap ctrl and cmd keys</description>
        </configItem>
      </option>
    </group>
  </optionList>
</xkbConfigRegistry>
```

#### `symbols/custom`

```
// Ctrl is mapped to Win/Cmd and Win to the Ctrl/Cmd key.
partial modifier_keys
xkb_symbols "swap_ctrl_cmd" {
    key <LCTL> { [ Super_L ] };
    key <RCTL> { [ Super_R ] };
    key <LWIN> { [ Control_L, Control_L ] };
    key <RWIN> { [ Control_R, Control_R ] };
};
```

#### `symbols/gb`

```default partial alphanumeric_keys 
xkb_symbols "swap_ctrl_cmd" {

    name[Group1]= "swap_ctrl_cmd - Mac";

    key <LCTL> { [ Super_L ] };
    key <RCTL> { [ Super_R ] };
    key <LWIN> { [ Control_L, Control_L ] };
    key <RWIN> { [ Control_R, Control_R ] };
};
```

## Switching on the mapping

The final step is now to open Gnome Tweaks, go to the 'Keyboard and Mouse' settings and click the 'Additional Layout Options' Button, at the bottom of the list you should see custom options. Your custom settings will be listed under this menu and you can enable them by clicking the checkbox next to their name.

## Ubuntu shortcuts

Under Settings > Keyboard > Keyboard Shortcuts it is possible to alter shortcut options. For example in the system shortcuts I have altered the overview and applications to come from the Apple function keys.