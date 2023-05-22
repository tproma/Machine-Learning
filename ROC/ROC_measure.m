function [FPR, sesitivity] = ROC_measure(tp,fp,fn,tn)


testOutcomePositive = tp + fp;
testOutcomeNegetive = fn + tn;
conditionPositive = tp + fn;
conditionNegetive = fp + tn;

positivePredectiveValue_PPV = tp/testOutcomePositive; % PRECISION
negativePredectiveValue_NPV = tn/testOutcomeNegetive;

testOutcome = testOutcomePositive + testOutcomeNegetive;
condition = conditionPositive + conditionNegetive;


sesitivity = tp/conditionPositive;  %TPR = sesitivity
specificity = tn/conditionNegetive; % True NEgative raTE

TPR = sesitivity
FPR = fp/conditionNegetive % fALLOUT
PPV = positivePredectiveValue_PPV
f1 = 2*tp/(2*tp + fp +fn)
acc = (tp + tn)/testOutcome
Matthews_corelation_coefficient = ((tp * tn) - (fp * fn))/sqrt((tp+fp)*(tp+fn)*(tn+fp)*(tn+fn))


plot(FPR, sesitivity)


end

