# Awesome Window Manger Config

## Dependencies

### xfce4

I like to use the lock screen manager and the config uses the xfce4 lock screen command
`xfce4-screensaver`
`xfce4-screensaver-command` is also used but should be covered by the above command

### Compositor

I am also using a custom compositor for handling some transparency and transitions
Arch: `picom`
All else: `compton`

### Other

- `vicious` -> for [awesome widgets](https://archlinux.org/packages/extra/any/vicious/)
- `nitrogen` -> for wallpapers
- `arandr` -> for configuring displays in awesome

## Customizations

Favorite Wallpapers [HERE](https://www.artstation.com/caldermoore)

### GTK Dark Mode

Add the following to `/etc/gtk-3.0/settings.ini`

```ini
[Settings]
gtk-application-prefer-dark-theme = true
```

### Cursor Size

Add the following to `~/.Xresources`

`Xcursor.size: 9`
