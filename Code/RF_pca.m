%%
clear
addpath('Funciones')
load('HiTS2000')
%% Extracción de características con PCA y armado de conjuntos
k=200; % número de componentes seleccionadas
[ H_all,P_all,pH1] = makePca2( entH1,entH2,entHs,pH1,pH2,pHs,k);% Conjunto de entrenamiento
H_all=[H_all m_ent std_ent];
P_all=[P_all m_test std_test];

%% Árbol
nTrees=100;
B=TreeBagger(nTrees,H_all,classE,'Method','classification');
out_pca_ent=B.predict(H_all);
out_pca_ent=str2double(out_pca_ent);

out_pca_test=B.predict(P_all);
out_pca_test=str2double(out_pca_test);


%% Cálculo de FPR y TPR
[FPRe,TPRe,FNRe,TPe,FPe,FNe,TNe] = rendimiento( classE, out_pca_ent);
[FPRt,TPRt,FNRt,TPp,FPp,FNp,TNp] = rendimiento( classP, out_pca_test);

%% Guardar datos
% H_all_pca_rfK200=H_all;
% P_all_pca_rfK200=P_all;
% save('Resultados\RandomForest\pca\matriz_k200_pca_rf.mat',...
%             'FPRe','TPRe','FNRe','TPe',...
%             'FPe','FNe','TNe','FPRt','TPRt','FNRt',...
%             'TPp','FPp','FNp','TNp');        
% save('Resultados\RandomForest\caract_pca_rf\caractc_k200_pca_rf.mat',...
%     'H_all_pca_rfK200','P_all_pca_rfK200');
