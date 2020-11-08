--[[
	FitText.lua 1.0
	
	Copyright 2020, Charlie West-Toebe https://hoidberg.github.io/
]]

local Player = game.Players.LocalPlayer

local screenSizeContainer = Instance.new("ScreenGui", Player.PlayerGui) do
	screenSizeContainer.Name = "ScreenSizeContainer"
end
local text = {}

function extend(obj, ext)
	if ext then
		local extended = {unpack(obj, 1, #obj)}
		for n,v in pairs(ext) do
			local key = table.find(ext, v)
			if ext[key] then
				extended[key] = ext[key]
			end
		end
		return extended
	else
		return obj
	end
end

function text.fitText(el, kompressor, options)
	local settings = extend({
		["minFontSize"] = 1,
		["maxFontSize"] = 100
	}, options)
	
	local function fit()
		local compressor = kompressor or 1
		
		local function resizer()
			el.TextSize = math.clamp((el.Size.X.Scale * screenSizeContainer.AbsoluteSize.X) / (compressor * 10), settings.minFontSize, settings.maxFontSize)
		end
		
		resizer()
		
		local resize = screenSizeContainer:GetPropertyChangedSignal("AbsoluteSize")
		local textchange = el:GetPropertyChangedSignal("Text")
		local orientationchange = Player.PlayerGui:GetPropertyChangedSignal("CurrentScreenOrientation")

		resize:Connect(resizer)
		textchange:Connect(resizer)
		orientationchange:Connect(resizer)
	end
	
	fit(el)
	
	return el
end

return text
