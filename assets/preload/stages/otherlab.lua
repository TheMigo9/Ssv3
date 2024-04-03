local spin = 6
function onCreate()
    makeLuaSprite('bg', 'finn/bg', 900, 525)
	scaleObject('bg', 2.62, 2.62)
	addLuaSprite('bg', false)
    makeAnimatedLuaSprite('dark','finn/light', 890, 555)
    addAnimationByPrefix('dark','loop','light idle',45,true)
    objectPlayAnimation('dark','loop',true);
    setScrollFactor('dark', 1,1)
	scaleObject('dark', 4.4, 4.4)
	addLuaSprite('dark', true)
if not lowQuality then
	makeLuaSprite('bulb', 'finn/bulb', -110, 70)
	scaleObject('bulb', 5.9, 5.9)
	addLuaSprite('bulb', true)

    setProperty('bulb.alpha', 0.8)
end
	makeLuaSprite('culo', '', -60, 0)
    setObjectCamera('culo', 'other')
    makeGraphic('culo', 1360, 1600, '000000')
    setProperty('culo.alpha', 1)
    addLuaSprite('culo', false)
end
function onSongStart()
if songName == 'Mindless' then
doTweenAlpha('sexo', 'culo', 0, 5, 'linear')
setObjectCamera('culo', 'hud')
    setProperty('dadGroup.alpha', 0.0001)
	setProperty('bg.visible', false)
	setProperty('dark.visible', false)
	setProperty('bulb.visible', false)
end
end

function onStepHit()
if curStep == 296 then
if songName == 'Mindless' then
    setProperty('dadGroup.alpha', 1)
	setProperty('bg.visible', true)
	setProperty('dark.visible', true)
	setProperty('bulb.visible', true)
end
end
end