function res = reduce_(callback, accumulator, collection)
	res = accumulator;

	if(isCell(collection))
		for i = 1:numel(collection)
			res = callback(collection{i}, res);
		end
	else if(isMatrix(collection))
		for i = 1:numel(collection)
			res = callback(collection(i), res);
		end
	end
end
