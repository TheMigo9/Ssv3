function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "Lyricsfinn" then

        makeLuaText('captions', 'Lyrics go here', 1000, 160, 400)
        setTextString('captions',  '' .. string)
        setTextColor('captions', 'F00000')
        setTextSize('captions', 65);
        addLuaText('captions')
setTextFont('captions', 'Thunderman.ttf')
	setObjectCamera('captions', 'other');
        setTextAlignment('captions', 'center')
        
    end
end

