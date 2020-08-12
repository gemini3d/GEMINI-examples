cwd = fileparts(mfilename('fullpath'));
gemini_root = [cwd, filesep, '../../../GEMINI'];
addpath([gemini_root, filesep, 'script_utils'])
addpath([gemini_root, filesep, 'setup/gridgen'])
addpath([gemini_root, filesep, '../GEMINI-scripts/setup/gridgen'])
addpath([gemini_root, filesep, 'setup/'])
addpath([gemini_root, filesep, 'vis'])
addpath(['../../setup/gridgen'])
file_format = 'raw';

%MOORE, OK GRID (FULL)
dtheta=20;
dphi=27.5;
lp=192;
lq=384;
lphi=128;
altmin=80e3;
glat=39;
glon=262.51;
%gridflag=0;
gridflag=1;


%MATLAB GRID GENERATION
if (~exist('xg'))
  xg=makegrid_tilteddipole_3D(dtheta,dphi,lp,lq,lphi,altmin,glat,glon,gridflag);
  %xg=makegrid_tilteddipole_varx2_3D(dtheta,dphi,lp,lq,lphi,altmin,glat,glon,gridflag);
  %xg=makegrid_tilteddipole_varx2_oneside_3D(dtheta,dphi,lp,lq,lphi,altmin,glat,glon,gridflag);
end


% %PLOT THE GRID IF DESIRED
% flagsource=0;
% sourcelat=glat;
% sourcelong=glon;
% neugridtype=[];
% zmin=[];
% zmax=[];
% rhomax=[];
% ha=plotgrid(xg,flagsource,sourcelat,sourcelong,neugridtype,zmin,zmax,rhomax);


%SAVE THE GRID DATA
p.eq_dir='../../../simulations/mooreOK3D_hemis_eq/';
p.outdir='mooreOK3D_hemis_lowres';
p.nml='config.nml';
p.file_format='h5';
eq2dist(p,xg);
