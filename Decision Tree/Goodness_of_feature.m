function [ goodness ] = Goodness_of_feature(feature , Feature_mean, noOfData)
% this function will check the purity of the features. 
%   probability of each feature will be checked


L_total = 0;
R_total = 0;
L_setosa = 0;
L_versicolor = 0;
L_verginica = 0;
R_setosa = 0;
R_versicolor = 0;
R_verginica = 0;

for i = 1 : noOfData
    if feature(i) < Feature_mean
        L_total = L_total + 1;
       if i<=50
           L_setosa = L_setosa +1;
       elseif i>=51 && i<=100
          L_versicolor = L_versicolor + 1;
       else L_verginica = L_verginica +1;
       end


    else 
         R_total = R_total + 1;
       if i<=50
           R_setosa = R_setosa +1;
       elseif i>=51 && i<=100
          R_versicolor = R_versicolor + 1;
       else R_verginica = R_verginica +1;
       end

    end



end

       Left_setosa = L_setosa/ L_total
       Left_versicolor = L_versicolor/ L_total
       Left_verginica = L_verginica/ L_total

       Right_setosa = R_setosa/ R_total
       Right_versicolor = R_versicolor/ R_total
       Right_verginica = R_verginica/ R_total
       
       Probability_setosa = (Left_setosa + Right_setosa)/2
       Probability_versicolor = (Left_versicolor + Right_versicolor)/2
       Probability_verginica = (Left_verginica + Right_verginica)/2
       
       
       %p = Probability_setosa + Probability_versicolor +  Probability_verginica
       
       
       goodness = Probability_setosa ;
end