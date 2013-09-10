function res = All_(callback, collection)
	if(isMatrix(collection))
		if(isequal(callback, @identity))
			res = all(collection);
		else
			res = all(map2matrix_(callback, collection));
		end
	else if(isCell(collection))
		res = all(map2matrix_(callback, collection));
	end
end
