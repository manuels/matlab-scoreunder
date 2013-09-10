function res = first_(collection)
	if isCell(collection)
		res = collection{1};
	else
		res = collection(1);
	end
end
