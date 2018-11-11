function [ c1_membership_max, c2_membership_max ] = Class_recognition( purity_matrix )

sum_class= sum(purity_matrix,2);
% c1_setosa(:,1) = purity_matrix(:,1)/sum_class
% c2_versicolor(:,1) = purity_matrix(:,2)/sum_class
% c3_verginica(:,1) = purity_matrix(:,3)/sum_class

c1_memberhip = purity_matrix(1,:)/sum_class(1,:)
c2_memberhip = purity_matrix(2,:)/sum_class(2,:)

c1_membership_max = max(c1_memberhip)
c2_membership_max = max(c2_memberhip)

% if c1_membership_max > c2_membership_max
%     
% 
% end

