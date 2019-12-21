function [ m_all,std_all ] = standar(datos,dim)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

entH1=datos(:,1:dim);entH2=datos(:,(dim+1):dim*2);entHs=datos(:,(dim*2+1):end);
std1=std(entH1');std2=std(entH2');std3=std(entHs');
m1=mean(entH1');m2=mean(entH2');m3=mean(entHs');

std_all=[std1' std2' std3'];
m_all=[m1' m2' m3'];

end

