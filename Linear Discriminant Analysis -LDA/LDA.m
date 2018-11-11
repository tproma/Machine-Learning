load fisheriris

data = meas;
class = species;

setosa = data(1:50,:);
versicolor = data (51:100,:);
virginica = data (101:150,:);

setosa_mean = mean( data(1:50,:));
versicolor_mean = mean( data(51:100,:));
virginica_mean = mean( data(101:150,:));

M = mean(data);

MN_setosa = zeros(size(setosa));
MN_versicolor = zeros(size(setosa));
MN_virginica = zeros(size(setosa));

for i = 1:4
    MN_setosa( :,i) = setosa(:,i) - M( 1,i);
    MN_versicolor(:, i) = versicolor(:,i) - M( 1,i);
    MN_virginica(:,i)  = virginica(:,i) - M( 1,i);
end

C_setosa = cov( MN_setosa);
C_versicolor = cov( MN_versicolor);
C_virginica = cov(MN_virginica);

setosa_num = numel(setosa(:,1));
data_num = numel (data(:,1));

Sw = (setosa_num/data_num) *( C_setosa) + (setosa_num/data_num) * C_versicolor + (setosa_num/data_num) * C_virginica;

Sb = ( 50 * ( setosa_mean -M)' * ( setosa_mean -M)) + ( 50 * ( versicolor_mean -M)' * ( versicolor_mean -M)) + (50 * ( virginica_mean - M)' * ( virginica_mean - M)) ;

% projection matrix 

W = Sb * (Sw).^(-1);

[Evec,Eval] = eig(W);

projected_data = data * Evec(:,1);