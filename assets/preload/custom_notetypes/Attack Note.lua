local shootName = {
	{'shootLEFT'},
	{'shootDOWN'},
	{'shootUP'},
	{'shootRIGHT'},
	}
	
function goodNoteHit(id,dir,type,sus)
if type == 'Attack Note' then
		characterPlayAnim('boyfriend',shootName[dir+ 1][1] , true)
		setProperty('boyfriend.specialAnim', true);
	end
	end

function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Attack Note' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bullet_Note')
        
        end
    end
end