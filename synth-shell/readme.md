# Synth shell prompt modification

The shell scripts have been taken entirely from the [synth-shell-prompt](https://github.com/andresgongora/synth-shell-prompt) Github Repository of Andres Gongora. The contain [bash-tools](https://github.com/andresgongora/bash-tools) scripts have also come from Andres Gongora.

I've only very minor tweaks have been made to 

- Avoid having to run the startup/installation script
- Adjust the styling

To install simply move/copy/symlink the contents of the `src/` folder to `~/.config/synth-shell/` and include the following line in the `.bashrc` file

```bash
source ~/.config/synth-shell/synth-shell-prompt.sh
```

To change stylings create (or modify) the config files and update the path in the `synth-shell-prompt.sh` bash script.