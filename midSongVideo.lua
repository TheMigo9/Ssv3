function onEvent(name,v1,v2)
	if name == 'midSongVideo' then
		if v1 == 'true' then
			setProperty('inCutscene',true)
			
			if v2 == nil or v2 == '' then
				--nothing
			else
				startVideo(v2);
			end
		else
			setProperty('inCutscene',false)
		end
	end
end