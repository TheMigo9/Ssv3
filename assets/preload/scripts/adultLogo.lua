function onCreate()
    makeLuaSprite('as', 'aslogo', 1000, 600)
    scaleObject('as', 0.20, 0.20)
    addLuaSprite('as', true)
setObjectCamera('as', 'other');
setProperty('as.alpha', 0.5)
end
function onUpdatePost(elapsed)
if downscroll then
    setProperty('cn.y', 60)
end
end