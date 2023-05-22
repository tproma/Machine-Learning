function [ cluster] = fuzzy_C_cluster( trainData, oldMean, newMean, numOfCluster )

diffMean = (oldMean - newMean) > 0.5;

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
        inverseDistSum = 0;
        for j = 1 : numOfCluster
            inverseDistSum = inverseDistSum + 1/proximityMatrix(i, j);
        end
        
        for j = 1 : numOfCluster
            membershipMatrix(i, j) = (1/proximityMatrix(i, j))/inverseDistSum;
        end
    end
    
    oldMean = newMean;
    
    for i = 1 : numOfCluster
        
        for j = 1 : row
            
            memData(j, :) = membershipMatrix(j, i) .* trainData(j, :);
            
        end
        newMean(i, :) = nansum(memData) ./ nansum(membershipMatrix(:, i));
        
    end
    
    cluster = fuzzyCluster(trainData, oldMean, newMean, numOfCluster);
    
else
    
    cluster = newMean;
end

end

