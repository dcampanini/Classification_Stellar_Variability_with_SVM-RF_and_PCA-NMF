%%
clear
addpath('Resultados\caract_nmf')
addpath('Resultados\caract_pca')
addpath('Funciones')
load('caractc_k10')
load('caractc_k10_pca')
load('HiTS2000','classE','classP')
% k=1,10, 20, 50 , 100, 200

%% Entrenamiento
H_join1=[H_all_pca(:,1:10) H_all(:,1:10)];
P_join1=[P_all_pca(:,1:10) P_all(:,1:10)];
svmStruct=fitcsvm(H_join1,classE,'Holdout',0.15,'KernelFunction','rbf','BoxConstraint',1,'ClassName',[1,0],'KernelScale',2);

%% Cálculo clase de salida
CompactSVMModel = svmStruct.Trained{1};

%%
out_ent = predict(CompactSVMModel,H_join1);% Clasificación con conjunto de entrenamiento
out_test = predict(CompactSVMModel,P_join1);% Clasifiación con conj de test
[FPRe,TPRe,FNRe,TPe,FPe,FNe,TNe] = rendimiento( classE, out_ent);
[FPRt,TPRt,FNRt,TPp,FPp,FNp,TNp] = rendimiento( classP, out_test);

%% Guardar datos
save('Resultados\join\matriz_k10_join.mat' ,'FPRe','TPRe','FNRe','TPe',...
             'FPe','FNe','TNe','FPRt','TPRt','FNRt',...
             'TPp','FPp','FNp','TNp');
save('Resultados\caract_join\caractc_k10_join.mat' , 'H_join1' ,'P_join1');
