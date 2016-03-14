function [labels]=binarySvmClassify(trainData,trainLabel,testData)
options=optimset('MaxIter',30000,'largescale','off');
model=svmtrain(trainData,trainLabel,'autoscale',true,'kernel_function','linear','method','QP','quadprog_opts',options);
labels=svmclassify(model,testData);
