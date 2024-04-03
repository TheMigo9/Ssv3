function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'GlitchNoAnimation' then --Check if the note on the chart is a Bullet Note
setPropertyFromGroup('unspawnNotes', i, 'texture', 'Noheroshit/GlitchNotes');
setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
		end
	end
end