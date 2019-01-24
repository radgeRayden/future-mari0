As of 2019 this port is redundant as the original developers of the game ported it to a higher version. You can get it at https://github.com/Stabyourself/mari0.

# future-mari0
future mari0 is a work in progress port of the [mari0 1.6](http://stabyourself.net/mari0/) original code to the löve 0.10.0 API. It aims to be as little intrusive as possible while guaranteeing total compatibility so löve distribution bound platforms can play the game.

Mostly function renaming was necessary, but as usage differed some modules had to be rewired to behave well with newer APIs. In special threading support is a little different since 0.8.x so it is most likely the biggest change. As of now only bare functionality is guaranteed (as in the game runs) but further testing is required and some modes flat out crash. If you're interested in helping you can start by filing an issue.

Mari0 is a game by [Stabyourself](http://stabyourself.net/) under the [CC BY-NC-SA 3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/) license.

## Packaging instructions

1. Go to the game/ folder.
2. Make a zip archive containing all of its files.
3. Make sure main.lua is at the top level of your zip.
4. Double-check just to make sure.
5. Change the extension of your zip to .love. So if it was mari0.zip before it becomes mari0.love.

If you did all the steps correctly, your game is ready to run, provided you have a 0.10.0 löve runtime. Get yours at [löve's official website](https://love2d.org).

Alternatively you can get the latest 'build' at the releases section, although those are slightly out of date.
