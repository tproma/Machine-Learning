function [ accuracy ] = kMeanTest( testData, classInfo, centeroids)

    [row, ~] = size(testData);
    [numOfCluster, ~] = size(centeroids);
    proximityMatrix = zeros(row, numOfCluster);
    membershipMatrix = zeros(row, numOfCluster);
    
    for i = 1 : numOfCluster
        for j = 1 : row
            
            proximityMatrix(j, i) = norm(testData(j, :) - centeroids(i, :));
            
        end
    end
    
    for i = 1 : row
        
        [~, indx] = min(proximityMatrix(i, :));
        membershipMatrix(i, indx) = 1;
        
    end
    
    matchCount = 0;
    
    for i = 1 : row
        
        if (classInfo(i, :) == membershipMatrix(i, :))
            matchCount = matchCount + 1;
        end
        
    end
    
    accuracy = (matchCount / row) * 100;
    
end

