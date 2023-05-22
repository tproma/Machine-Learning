
data = [2,10,2,2,3,11,12
    1,11,1,3,2,11,10];
data = data';

numOfCluster = 2;

[row, features] = size(data);
newMean = zeros(numOfCluster, features);
oldMean = ones(numOfCluster, features);
oldMean = oldMean .* inf;

%
% for i = 1 : numOfCluster
%
%     seed = randi(row);
%     newMean(i, :) = data(seed, :);
%
% end

newMean(1, :) = data(1,:);
newMean(2, :) = data(2,:);
% choosign 1st 2 as mean

centeroids = fuzzy_C_cluster(data, oldMean, newMean, numOfCluster);


test = [7 7 14 15 0 4 11 2 6 7;
    8 12 1 15 1 7 12 2 5 6];
test = test'

% class_info = [1  1 1 1 0 0
%     0 1 0 0 0 1 1];

class_info = class_info';
[  membership_matrix ] = Test_fuzzy( test, centeroids)
% from membersghip will get the  ckusters of the test values
