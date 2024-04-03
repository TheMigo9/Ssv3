function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'GlitchAltSing' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Noheroshit/GlitchNotes'); --Change texture
setPropertyFromGroup('unspawnNotes', i, 'animSuffix', '-alt')
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Glitch' then
setProperty('health', getProperty('health')-0.3);
playSound('glitchhit', 1);
triggerEvent('Play Animation', 'hurt', 'bf')
    end
end