function varargout = TF_conversion(varargin)
%TF_CONVERSION:
%This function takes in arrays with values "True" or "False" (case doesn't
%matter) and returns new arrays with 1 and 0 instead.

for i=1:nargin
    varargout{i} = strcmpi(varargin{i}, 'TRUE')
end

end

