# future-mari0
future mari0 is a work in progress port of the [mari0 1.6](http://stabyourself.net/mari0/) original code to the löve 0.10.0 API. It aims to be as little intrusive as possible while guaranteeing total compatibility so löve distribution bound platforms can play the game.

Mostly function renaming was necessary, but as usage differed some modules had to be rewired to behave well with newer APIs. In special threading support is a little different since 0.8.x so it is most likely the biggest change. As of now only bare functionality is guaranteed (as in the game runs) but further testing is required and some modes flat out crash. If you're interested in helping you can start by filing an issue.

Mari0 is a game by [Stabyourself](http://stabyourself.net/) under the [CC BY-NC-SA 3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/) license.
