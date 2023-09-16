function label = Tukey_test_of_distance_between_head_and_tail(label,centerline_all)

%% Tukey test

% only label the unlabelled
mask = label == 0;
indices = find(mask);
n_frames_2 = length(indices);

% calculate Euclidean distance between head and tail
Euclid_distance_between_head_and_tail = zeros(n_frames_2,1);
count = 0;
for i = indices'
    count = count + 1;
    centerline = centerline_all{i,1};
    Euclid_distance_between_head_and_tail(count) = sqrt(sum((centerline(:,1) - centerline(:,100)).^2));
end

% histogram
figure;
histogram(Euclid_distance_between_head_and_tail);
xlabel('Euclidean distance between the head and the tail (mm)');
ylabel('number of frames');
title('f(Euclidean distance between the head and the tail)');

% perform Tukey test
IQR_index = 3; % super parameter % bigger, stricter
[~, ~, mask_up, mask_down,...
    up_limit, down_limit, upper_bound, lower_bound] = ...
    Tukey_test(Euclid_distance_between_head_and_tail, IQR_index);

% visulize
draw_lines(up_limit, down_limit, upper_bound, lower_bound);

%% add label
global label_number_outlier
label(indices) = mask_down * 1 + mask_up * label_number_outlier;

end