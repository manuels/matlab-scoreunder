function autoCurry = autoCurry_()
	function ac = autoCurry__(fn, varargin)
		if(length(varargin) == 0)
			nargs = nargin(fn);
		else
			nargs = varargin{1};
		end

		function res = autoCurried(varargin)
			if(length(varargin) < nargs)
				if(nargs - length(varargin) > 0)
					res = autoCurry(curry_(fn, varargin{:}), nargs - length(varargin));
				else
					res = curry_(fn, varargin{:});
				end
			else
				res = fn(varargin{:});
			end
		end
		ac = @autoCurried;
	end

	autoCurry = @autoCurry__;
end
