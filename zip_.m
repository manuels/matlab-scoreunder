function zipped = zip_(x,y, varargin)
	if(isMatrix(x) && isMatrix(y) && numel(x) == numel(y))
		zipped = [x', y'];
	else
		if(isCell(x) && isCell(y) && numel(x) == numel(y))
			zipped = cell(numel(x), 1);
			for i = 1:numel(x)
				zipped{i} = {x{i}, y{i}};
			end
		else
			assert(false);
		end
	end
end

