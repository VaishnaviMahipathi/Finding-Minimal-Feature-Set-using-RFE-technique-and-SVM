function [testLabels]=svmClassifier(trainData,trainLabel,testData)
% this program combines a binary class svm classier to multi class svm
% classifier

% unique function will return the unique class labels from trainLabel set
classLabelSet=unique(trainLabel);

%length return the number of elements in classLabelSet
uniqueCLCount=length(classLabelSet);
svmModels=zeros(uniqueCLCount,1);

%Initializing testLabels matrix with testData size
[p q]=size(testData);
testLabels = zeros(p,1);

%Classification using SVM is a two step process
%First step is SVM should be trained for all classes
%Second step is SVM is used to classify the test data

% First step --starts
options=optimset('MaxIter',30000);
for i=1:uniqueCLCount
    %Vectorized statement that binarizes Group
    %where 1 is the current class and 0 is all other classes
    AllSpecific=(trainLabel==classLabelSet(i));
    svmModels(i) = svmtrain(trainData,AllSpecific,'kernel_function',linear,options);
end
% First step --ends


%Second step--starts
for i=1:p
    for j=1:uniqueCLCount
        if(svmclassify(svmModels(j),testData(i,:))) 
            break;
        end
    end
    testLabels(i) = j;
end
%Second step--ends