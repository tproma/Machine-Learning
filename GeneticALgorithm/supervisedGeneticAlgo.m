function [ centeroids ] = supervisedGeneticAlgo(data, class)

[~, dataCol] = size(data);
[numOfData, numOfClass] = size(class);
maxNumOfDataPerClass = max(sum(class));
meanNormalizedData = zeros(size(data));
meanOfData = mean(data);

for i = 1 : dataCol
    meanNormalizedData(:, i) = data(:, i) - meanOfData(1, i);
end

dataRange(1, :) = min(meanNormalizedData);
dataRange(2, :) = max(meanNormalizedData);
sortedAccourdingToClass = zeros(maxNumOfDataPerClass, numOfClass);

for i = 1 : numOfClass
    dataNum = 1;
    for j = 1 : numOfData        
        if(class(j, i) == 1)
            sortedAccourdingToClass(dataNum, i) = j;
            dataNum = dataNum + 1;
        end
        
    end
end

numOfSeeds = int8(sum(class) * 0.1);
chromosome = zeros(sum(numOfSeeds), dataCol);

chromosomeNumCount = 1;

for i = 1 : numOfClass
    numOfDataPerClass = sum(sortedAccourdingToClass(:, i) > 0);
    seeds = numOfSeeds(1, i);
    randVal = randperm(numOfDataPerClass, seeds);
    
    for j = 1 : seeds        
        dataIndex = sortedAccourdingToClass(randVal(1, j), i);
        chromosome(chromosomeNumCount, :) = data(dataIndex, :);
        chromosomeNumCount = chromosomeNumCount + 1;
    end
end

newSeedPopulation = chromosomeMutation(chromosome, dataRange);



centeroids = chromosome

end

