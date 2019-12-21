function [ featuresn ] = normalizar(features)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[nf, nc]=size(features);
featuresn=zeros(nf,nc);
for i=1:nf
    featuresn(:,i)=features(:,i)/norm(features(:,i));
end
end

