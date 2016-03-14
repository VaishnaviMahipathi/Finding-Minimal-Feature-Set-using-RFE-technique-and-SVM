function [tprate,fprate,precision,recall,f_measure,g_mean,overall_accuracy]=assessmentRFE(originalLabelLoc,predictedLabelLoc)
origLabel=load(originalLabelLoc);
predLabel=load(predictedLabelLoc);
tp=0;fn=0;tn=0;fp=0;

[m n]=size(origLabel);

for i=1:m
    tempOL=origLabel(i,1);
    tempPL=predLabel(i,1);
    
    if tempOL==1
        if tempPL==tempOL
            tp=tp+1;
        else
            fn=fn+1;
        end;
        
    else
        if tempPL==tempOL
            tn=tn+1;
        else
            fp=fp+1;
        end;    
    end;
end;

tprate=tp/(tp+fn);% this is positive accuracy also
fprate=fp/(fp+tn);
precision=tp/(tp+fp);
recall=tprate;

negAccuracy=tn/(tn+fp);% this is negative accuracy

f_measure=(2*recall*precision)/(recall+precision);
g_mean=sqrt(tprate*negAccuracy);

overall_accuracy=(tp+tn)/m;

sum=(tp+fn+tn+fp);

if sum==m
    disp('total count balanced');
else
    disp('total count is not balanced');
end;

disp('program ends here');

    