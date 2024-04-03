local finnColor = {
    '87CEEB',
    '4169E1',
    '0000CD'
}
local jakeColor = {
    'FFFF99',
    'FFFF00',
    'FFD700'
}
local bfColor = {
    '87CEEB',
    '000080',
    'FFFFFF'
}
local pibbyColor = {
    'bcedf6',
    'bd65d8',
    'dc81f5'
}
local scarletSword = {
    'ffff63',
    'c6ab40',
    '795601'
}
local noteTypeToAnims = {}

noteTypeToAnims['Dodge Note'] = {
    'dodgeLEFT',
    'dodgeDOWN',
    'dodgeUP',
    'dodgeRIGHT'
}

noteTypeToAnims['Attack Note'] = {
    'shootLEFT',
    'shootDOWN',
    'shootUP',
    'shootRIGHT'
}


function onCreatePost()
    for i = 0,getProperty('unspawnNotes.length')-1 do

        local nt = getPropertyFromGroup('unspawnNotes',i,'noteType')
        if not getPropertyFromGroup('unspawnNotes',i,'mustPress') then
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.r', getColorFromHex(finnColor[1]))
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.g', getColorFromHex(finnColor[2]))
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.b', getColorFromHex(finnColor[3]))
            if nt == 'Finn Sword' then
                setPropertyFromGroup('unspawnNotes', i, 'visible', false)
            end
            if getPropertyFromGroup('unspawnNotes',i,'noteType') == 'Second Char Sing' or nt == 'Second Char Glitch' then
                setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
                setPropertyFromGroup('unspawnNotes', i, 'rgbShader.r', getColorFromHex(jakeColor[2]))
                setPropertyFromGroup('unspawnNotes', i, 'rgbShader.g', getColorFromHex(jakeColor[3]))
                setPropertyFromGroup('unspawnNotes', i, 'rgbShader.b', getColorFromHex(jakeColor[1]))
            end
            if nt == 'Both Char Sing' then
                setPropertyFromGroup('unspawnNotes', i, 'rgbShader.r', getColorFromHex(finnColor[1]))
                setPropertyFromGroup('unspawnNotes', i, 'rgbShader.g', getColorFromHex(jakeColor[3]))
                setPropertyFromGroup('unspawnNotes', i, 'rgbShader.b', getColorFromHex(jakeColor[1]))
            end
        else
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.r', getColorFromHex(bfColor[1]))
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.g', getColorFromHex(bfColor[2]))
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.b', getColorFromHex(bfColor[3]))
        end

        if getPropertyFromGroup('unspawnNotes',i,'gfNote') then
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.r', getColorFromHex(pibbyColor[3]))
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.g', getColorFromHex(pibbyColor[1]))
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.b', getColorFromHex(pibbyColor[2]))
            if not getPropertyFromGroup('unspawnNotes',i,'mustPress') then
                setPropertyFromGroup('unspawnNotes', i, 'visible', false)
            end
        end

        if getPropertyFromGroup('unspawnNotes',i,'noteType') == 'Dodge Note' then
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.r', getColorFromHex(scarletSword[1]))
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.g', getColorFromHex(scarletSword[2]))
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.b', getColorFromHex(scarletSword[3]))
        end
        if getPropertyFromGroup('unspawnNotes',i,'noteType') == 'Attack Note' then
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.r', getColorFromHex('2b2236'))
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.g', getColorFromHex(bfColor[2]))
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.b', getColorFromHex(bfColor[3]))
        end
    end

end

function onEvent(n,v1,v2)
    if n == 'Play Animation' then
        if v1 == 'reload' and v2 == '1' then
            playSound('reload',1)
        end
    end
end

function goodNoteHit(i)
    if noteTypeToAnims[getPropertyFromGroup('notes',i,'noteType')] then
        local animations = noteTypeToAnims[getPropertyFromGroup('notes',i,'noteType')]
        setProperty('boyfriend.skipDance',true)
        if getPropertyFromGroup('notes',i,'noteData') >= 0 and getPropertyFromGroup('notes',i,'noteData') < #animations then
            playAnim('boyfriend', animations[getPropertyFromGroup('notes',i,'noteData')+1], true)
        end
        if getPropertyFromGroup('notes',i,'noteType') == 'Dodge Note' then
            setObjectOrder('dadGroup',getObjectOrder('boyfriendGroup') + getRandomInt(-1,1))
        end
    end

    for i = 0,3 do
        setPropertyFromGroup('playerStrums', i, 'rgbShader.r', getColorFromHex(bfColor[1]))
        setPropertyFromGroup('playerStrums', i, 'rgbShader.g', getColorFromHex(bfColor[2]))
        setPropertyFromGroup('playerStrums', i, 'rgbShader.b', getColorFromHex(bfColor[3]))
        if getPropertyFromGroup('notes',i,'gfNote') then
            setPropertyFromGroup('playerStrums', i, 'rgbShader.r', getColorFromHex(pibbyColor[3]))
            setPropertyFromGroup('playerStrums', i, 'rgbShader.g', getColorFromHex(pibbyColor[1]))
            setPropertyFromGroup('playerStrums', i, 'rgbShader.b', getColorFromHex(pibbyColor[2]))
        end
    end
end

function opponentNoteHit(id,dir,nt)
    if getHealth() > 0.2 then addHealth(-0.016) end

    if nt == 'Second Char Glitch' then
        startGlitchCharacter('jake')
    end
    for i = 0,3 do
        setPropertyFromGroup('opponentStrums', i, 'rgbShader.r', getColorFromHex(finnColor[1]))
        setPropertyFromGroup('opponentStrums', i, 'rgbShader.g', getColorFromHex(finnColor[2]))
        setPropertyFromGroup('opponentStrums', i, 'rgbShader.b', getColorFromHex(finnColor[3]))
        if nt == 'Second Char Sing' or nt == 'Second Char Glitch' then
            playJakeAnim(dir)
            setPropertyFromGroup('opponentStrums', i, 'rgbShader.r', getColorFromHex(jakeColor[2]))
            setPropertyFromGroup('opponentStrums', i, 'rgbShader.g', getColorFromHex(jakeColor[3]))
            setPropertyFromGroup('opponentStrums', i, 'rgbShader.b', getColorFromHex(jakeColor[1]))
        end
        if nt == 'Both Char Sing' then
            playJakeAnim(dir)
            setPropertyFromGroup('opponentStrums', i, 'rgbShader.r', getColorFromHex(finnColor[1]))
            setPropertyFromGroup('opponentStrums', i, 'rgbShader.g', getColorFromHex(jakeColor[3]))
            setPropertyFromGroup('opponentStrums', i, 'rgbShader.b', getColorFromHex(jakeColor[1]))
        end
    end
    if getPropertyFromGroup('notes',id,'gfNote') or nt == 'Finn Sword' then
        staticOPStrums(dir)
    end
end
