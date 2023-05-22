% tp = 24;
% fp = 88;
% fn = 76;
% tn = 12;


[FPR(1), sensitivity(1)] = ROC_measure(77,77,23,23)

[FPR(2), sensitivity(2)] = ROC_measure(24,88,76,12)

[FPR(3), sensitivity(3)] = ROC_measure(76,12,24,88)

scatter(FPR, sensitivity)

% testOutcomePositive = tp + fp;
% testOutcomeNegetive = fn + tn;
% conditionPositive = tp + fn;
% conditionNegetive = fp + tn;
% 
% positivePredectiveValue_PPV = tp/testOutcomePositive; % PRECISION
% negativePredectiveValue_NPV = tn/testOutcomeNegetive;
% 
% testOutcome = testOutcomePositive + testOutcomeNegetive;
% condition = conditionPositive + conditionNegetive;
% 
% 
% sesitivity = tp/conditionPositive;  %TPR = sesitivity
% specificity = tn/conditionNegetive; % True NEgative raTE
% 
% TPR = sesitivity
% FPR = fp/conditionNegetive % fALLOUT
% PPV = positivePredectiveValue_PPV
% f1 = 2*tp/(2*tp + fp +fn)
% acc = (tp + tn)/testOutcome
% Matthews_corelation_coefficient = ((tp * tn) - (fp * fn))/sqrt((tp+fp)*(tp+fn)*(tn+fp)*(tn+fn))
% 
% 
% plot(FPR, sesitivity)
% 
% 
