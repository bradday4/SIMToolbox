function IM = seqcfmaskonly(IMseq, MaskOn)
% Confocal image computed using mask only scheme (sum image at ON pixels positions)
%
%   IM = seqcfmaskonly(IMseq, MaskOn)
%
% Input/output arguments:
%
%   IMseq  ... [m x n x numseq]  sequence of images stored in a matrix
%   MaskOn ... [m x n x numseq]  mask sequence
%   IM     ... [m x n]  final image computed from image sequence
%
% Example:
%
%   datadir = 'data\polen\pollen 100X 1.45NA';
%   imginfo = imginfoinit(datadir);
%   ptrninfo = ptrnopen(ptrndirinfo(datadir));
%   calinfo = calload([datadir '\..\calibration\calibration_LIN.yaml']);
%   IMseq = seqload(imginfo, 'z', 2, 'datatype','single');
%   IMseq = seqstriperemoval(IMseq);
%   MaskOn = ptrnmaskprecompute(imginfo, ptrninfo, calinfo, 'runningorder', 1, 'sigma', 1.3);
%   IM = seqcfmaskonly(IMseq, MaskOn);
%   figure; imagesc(IM); axis off image; colormap gray;
%
% See also seqload, seqwf, seqcfmaxmin, seqcfscaledsub

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

if nargin < 1
  IM.mfile = fileparts_name([mfilename('fullpath') '.m']);
  IM.name = 'Mask only';
  IM.id = 'maskonly';
  IM.applymask = 1;
  return;
end

IM = seqsubseq(@cfmaskonly, IMseq, MaskOn);

function IM = cfmaskonly(IMseq, MaskOn)

IM  = seqopsummaskon(IMseq, MaskOn);

%eof