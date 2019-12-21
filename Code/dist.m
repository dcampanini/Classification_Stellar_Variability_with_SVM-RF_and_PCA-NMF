function [ hist1,hist2 ] = dist( H1,class)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here

hist1=zeros(1,10);
hist2=zeros(1,10);
for i=1:length(class)
    if class(i)==1
        a=find(H1(i,:)==max(H1(i,:)));
        hist1(a(1))=hist1(a(1))+1;
    else
        b=find(H1(i,:)==max(H1(i,:)));
        hist2(b(1))=hist2(b(1))+1;
    end
end
        

end

