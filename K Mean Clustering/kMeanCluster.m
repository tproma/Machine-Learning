function [ cluster ] = kMeanCluster(trainData, oldMean, newMean, numOfCluster)

diffMean = (oldMean - newMean) > 0.2;

if (sum(diffMean(:)) > 1)
    
    [row, ~] = size(trainData);
    proximityMatrix = zeros(row, numOfCluster);
    membershipMatrix = zeros(row, numOfCluster);
    
    for i = 1 : numOfCluster
        for j = 1 : row
            
            proximityMatrix(j, i) = norm(trainData(j, :) - newMean(i, :));
            
        end
    end
    
    for i = 1 : row
        
        [~, indx] = min(proximityMatrix(i, :));
        membershipMatrix(i, indx) = 1;
        
    end
    
    oldMean = newMean;
    
    for i = 1 : numOfCluster
        
        for j = 1 : row
            
            memData(j, :) = membershipMatrix(j, i) .* trainData(j, :);
            
        end
        newMean(i, :) = sum(memData) ./ sum(membershipMatrix(:, i));
        
    end
    
    
    
    cluster = kMeanCluster(trainData, oldMean, newMean, numOfCluster);
else
    
    cluster = newMean;
end

end

