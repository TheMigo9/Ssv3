function onEvent(n,v1,v2)
    if n == 'Flash' then
        local lola = stringSplit(v1, ',')
        cameraFlash(v2, lola[1], tonumber(lola[2]))
    end
end