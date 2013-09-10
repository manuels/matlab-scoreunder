classdef Tester < handle
    methods
        function obj = Tester()
        end

        function [varargout] = subsref(this,S)

            if S(1).type(1) =='('
                tv = TestValue(S(1).subs{:});
            end

            if numel(S) > 1
                try
                    [varargout{1:nargout}] = builtin('subsref', tv, S(2:end));
                catch me
                    me.throwAsCaller();
                end
            else
                varargout{1} = tv;
            end

        end
    end
end
