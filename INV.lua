-- by PatrickYT
function onCreate()
makeLuaSprite('black', nil, -40, -21)
makeGraphic('black', 2000, 2000, '000000')
scaleObject('black', 5, 5)
setProperty('black.alpha', 0)
addLuaSprite('black', false)
end
function onEvent(name,value1, value2)
if name == 'INV' then
if value1 == 'dad inv' then
setProperty('dad.colorTransform.greenOffset', 0)
setProperty('dad.colorTransform.redOffset', 255)
setProperty('dad.colorTransform.blueOffset', 0)
end

if value1 == 'dad not inv' then
setProperty('dad.colorTransform.greenOffset', 0)
setProperty('dad.colorTransform.redOffset', 0)
setProperty('dad.colorTransform.blueOffset', 0)
end

if value1 == 'gf inv' then
setProperty('gf.colorTransform.greenOffset', 138)
setProperty('gf.colorTransform.redOffset', 196)
setProperty('gf.colorTransform.blueOffset', 255)
setProperty('gf.gammaOffset', 1.0)
end

if value1 == 'gf not inv' then
setProperty('gf.colorTransform.greenOffset', 0)
setProperty('gf.colorTransform.redOffset', 0)
setProperty('gf.colorTransform.blueOffset', 0)
end

if value1 == 'jake inv' then
setProperty('jake.colorTransform.greenOffset', 138)
setProperty('jake.colorTransform.redOffset', 196)
setProperty('jake.colorTransform.blueOffset', 255)
setProperty('jake.gammaOffset', 1.0)
end

if value1 == 'jake not inv' then
setProperty('jake.colorTransform.greenOffset', 0)
setProperty('jake.colorTransform.redOffset', 0)
setProperty('jake.colorTransform.blueOffset', 0)
end

if value1 == 'inv' then
setProperty('black.alpha', 1)
setProperty('dad.colorTransform.greenOffset', 255)
setProperty('dad.colorTransform.redOffset', 255)
setProperty('dad.colorTransform.blueOffset', 255)
setProperty('gf.colorTransform.greenOffset', 255)
setProperty('gf.colorTransform.redOffset', 255)
setProperty('gf.colorTransform.blueOffset', 255)
setProperty('boyfriend.colorTransform.greenOffset', 255)
setProperty('boyfriend.colorTransform.redOffset', 255)
setProperty('boyfriend.colorTransform.blueOffset', 255)
setProperty('jake.colorTransform.greenOffset', 255)
setProperty('jake.colorTransform.redOffset', 255)
setProperty('jake.colorTransform.blueOffset', 255)
end

if value1 == 'inv not' then
setProperty('black.alpha', 0)
setProperty('WBG.colorTransform.greenOffset', 0)
setProperty('WBG.colorTransform.redOffset', 0)
setProperty('WBG.colorTransform.blueOffset', 0)

setProperty('dad.colorTransform.greenOffset', 0)
setProperty('dad.colorTransform.redOffset', 0)
setProperty('dad.colorTransform.blueOffset', 0)

setProperty('gf.colorTransform.greenOffset', 0)
setProperty('gf.colorTransform.redOffset', 0)
setProperty('gf.colorTransform.blueOffset', 0)

setProperty('boyfriend.colorTransform.greenOffset', 0)
setProperty('boyfriend.colorTransform.redOffset', 0)
setProperty('boyfriend.colorTransform.blueOffset', 0)

setProperty('jake.colorTransform.greenOffset', 0)
setProperty('jake.colorTransform.redOffset', 0)
setProperty('jake.colorTransform.blueOffset', 0)
end
end
end