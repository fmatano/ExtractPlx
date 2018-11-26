%% Add path to your Matlab Offline Files SDK
cd '/Users/francescamatano/Dropbox/CMU/thesis/Plexon Offline SDKs/Matlab Offline Files SDK/mexPlex'
addpath('/Users/francescamatano/Dropbox/CMU/thesis/Plexon Offline SDKs/Matlab Offline Files SDK')

%% Provide a path for your input and output file
input_file = '/Users/francescamatano/Dropbox/CMU/thesis/r_code/pre-processing/20161214/Nigel.VR.20161214.plx'
% output_file = '/Users/francescamatano/Dropbox/CMU/thesis/r_code/pre-processing/20161214/waveform_moments.hdf5'

output_file = '/Users/francescamatano/Dropbox/CMU/thesis/r_code/pre-processing/20161214/sorted_data/waveform_moments.hdf5'

  %% Iterate through all channels 
  for chan= 1:plx_chan_names(input_file)
  
    for(i = 1:4) % there are at most 4 units per channel
        [n, npw, ts, wave] = plx_waves_v(input_file, chan, i);

        %% Write out times
        dname = strcat('/ts-channel', num2str(chan), '.', num2str(i));
        fprintf('ts name: %s \n',dname);

        h5create(output_file, dname, length(ts), 'ChunkSize', length(ts), 'Deflate', 3);
        h5write(output_file, dname, ts);

        %% Write out waveforms
        dname = strcat('/waves-channel', num2str(chan), '.', num2str(i));
        % dname = strcat('/waves-channel', num2str(chan));
        fprintf('wave name: %s \n',dname);

        h5create(output_file, dname, size(wave));
        h5write(output_file, dname, wave);
    end
  end
