%trainDataLoc is cancerData file name
%trainLabelLoc is cancerLabel file name
%selectFeature is selected features index file name

function [testLabels]=accuracy_rfe(trainDataLoc,trainLabelLoc,np)
 trainData=load(trainDataLoc);
 trainLabel=load(trainLabelLoc);
  [m,n]=size(trainData);


  testLabels=zeros(m,1);
  trainData1=zeros(m-50,n);
  trainLabel1=zeros(m-50,1);
  si=0;sj=50;sk=1;
  for j=1:np
      disp('copying the traindata and trian label for j th time');
      testData1=trainData((si+1):sj,1:end);
    if si >= 2 
          trainData1=trainData(1:(si),1:end);
          trainLabel1=trainLabel(1:(si),1);
      
     
         %trainData1(end+1:(end+(m-sj)),1:end)=trainData(sj:end,1:end);
         %trainLabel1(end+1:(end+(m-sj)),1)=trainLabel(sj:end,1);
         stemp=si+1;
         for s1=sj+1:m
             %for s2=1:n
              %   trainData1(stemp+1,s2)=trainData(s1+1,s2);
              %  stemp=stemp+1;
            %end;
            trainData1(stemp:stemp,1:end)=trainData(s1:s1,1:end);
            trainLabel1(stemp,1)=trainLabel(s1,1);
            stemp=stemp+1;
            disp('inside copying the data and labels..for loop');
         end;
        
    else
      trainData1=trainData(sj+1:end,1:end);
      trainLabel1=trainLabel(sj+1:end,1:end);
    end;    
      disp('testing set number');
      disp(j);
      
      disp('before calling the classifyKNN');
      si=si+50;
      sj=sj+50;
     % [p q]=size(testData1);
      [m1 n1]=size(trainData1);
      disp('size of trainData1');
      disp(m1);disp(n1);
      [c d]=size(trainLabel1);
      disp('size of trainLabel1');
      disp(c);disp(d);
      
 % for i=1:p
     
      [testLabel]= binarySvmClassify(trainData1,trainLabel1,testData1);
      for factor=1:50
       testLabels(sk,1)=testLabel(factor,1);
       sk=sk+1;
      end; 
      
      disp('done with cancer data classification');
  %end;
  
  end;
  %%
  
  

 