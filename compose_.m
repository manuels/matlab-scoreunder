function composed = compose_(varargin)
	functions = varargin;
	composed = functions{end};

	i = nargin-1;
	while(i > 0)
		composed = @(varargin) functions{i}(composed(varargin{:}));

		i = i - 1;
	end
end
