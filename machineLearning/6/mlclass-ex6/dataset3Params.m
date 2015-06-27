function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

cMat = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigmaMat = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
retMat = zeros(size(cMat,1)*size(sigmaMat,1),3);
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
for cRun = 1:size(cMat,1)
   cCur = cMat(cRun,1); 
   for sigmaRun = 1:size(sigmaMat,1) 
       sigMaCur = sigmaMat(sigmaRun,1);
       iterRun = size(cMat,1)*(cRun-1)+ sigmaRun;
       retMat(iterRun,1) =  cCur;
       retMat(iterRun,2) = sigMaCur;
       model= svmTrain(X, y, cCur, @(x1, x2) gaussianKernel(x1, x2, sigMaCur));
       predictions = svmPredict(model, Xval);
       retMat(iterRun,3) =  mean(double(predictions ~= yval));
   end 
end
[~, minIndex]= min(retMat(:,3));
C = retMat(minIndex,1);
sigma = retMat(minIndex,2);
% =========================================================================

end
