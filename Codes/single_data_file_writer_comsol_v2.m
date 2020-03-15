% Mohammad Asif Zaman
% Converting multiple 2D table data from Comsol into a single csv file with
% 3D data
% Input files: csv files exported from comsol with XY plane data of a
% function, fx(x,y,zo). Each file has data for a different zo file.
% This will be repeated for other functions fy(x,y,zo) and fz(x,yo,zo)
%
% Input csv file data structure:
%   Column 1: x value (space coordinate)
%   Column 2: y value (space coordinate)
%   Column 4: fx value (function 1)
%   Column 5: fy value (function 2)
%   Column 6: fz value (function 3)
%
%
% Output csv file data structure:
%   Column 1: x value (space coordinate)
%   Column 2: y value (space coordinate)
%   Column 3: z value (space coordinate)
%   Column 4: fx value (function 1)
%   Column 5: fy value (function 2)
%   Column 6: fz value (function 3)






clear all;
close all;
clc;
clf;

fname_root = 'Data/ODEP/ro_0.5_zo_'; % Root name of the input csv files with directory location
n_header_row = 5; % Number of header rows in the csv file that should be ignored.

fname_out = 'Data/ODEP/CODEP_ro_0.5.csv';  % output csv file name

zo_set = [1.5 1.8 2.3 2.8 3.3 3.8];  % Suffix of file names which also indicate z value of the function

z_offset = 0;  % z-offset value. Used for shifting z=0 reference



% Defining variable arrays
xdata = [];
ydata = [];
zdata = [];
Fxdata = [];
Fydata = [];
Fzdata = [];


% Sweeo through each file
for m = 1:length(zo_set)
    zo = zo_set(m);  % Extract z value from file name

    file_name = [fname_root, num2str(zo),'.csv'];  % file name
    Mdata = csvread(file_name,n_header_row);       % Ignore the header rows    
 
    % order of the variables should be appropriately changed here
    xdata = [xdata; Mdata(:,1)];
    ydata = [ydata; Mdata(:,2)];
    zdata = [zdata; ones(length(Mdata(:,2)),1)*(zo-z_offset)];  
    Fxdata = [Fxdata; Mdata(:,4)];
    Fydata = [Fydata; Mdata(:,5)];
    Fzdata = [Fzdata; Mdata(:,6)];
end

% Output variables
Mdata_combined = [xdata ydata zdata Fxdata Fydata Fzdata];

% Write output csv file
csvwrite(fname_out,Mdata_combined);









