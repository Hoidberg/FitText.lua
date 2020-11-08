# FitText.lua, a modulescript for inflating text size
FitText makes font-sizes flexible. Use this modulescript on your fluid or responsive layout to achieve scalable headlines that fill the width of a parent frame.

## How it works
If you have a gui and want to use text scaled without having fluctuating text size, just require fittext.lua.
```lua
local FitText = require(script.FitText)

FitText.fitText(script.Parent)
```
### The Compressor
The default setting works pretty well, but when it doesn't FitText has one setting you can adjust. If your text resizes poorly or is resizing all hurdy gurdy, you'll want to turn tweak up/down the compressor. It works a little like a guitar amp.
```lua
FitText.fitText(script.Parent, 1.2) -- turn the compressor up (font will shrink a bit more aggressively)
FitText.fitText(script.Parent, 0.8) -- turn the compressor down (font will shrink less aggressively)
``` 
This will hopefully give you a level of "control" that might not be pixel perfect, but scales smoothly & nicely.

### Thanks
Thanks to Trent, Dave and Reagan for original FitText.js: https://github.com/davatron5000/FitText.js
http://fittextjs.com/ 
