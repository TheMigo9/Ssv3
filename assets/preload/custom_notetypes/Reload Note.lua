local shootName = {
	{'shootLEFT'},
	{'shootDOWN'},
	{'shootUP'},
	{'shootRIGHT'},
	}
	
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Reload Note' then
    if noteData == 0 then
        objectPlayAnimation('boyfriend', 'shootLEFT', true)
       end
       if noteData == 1 then
        objectPlayAnimation('boyfriend', 'shootDOWN', true)
       end
       if noteData == 2 then
        objectPlayAnimation('boyfriend', 'shootUP', true)
       end
       if noteData == 3 then
        objectPlayAnimation('boyfriend', 'shootRIGHT', true)
       end
    end
end

function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Reload Note' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bullet_Note')
        
        end
    end
end