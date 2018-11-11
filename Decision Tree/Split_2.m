function [ class_data, nonclass_data, purity_matrix] = Split_2( data, Feature_mean, index,noOfData )

% class_name
%  c1_setosa = 0;
%  c1_versicolor = 0;
%  c1_verginica = 0;
%  
%  c2_setosa = 0;
%  c2_versicolor = 0;
%  c2_verginica = 0;
  
 noOfSplit = 2;
 noOfClass = 3;
 purity_matrix = zeros(noOfSplit, noOfClass); % row =  2 classes && col = setosa, v,vg
 
 
%  class_data = zeros(size(data(100,:)))
%  nonclass_data = zeros(size(data(90,:)))

% class_data = zeros(size(100

 x = 1;
 y = 1;
 
%  c1 = zeros(100,4);
%  c2 = zeros(100,4)
 
 
 for i = 1 : noOfData %size(data(:,1))
     if data(i,index(1)) < Feature_mean(1,index(1))
       c1(x,:) = data(i,:);
       x = x+1;
       if i<=50
          purity_matrix(1,1) = purity_matrix(1,1) + 1; %c1_setosa = c1_setosa +1;
       elseif i>=51 && i<=100
         purity_matrix(1,2) = purity_matrix(1,2) + 1;% c1_versicolor = c1_versicolor + 1;
       else  purity_matrix(1,3) = purity_matrix(1,3) + 1;% c1_verginica = c1_verginica +1;
       end
       
     else c2(y,:) = data(i,:);
         y = y+1;
         if i<=50
           purity_matrix(2,1) = purity_matrix(2,1) + 1;%c2_setosa = c2_setosa +1;
         elseif i>=51 && i<=100
          purity_matrix(2,2) = purity_matrix(2,2) + 1; %c2_versicolor = c2_versicolor + 1;
         else purity_matrix(2,3) = purity_matrix(2,3) + 1; %c2_verginica = c2_verginica +1;
         end
        
     end    
 end
 
    [ c1_membership_max, c2_membership_max ] = Class_recognition( purity_matrix )
    if c1_membership_max > c2_membership_max
        class_data = c1;
        nonclass_data = c2;
    else
        class_data = c2;
        nonclass_data = c1;
    end
 

 
%  if setosa > versicolor && setosa > verginica
%      class_name = 'setosa';
%  elseif versicolor > setosa && versicolor > verginica
%      class_name  = 'versocolor'
%  else class_name  ='verginica'
%  end
%  max(setosa, versicolor,verginica)

end

