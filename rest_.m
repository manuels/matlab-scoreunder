function res = rest_(collection)
	if isCell(collection)
		res = {collection{2:end}};
	else
		res = collection(2:end);
	end
end
