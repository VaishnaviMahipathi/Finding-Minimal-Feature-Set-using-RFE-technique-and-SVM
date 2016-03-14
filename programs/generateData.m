function [data,Labels]=generateData()
 data=randi(3,1000,20);
 Labels=randi(2,1000,1);
 xlswrite('depressionData',data);
 xlswrite('depressionLabels',Labels);
 