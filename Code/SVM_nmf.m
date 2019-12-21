%clear all
%close all
load('HiTSall','imdata','clases')
% Formar y reducir conjuntos
por=0.1;% por=0.1 => se va a trabajar con el 10% de los datos
[entrenamiento,prueba,classE,classP]=conjuntosReduct(clases,imdata,por);
[ m_ent,std_ent ] = standar( entrenamiento,441);
[ m_test,std_test ] = standar( prueba,441);
[ entH1,entH2,entHs] = normImg( entrenamiento,441);
[ pH1,pH2,pHs] = normImg( prueba,441);

%%
clear
addpath('Funciones')
load('HiTS2000')
% %% Extracción de características con NMF
k=10;% filas matriz de coeficientes
[H_all,D1,D2,D3,W1,W2,W3] = makeNmf(entH1,entH2,entHs,k,m_ent,std_ent);
[P_all,e1,e2,e3] = makeNmf_h(pH1,pH2,pHs,W1,W2,W3,k,m_test,std_test);

%% Entrenamiento
svmStruct=fitcsvm(H_all,classE,'Holdout',0.15,'KernelFunction','rbf','BoxConstraint',0.1,'ClassName',[1,0],'KernelScale',0.5);

%% Cálculo clase de salida
CompactSVMModel = svmStruct.Trained{1};

%% 
out_nmf_ent = predict(CompactSVMModel,H_all);% Predicción (clasificación) para
                                             % el conjunto de 
out_nmf_test = predict(CompactSVMModel,P_all);% Predicción (clasificación) para
                                             % el conjunto de 
%% Cálculo de FPR y TPR
[FPRe,TPRe,FNRe,TPe,FPe,FNe,TNe] = rendimiento( classE, out_nmf_ent );
[FPRt,TPRt,FNRt,TPp,FPp,FNp,TNp] = rendimiento( classP, out_nmf_test );

%% Guardar datos

% save('Resultados\nmf\matriz_k200.mat' ,'FPRe','TPRe','FNRe','TPe',...
%             'FPe','FNe','TNe','FPRt','TPRt','FNRt',...
%             'TPp','FPp','FNp','TNp');
% save('Resultados\caract_nmf\caractc_k200.mat' , 'H_all' ,'P_all');



