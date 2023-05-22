load fisheriris

data = meas;
%class = species;

[dataRow,dataCol] = size(data);
class = zeros(dataRow,3);

class(1:50,1) = 1;
class(51:100,2) = 1;
class(101:150,3) = 1;

centeroids = supervisedGeneticAlgo(data, class);
