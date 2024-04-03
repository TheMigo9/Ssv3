function onEvent(eventName, value1, value2)
	if(eventName == "botplayEvent") then
			if(tonumber(value1) == 0) then botplayChange(0)
		elseif(tonumber(value1) == 1) then botplayChange(1)
		else botplayChange(not getProperty("cpuControlled")) end;
	end
end

function botplayChange(cpu,show)
	local val = false;
	if(cpu == 1) then val = true; end
	setProperty("cpuControlled", val);

	--remove this line if you don't want BOTPLAY to appear
	setProperty("botplayTxt.visible", val);
end