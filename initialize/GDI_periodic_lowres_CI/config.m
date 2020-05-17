function config()
%% coarse grid for testing GDI development

cwd = fileparts(mfilename('fullpath'));
if isempty(getenv('GEMINI_ROOT')), run([cwd, '/../../setup.m']), end

cfg = read_config([cwd, '/config.nml']);
cfg.outdir = '~/simulations/GDI_periodic_lowres_CI/inputs/';
cfg.realbits=64;
%% generate grid
% should be able to include cfg.x2parms to generate nonuniform grid in
% x2...
cfg.x2parms=[200e3,1e3,9.75e3,10e3];  %dist. from edge to start degrading, min step, max step, transition length
xg = makegrid_cart_3D(cfg);
%% Interpolate data to desired grid resolution
eq2dist(cfg, xg);
%% perturbation
perturb(cfg, xg)
%% E-field boundary conditions
Efield(cfg, xg)

end % function