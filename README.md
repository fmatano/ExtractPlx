# ExtractPlx
This package allows you to read a .plx file and write the data to hdf5 

## What do you need
Before extracting files, you’ll need to download
	
  *	Plexon Matlab SDK (http://www.plexon.com/software-downloads under Omniplex and MAP Offline) 
  
## How to proceed
Open Matlab, add the path to Matlab Offile Files SDK and change your directory of work
	
  > addpath('your_path_to/Plexon Offline SDKs/Matlab Offline Files SDK') 
	
  > cd ‘/your_path/Plexon Offline SDKs/Matlab Offline Files SDK/mexPlex'
	
  > build_and_verify_mexPlex()

Now you should be able to use a set of functions that you need to extract your waveforms.
Generally you get the channel info from plx_info and read the waves with plx_waves_v or spiketimes with plx_ts. But there is a pdf to guide you through.

Now provide the path for your input and output file
	
  > input_file = ‘/…/file_name.plx'
	
  > output_file = ‘/…/your_file_name.hdf5'

At this point you can just run the extract_unsorte.m/extract_sorted.m function, which will loop through all the channels and extract the waveform moments. 

The file will be saved in whatever path you gave for the output_file. If you need to open it in R, create a new project, and include the file in your main directory of work. Then install rhdf5 to read your data. 
	
	> install.packages(“rhdf5”)
	> library(rhdf5)
	> h5ls('waveform_moments.hdf5')
	> wf_names <- 'waveform_moments.hdf5'

and extract the content for instance using:
	
  > ts1 <- h5read(wf_names, 'ts-channel\001')
	
  > w1 <- h5read(wf_names, 'waves-channel\001')

