classdef TestValue 
    properties (Hidden)
        value;
    end
    methods
        function this = TestValue(value)
            this.value = value;
        end

        function toBe(this, v)
            assert( isequal(this.value, v) );
        end
    end
end
