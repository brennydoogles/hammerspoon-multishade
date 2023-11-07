# hammerspoon-multishade
A multi-screen darkening spoon heavily inspired by the official Shade spoon.

## Installation

### SpoonInstall

Make sure you have set up [SpoonInstall](https://www.hammerspoon.org/Spoons/SpoonInstall.html):

- Point SpoonInstall at this repo by adding this config to your `~/.hammerspoon/init.lua`
 ```lua
hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.repos.MultiShade = {
    url = "https://github.com/brennydoogles/hammerspoon-multishade",
    desc = "MultiShade spoon repository",
    branch = "master",
}

spoon.SpoonInstall:andUse("MultiShade", { repo = "MultiShade" })
```
