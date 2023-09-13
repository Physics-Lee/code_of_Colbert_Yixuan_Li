function is_passed = double_check_for_Euclidean_distance_of_head_and_tail(...
    label_rearranged_v2,...
    label_number,...
    t_threshold)

global s2frame
max_continuous_frames = maxContinuousFrames(label_rearranged_v2, label_number);
if max_continuous_frames > t_threshold * s2frame
    is_passed = 1;
else
    is_passed = 0;
end
    
end