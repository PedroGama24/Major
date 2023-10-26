-- * Variable to real text
function formatVariable(text, variable, value)
	if type(value) ~= "string" and type(value) ~= "number" then
		return variable .. " = INVALID TYPE (" .. type(value) .. ")"
	end
	return text:gsub("%^" .. variable, value)
end