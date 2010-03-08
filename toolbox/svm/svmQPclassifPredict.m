function [yhat, f] = svmQPclassifPredict(model, Xtest)
% yhat(i) = -1 or 1
Ktest = model.kernelFn(Xtest, model.X); 
[Ntest, Ntrain] = size(Ktest); %#ok
H = repmat(model.y(:)', Ntest, 1) .* Ktest;
f = H*model.alpha + model.bias;
yhat = sign(f);
%yhat = convertLabelsTo01(yhat);
end