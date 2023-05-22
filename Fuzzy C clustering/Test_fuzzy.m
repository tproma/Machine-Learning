function [binaryMembershipMatrix ] = fuzzyTest( testData,centeroids)


    [row, ~] = size(testData);
    [numOfCluster, ~] = size(centeroids);
    proximityMatrix = zeros(row, numOfCluster);
    membershipMatrix = zeros(row, numOfCluster);
    binaryMembershipMatrix = zeros(row, numOfCluster);
    
    for i = 1 : numOfCluster
        for j = 1 : row
            
            proximityMatrix(j, i) = norm(testData(j, :) - centeroids(i, :));
            
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
    
    for i = 1 : row
        
        [~, indx] = max(membershipMatrix(i, :));
        binaryMembershipMatrix(i, indx) = 1;
        
    end
    
end

