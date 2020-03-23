# COMSOL-to-MATLAB-data-process
MATLAB codes for combining, processing csv data files exported from COMSOL. 

# Files

## single_data_file_writer_comsol_v2.m
Combines multiple csv files into a single csv file. The input csv files contains data of a 2D sweep (i.e. F(x,y,zo) is evaluated when x and y are varied and zo is kept constant). Each input csv file is evaluated for a different value of the third parameter (zo is different for each csv file). The output csv file combines the input files to create tabulated F(x,y,z) values where all three variables are swept. This csv file can be used to make a mat file.
