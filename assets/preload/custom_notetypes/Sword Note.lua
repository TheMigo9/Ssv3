local dodgeName = {
	{'dodgeLEFT'},
	{'dodgeDOWN'},
	{'dodgeUP'},
	{'dodgeRIGHT'},
	}
function goodNoteHit(id,dir,type,sus)
if type == 'Dodge Note' then
		characterPlayAnim('boyfriend',dodgeName[dir+ 1][1] , true)
		setProperty('boyfriend.specialAnim', true);
	end
	end

function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Sword Note' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'SwordNOTE_assets')
        
        end
    end
end