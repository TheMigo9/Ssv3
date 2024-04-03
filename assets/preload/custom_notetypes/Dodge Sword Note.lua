local dodgeName = {
	{'dodgeLEFT'},
	{'dodgeDOWN'},
	{'dodgeUP'},
	{'dodgeRIGHT'},
	}
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Dodge Sword Note' then
    if noteData == 0 then
        objectPlayAnimation('boyfriend', 'dodgeLEFT', false)
       end
       if noteData == 1 then
        objectPlayAnimation('boyfriend', 'dodgeDOWN', false)
       end
       if noteData == 2 then
        objectPlayAnimation('boyfriend', 'dodgeUP', false)
       end
       if noteData == 3 then
        objectPlayAnimation('boyfriend', 'dodgeRIGHT', false)
       end
    end
end

function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Dodge Sword Note' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'SwordNOTE_assets')
        
        end
    end
end