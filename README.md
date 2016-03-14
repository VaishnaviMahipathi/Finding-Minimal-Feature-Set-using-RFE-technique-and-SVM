# RFE-and-SVM
The Programs folder contains all the MATLAB programs and python program.

rfeprogram.py contains the code for Recursive feature elimination technique.

generateFCancerData.m takes trainingdata file and selected features indices file as inputs and outputs the training data file with only selected features.
accuracy_rfe.m takes above generated training data set file and training label file as input and applies 10-fold cross validation logic and outputs the predicted label set.
assessmentRFE.m takes original labels file and predicted labels file as inputs and outputs all the assessment metrics


Dataset files:

cancerdata.txt: it has the complete training data with all the features. It has 569 samples and 30 features.
Cancerlabels.txt: It has 569 labels corresponding to 569 samples.
n_sfindex: this file contains the selected feature numbers. For example, 5_sfindex contains the top 5 selected feature numbers.
n_fcd: this file contains the training data with n features only. For example, 5_fcd contains the training data with 5 selected features only.
Data folder contains another folder named testLabels. This folder contains the predicted label files. For example, file name n_fcd_testlabels contains the predicted labels for the training data with only n features.
