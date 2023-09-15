function convert_yaml_to_mcd(full_path_to_yaml,folder_of_saved_mcd)
    mcd = Mcd_Frame;
    mcd = mcd.yaml2matlab(full_path_to_yaml); % most time-consuming step
    savepath = fullfile(folder_of_saved_mcd,'mcd.mat');
    save(savepath, 'mcd');
    disp('mcd file saved successfully');
end