# -*- coding: utf-8 -*-
"""
Created on Wed Dec 10 23:09:45 2014

@author: Venkatesh
"""




from sklearn.feature_selection import RFE
from sklearn.svm import SVR
dataHandle=open('C:\Venkatesh\Fall2014\CI\Data\cancerdata.txt')
labelHandle=open('C:\Venkatesh\Fall2014\CI\Data\cancerlabels.txt')

cancerData=[]
cancerLabels=[]
data=dataHandle.readlines()
for line in data:
    cells=line.strip("\n").split("\t")
    cancerData.append(cells)
    
label=labelHandle.readlines()
for line in label:
    cells=line.strip("\n")
    cancerLabels.append(cells)
#X, y = make_friedman1(n_samples=50, n_features=10, random_state=0)
estimator = SVR(kernel="linear")
selector = RFE(estimator,10, step=1)
selector = selector.fit(cancerData,cancerLabels)
#selector.support_array([ True,  True,  True,  True,  True,False, False, False, False, False], dtype=bool)
#selector.ranking_array([1, 1, 1, 1, 1, 6, 4, 3, 2, 5])
