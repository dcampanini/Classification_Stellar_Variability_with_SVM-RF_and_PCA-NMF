function [ entH1,entH2,entHs,std1,std2,std3] = normImg( datos,dim )
% Para este caso dim=21*21=441
% Normaliza las 3 imágenes por separado, para esto normaliza 
% los vectores que forman las filas de las matrices,estos
% vectes tienen largo 441
[nf, nc]=size(datos);
entH1=datos(:,1:dim);entH2=datos(:,(dim+1):dim*2);entHs=datos(:,(dim*2+1):end);
std1=std(entH1');std2=std(entH2');std3=std(entHs);
for f=1:nf
    %waitbar(f/nf);
    mnH1=min(entH1(f,:));mxH1=max(entH1(f,:));
    mnH2=min(entH2(f,:));mxH2=max(entH2(f,:));
    mnHs=min(entHs(f,:));mxHs=max(entHs(f,:));
    for c=1:dim
        entH1(f,c)=(entH1(f,c)-mnH1)/(mxH1-mnH1);% Se tranforma cada pixel
        entH2(f,c)=(entH2(f,c)-mnH2)/(mxH2-mnH2);
        entHs(f,c)=(entHs(f,c)-mnHs)/(mxHs-mnHs);
    end
end    
end