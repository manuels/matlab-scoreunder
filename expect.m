classdef expect
	properties (Hidden)
		actual_value
	end

	methods
		function obj = expect(actual_value)
			obj.actual_value = actual_value;
		end

		function obj = toBe(obj, expected_value)
			actual_value = obj.actual_value;

			compare_scalar = @(a, e) assert(a == e);
			compare_pair = @(pair) compare_scalar(pair{:});

			if(isMatrix(actual_value))
				1
				compare_scalar(numel(actual_value), numel(expected_value));
				2
				for i = 1:numel(expected_value)
					compare_scalar(actual_value(i), expected_value(i));
				end
			else
				assert(false);
				compare_scalar(actual_value, expected_value);
			end
		end

		function obj = toBeTrue(obj)
			obj.toBe(true);
		end
	end


end
