function onCreatePost()
	makeLuaSprite('whitebg', '', 0, 0)
	setScrollFactor('whitebg', 0, 0)
	makeGraphic('whitebg', 1840, 1030, 'FFFFFF')
	addLuaSprite('whitebg', false)
	setProperty('whitebg.alpha', 0)
	screenCenter('whitebg', 'xy')
end
function onEvent(n, v1, v2)
	if n == 'badapplelol3' and string.lower(v1) == 'a' then
		doTweenAlpha('appear', 'whitebg', 1, v2, 'linear')
		doTweenColor('dad', 'dad', '000000', v2, 'linear')
		doTweenColor('novia', 'gf', '000000', v2, 'linear')
    setProperty('boyfriendGroup.alpha', 0.001)
	end
	if n == 'badapplelol3' and string.lower(v1) == 'b' then
		doTweenAlpha('applebadxd', 'whitebg', 0, v2, 'linear')
		doTweenColor('badapplexd4', 'dad', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd5', 'gf', 'FFFFFF', v2, 'linear')
	end
end