function res = flatten_(collection)
	res = {};
	for i = 1:length(collection)
		value = collection{i};

		if isCell(value)
			flattened = flatten_(value);
			res = {res{:} flattened{:}};
		else
			res{end+1} = value;
		end
	end
end
