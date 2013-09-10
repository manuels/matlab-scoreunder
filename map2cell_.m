function res = map2cell_(callback, collection)
	if(isMatrix(collection))
		res = arrayfun(callback, collection, 'UniformOutput', false);
	elseif(isCell(collection))
		res = cellfun(callback, collection, 'UniformOutput', false);
	else
		assert('unknown collection type!');
end
