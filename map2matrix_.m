function res = map2array_(callback, collection)
	if(isMatrix(collection))
		res = arrayfun(callback, collection, 'UniformOutput', true);
	elseif(isCell(collection))
		res = cellfun(callback, collection, 'UniformOutput', true);
	else
		assert('unknown collection type!');
end
