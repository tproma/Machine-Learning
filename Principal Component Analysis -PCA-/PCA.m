function [ PC1_data ] = PCA( data )
    
    [row, col] = size(data);
    meanOfData = mean(data);
    
    meanNormalizedData = zeros(size(data));
    
    
    for i = 1:col
        meanNormalizedData(:, i) = data(:, i) - meanOfData(1, i);
    end

    covarianceOfMeanNormalizedData = cov(meanNormalizedData);
    
   [eigVecOfCov, eigValueOfCov] = eig(covarianceOfMeanNormalizedData); 
   
   sumEigValue = sum(eigValueOfCov,2);
   
   [sortedEigValue,  index] = sort(sumEigValue, 'descend');
   
   PrincipleComponents = zeros(size(eigVecOfCov));
      
   for i = 1 : col
        PrincipleComponents(:, i) = eigVecOfCov( :, index(i));       
   end
    
   PC1_data = meanNormalizedData * PrincipleComponents;
   
   transpos = sortedEigValue';
   cumValue = cumsum(transpos);
   sumValue = sum(transpos);
   [sizeTransRow, sizeTransCol] = size(transpos);
   
   for i = 1:sizeTransCol
      retain = (cumValue(sizeTransRow, i)/sumValue) * 100
   end
   
   

end

