%% Add path to your Matlab Offline Files SDK
cd '/your_path_to/Plexon Offline SDKs/Matlab Offline Files SDK/mexPlex'
addpath('/your_path_to/Plexon Offline SDKs/Matlab Offline Files SDK')

%% Provide a path for your input and output file. The output needs to be a .hdf5
input_file = 'your_path_to_plx_file.plx'
output_file = 'your_path_to_the_output_file/waveform_moments.hdf5'

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
