load fisheriris

data = meas;
class = species;
[noOfData noOfFeatures] = size(data)

for i = 1 : noOfFeatures
Feature_mean(i) = mean(data(:,i));
end

%plot(data(:,1),'*')

 goodness = size(1,noOfFeatures)
 for i =1: noOfFeatures
    goodness(i) = Goodness_of_feature(data(:,i) , Feature_mean(1,i), noOfData)
 end
 
 [sorted_goodness index] = sort(goodness,'descend')
 
 
 
 %  ...........split..................
 
 
 [class_data_1, nonclass_data_1, purity_matrix] = Split_2( data, Feature_mean,index(1),noOfData )
 %[class_data_2, nonclass_data_2, purity_matrix] = Split_2( nonclass_data_1, Feature_mean,index(1),noOfData )
 
 %[class_data_2, nonclass_data_2, class_name_2] = Split( nonclass_data_1, Feature_mean,index(2),size(nonclass_data_1) )
%  [class_data, nonclass_data_3, class_name] = Split( nonclass_data_2, Feature_mean,index(3),noOfData )
% %  [class_data, nonclass_data_4, class_name] = Split( nonclass_data_3, Feature_mean,index(4),noOfData )
%  
 
%  setosa = 0;
%  versicolor = 0;
%  verginica = 0;
%  
%  c1 = zeros(size(data(100,:)))
%  nonc1 = zeros(size(data(150,:)))
%  x = 1;
%  y = 1;
%  for i = 1 : noOfData
%     if data(i,index(1)) < Feature_mean(1,index(1))
%        c1(x,:) = data(i,:);
%        x = x+1;
%        if i<=50
%            setosa = setosa +1;
%        elseif i>=51 && i<=100
%           versicolor = versicolor + 1;
%        else verginica = verginica +1;
%        end
%        
%      else nonc1(y,:) = data(i,:);
%          y = y+1;
%         
%     end    
%  end
%  
%  for i = 1:size(nonc1)
%      if( data(
%      
%  end
 


