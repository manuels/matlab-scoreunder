function result = filter(condition, collection)
	if isCell(collection)
		cond = @(value, res) ifThenElse_({res{:} value}, res, condition(value));
		init = {};
	else
		cond = @(value, res) [res ifThenElse_(value, [], condition(value))];
		init = [];
	end
	result = reduce_(cond, init, collection);
end
