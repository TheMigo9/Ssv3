--jake's game over spritesheet is messed up so it's not added

function onGameOver()
	openCustomSubstate('gameOver', true)
	return Function_Stop
end

function onCustomSubstateCreate(tag)
	if tag == 'gameOver' then
		makeLuaSprite('void', '', 0, 0);
		makeGraphic('void', 1280, 720, '000000')
		setObjectCamera('void', 'other')
		addLuaSprite('void', false)

		gameOverName = 'bfdeathfinn'
		gameOverSound = 'bffinndeath'
		deathOffsets = {'43', '56'} 
		loopOffsets = {'-72', '-192'}
		retryOffsets = {'553', '33'}
		deathFrames = 95
		loopFrames = 33
		retryFrames = 63

		makeAnimatedLuaSprite('stupidIdiot','characters/'..gameOverName, 450, 0)
		addAnimationByPrefix('stupidIdiot', 'death', 'bfdies', 24)
		addAnimationByPrefix('stupidIdiot', 'loop', 'deathloop', 24)
		addAnimationByPrefix('stupidIdiot', 'retry', 'retry', 24)
		setObjectCamera('stupidIdiot', 'other')
		scaleObject('stupidIdiot', 1.5, 1.5)
		addLuaSprite('stupidIdiot', false)

		setProperty('stupidIdiot.offset.x', deathOffsets[1]);
		setProperty('stupidIdiot.offset.y', deathOffsets[2]);
		playAnim('stupidIdiot', 'death')
		playSound(gameOverSound, 1)
	end
end

local frame = 0
local restart = false

function onCustomSubstateUpdate(tag, elapsed)
	if tag == 'gameOver' then
		frame = frame + (elapsed*24)

        if keyJustPressed('accept') and getProperty('stupidIdiot.animation.curAnim.name') ~= 'death' and getProperty('stupidIdiot.animation.curAnim.name') ~= 'retry' then
			frame = 0
			setProperty('stupidIdiot.offset.x', retryOffsets[1]);
			setProperty('stupidIdiot.offset.y', retryOffsets[2]);
			playAnim('stupidIdiot', 'retry')
			stopSound('gameOver')
			playSound('../sounds/gffinnrevive', 1)
        end
	end
end

function onCustomSubstateUpdatePost(tag)
	if tag == 'gameOver' then
		--debugPrint(getProperty('stupidIdiot.animation.curAnim.curFrame'))
		setProperty('stupidIdiot.animation.curAnim.curFrame', frame)
		if getProperty('stupidIdiot.animation.curAnim.curFrame') == deathFrames and getProperty('stupidIdiot.animation.curAnim.name') == 'death' then
			frame = 0
			setProperty('stupidIdiot.offset.x', loopOffsets[1]);
			setProperty('stupidIdiot.offset.y', loopOffsets[2]);
			playAnim('stupidIdiot', 'loop')
			playSound('../music/gameOver', 1, 'gameOver')
		elseif getProperty('stupidIdiot.animation.curAnim.curFrame') == loopFrames and getProperty('stupidIdiot.animation.curAnim.name') == 'loop' then
			frame = 0
			playAnim('stupidIdiot', 'loop')
		elseif getProperty('stupidIdiot.animation.curAnim.curFrame') == retryFrames and getProperty('stupidIdiot.animation.curAnim.name') == 'retry' then
			restartSong()
		end
	end
end