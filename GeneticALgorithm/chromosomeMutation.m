function [ mutatedChromosome ] = chromosomeMutation( chromosome, dataRange)
    
    [numOfChromosome, genes] = size(chromosome);
    mutatedChromosome = zeros(numOfChromosome*genes, genes);
    mutatedChromosomeCount = 1;
    
    for i = 1 : numOfChromosome
        
        mutatedChromosome(mutatedChromosomeCount, :) = chromosome(i, :);
        mutatedChromosomeCount = mutatedChromosomeCount + 1;
        
        for j = 1 : 9
            randomGene = randi(genes); %% a gene is selected ramdomly
            randAddSub = randi(2); %% Ramdomly seleveted to ADD or SUB. 50-50.
            
            if(randAddSub == 1) %% if 1 is randomly selected between 1 and 2. then a value is ADDED to the gene
                
                geneMutation = dataRange(1, randomGene) + rand(1,1) * (dataRange(2, randomGene) - dataRange(1, randomGene));
                tempChromosome = chromosome(i, :);
                newGene = tempChromosome(1, randomGene) + geneMutation; %% New value is added to the gene 
                tempChromosome(1, randomGene) = newGene;
                mutatedChromosome(mutatedChromosomeCount, :) = tempChromosome;
                mutatedChromosomeCount = mutatedChromosomeCount + 1;
                
            else %% else. a value is SUDTRACTED from the gene
                
                geneMutation = dataRange(1, randomGene) + rand(1,1) * (dataRange(2, randomGene) - dataRange(1, randomGene)); 
                tempChromosome = chromosome(i, :);
                newGene = tempChromosome(1, randomGene) - geneMutation; %% value being subtracted from the gene
                tempChromosome(1, randomGene) = newGene;
                mutatedChromosome(mutatedChromosomeCount, :) = tempChromosome;
                mutatedChromosomeCount = mutatedChromosomeCount + 1;
                
            end
            
        end
        
    end
    
end

