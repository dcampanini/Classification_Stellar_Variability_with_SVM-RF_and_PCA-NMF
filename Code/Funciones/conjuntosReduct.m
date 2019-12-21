function [entrenamiento,prueba,classE,classP]=conjuntosReduct(class,features,por)
% por= al porcentaje de los datos con el que deseo trabajar
% ej  por=0.1 => el 10% de los datos

[fm, cm]=size(features);% fm= n° filas matriz features
datos_m=zeros(fm,cm);
vuln_m=zeros(fm,1);
mm=randperm(fm);     % mm vector aleatorio con números enteros de 1 a fm
for i=1:fm;
    datos_m(i,:)=features(mm(i),:);
    vuln_m(i)=class(mm(i));
end
% vuln_mc={};
% for t=1:fm;
%     vuln_mc{t,1}=class{mm(t),1};
% end

cutRow=floor(por*fm);
datos_m=datos_m(1:cutRow,:);
vuln_m=vuln_m(1:cutRow,:);
[fm2, cm2]=size(datos_m);
%% Formar conjuntos 
pe=floor(0.7*fm2);
pp=pe+1;
entrenamiento=datos_m(1:pe,:);
prueba=datos_m(pp:end,:);
classE=vuln_m(1:pe,:);
classP=vuln_m(pp:end,:);

%% Formar el conjunto de las etiquetas de entrenamiento y prueba
% vulnEc=vuln_mc(1:pe,:);
% vulnPc=vuln_mc(pp:end,:);

%% Permutación
% entrenamiento=[];
% classE=[];
% [fe, ce]=size(entrenamiento1);
% me=randperm(fe);
% for i=1:fe;
%     classE(i,:)=claseE1(me(i),:);
%     entrenamiento(i,:)=entrenamiento1(me(i),:);
% end
% 
% prueba=[];
% classP=[];
% [fp, cp]=size(prueba1);
% mp=randperm(fp);
% for j=1:fp;
%     classP(j,:)=claseP1(mp(j),:);
%     prueba(j,:)=prueba1(mp(j),:);
% end
end
