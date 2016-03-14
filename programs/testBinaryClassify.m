function [labels] = testBinaryClassify(trainDataLoc,trainLabelLoc,testDataLoc)
 trainData=load(trainDataLoc);
 trainLabel=load(trainLabelLoc);
 testData=load(testDataLoc);
 
options=optimset('MaxIter',30000,'largescale','off'); 
model=svmtrain(trainData,trainLabel,'autoscale',true,'kernel_function','linear','method','QP','quadprog_opts',options);
labels=svmclassify(model,testData);
