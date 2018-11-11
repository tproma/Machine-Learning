function [ class_data, nonclass_data, class_name ] = Split( data, Feature_mean, index,noOfData )

 setosa = 0;
 versicolor = 0;
 verginica = 0;
  
 class_data = zeros(size(data(100,:)))
 nonclass_data = zeros(size(data(90,:)))
 x = 1;
 y = 1;
 
 c1 = zeros(size(100, 4));
 c2 = zeros(size(100,4))
 
 
 for i = 1 : noOfData %size(data(:,1))
    if data(i,index(1)) < Feature_mean(1,index(1))
       class_data(x,:) = data(i,:);
       x = x+1;
       if i<=50
           setosa = setosa +1;
       elseif i>=51 && i<=100
          versicolor = versicolor + 1;
       else verginica = verginica +1;
       end
       
     else nonclass_data(y,:) = data(i,:);
         y = y+1;
        
    end    
 end
 
 if setosa > versicolor && setosa > verginica
     class_name = 'setosa';
 elseif versicolor > setosa && versicolor > verginica
     class_name  = 'versocolor'
 else class_name  ='verginica'
 end
%  max(setosa, versicolor,verginica)

end

