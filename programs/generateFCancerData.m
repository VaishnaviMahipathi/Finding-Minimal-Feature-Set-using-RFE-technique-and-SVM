function [trainData]=generateFCancerData(trainDataLoc,selectFeature)
trainD=load(trainDataLoc);
selectF=load(selectFeature);

[m n]=size(trainD);
[a b]=size(selectF);
trainData=zeros(m,a);
k=1;
for i=1:a
    indx=selectF(i,1);
    trainData(:,k:k)=trainD(:,indx:indx);
    k=k+1;
end;

dlmwrite('C:\Venkatesh\Fall2014\CI\FinalProject\Data\1_fcd.txt',trainData,' ');
    