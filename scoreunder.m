function r = scoreunder()
	r = struct();

	r.autoCurry = autoCurry_();
	r.curry = @curry_;
	r.compose = @compose_;

	r.identity = @(x) x;

	r.isMatrix = @isMatrix;
	r.isArray = @r.isMatrix;
	r.isCell = @isCell;

	r.isTrue = @(x) x == true;
	r.isFalse = @(x) x == false;
	r.identity = @(x) x;

	r.map2cell = r.autoCurry(@map2cell_);
	r.map2matrix = r.autoCurry(@map2matrix_);
	r.map2array = r.autoCurry(@map2matrix_);

	r.reduce = r.autoCurry(@reduce_);
	r.filter = r.autoCurry(@filter_);

	r.ifThenElse = r.autoCurry(@ifThenElse_);

	r.first = @first_;
	r.rest = @rest_;

	r.zip = r.autoCurry(@zip_);
	r.flatten = @flatten_;
	%r.All = r.autoCurry(@All_);
end
