function onCreate()
    makeLuaSprite('blackscreen', 'blackscreen', 0, 0)
    setProperty('blackscreen.scale.x', 1000)
    setProperty('blackscreen.scale.y', 1000)
    setProperty('blackscreen.alpha', 0)
    setScrollFactor('blackscreen', 0, 0)
    addLuaSprite('blackscreen', false)
end

function onEvent(name, value1, value2)
if name == "BackDarker" then
   doTweenColor('coloredbf', 'boyfriend', value1, 1, 'quadInOut')
   doTweenColor('coloreddad', 'dad', value1, 1, 'quadInOut')
   doTweenColor('coloredgf', 'gf', value1, 1, 'quadInOut')
   doTweenAlpha('blackscreen', 'blackscreen', value2, 1, 'quadInOut')
end
end