function fname = fileparts_name(filename)
% Extract name of the file without extension
%
%   str = fileparts_name(filename)
%
% See also fileparts_dir, fileparts_nameext

% Copyright � 2009-2015 Pavel Krizek
%
% This file is part of SIMToolbox.
%
% SIMToolbox is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% SIMToolbox is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with SIMToolbox.  If not, see <http://www.gnu.org/licenses/>.

[~,fname,ext] = fileparts(filename);

if isempty(ext)
    fname = [];
end

