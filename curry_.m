function curried_fn = curry_(fn, varargin)
	args = varargin;
        curried_fn = @(varargin) fn(args{:}, varargin{:});
end
