function onCreatePost()
    setProperty('skipCountdown', true)
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
end
function onCreate()
    makeLuaSprite('place', 'finn/nohero/bgnoherofull', -600, -300)
    addLuaSprite('place', false)
scaleObject('place', 2.0, 2.0)
    makeLuaSprite('placeog', 'finn/nohero/place', -600, -300)
    addLuaSprite('placeog', false)
    setProperty('placeog.visible', false)
scaleObject('placeog', 2.5, 2.5)
    makeAnimatedLuaSprite('anim','finn/nohero/noherocutscenefirst', -200, -410)
    addAnimationByPrefix('anim','play','play',24,false)
	scaleObject('anim', 2.55, 2.55)
setObjectCamera('anim', 'other')
	addLuaSprite('anim', true)
setProperty('anim.alpha', 0.001)
end
function onSongStart()
setProperty('anim.alpha', 1)
setProperty('camGame.alpha', 1)
setProperty('camHUD.alpha', 1)
	objectPlayAnimation('anim', 'play', true);
end
function onStepHit()
if curStep == 32 then
setProperty('anim.visible', false)
end
if curStep == 448 then
doTweenAlpha('huddd', 'camHUD', 0, 1, 'linear')
end
if curStep == 464 then
doTweenAlpha('huddd', 'camHUD', 1, 1, 'linear')
    setProperty('place.visible', false)
    setProperty('placeog.visible', true)
end
if curStep == 592 then
    setProperty('placeog.visible', false)
    setProperty('place.visible', true)
end
if curStep == 848 then
doTweenAlpha('huddd', 'camHUD', 0, 0.7, 'linear')
doTweenAlpha('bd', 'place', 0, 0.7, 'linear')
doTweenColor('puta', 'dad', '31B7FF', 0.7, 'linear')
doTweenColor('puto', 'boyfriend', '31B7FF', 0.7, 'linear')
end
if curStep == 869 then
doTweenAlpha('huddd', 'camHUD', 1, 0.7, 'linear')
end
if curStep == 880 then
setProperty('place.alpha', 1)
doTweenColor('puta', 'dad', 'FFFFFF', 0.5, 'linear')
doTweenColor('puto', 'boyfriend', 'FFFFFF', 0.5, 'linear')
end
if curStep == 1264 then
doTweenAlpha('huddd', 'camHUD', 0, 0.5, 'linear')
doTweenAlpha('coñodelaputamadreporquesedesuscribendemiputocanalbasurashijosdeputamalparidosabortos', 'camGame', 0, 0.5, 'linear')
end
    end