%%
% clear
% addpath('Resultados\RandomForest\caract_nmf_rf')
% addpath('Resultados\RandomForest\caract_pca_rf')
% addpath('Funciones')
% load('HiTS2000','classE','classP')
% load('caractc_k20_nmf_rf','H_all_nmf_rfK20','P_all_nmf_rfK20')
% load('caractc_k20_pca_rf','H_all_pca_rfK20','P_all_pca_rfK20')

%% Conjuntos

% Solo la componentes (todas)
H_join1=[H_all_pca_rfK20(:,1:66) H_all_nmf_rfK20(:,1:66)];
P_join1=[P_all_pca_rfK20(:,1:66) P_all_nmf_rfK20(:,1:66)];


% 5 primeras componentes
% H_join1=[H_all_pca_rfK20(:,1:5) H_all_pca_rfK20(:,11:15)...
%     H_all_pca_rfK20(:,21:25) H_all_nmf_rfK20(:,1:5)...
%     H_all_nmf_rfK20(:,11:15) H_all_nmf_rfK20(:,21:25)];
% 
% P_join1=[P_all_pca_rfK20(:,1:5) P_all_pca_rfK20(:,11:15)...
%     P_all_pca_rfK20(:,21:25)  P_all_nmf_rfK20(:,1:5)...
%     P_all_nmf_rfK20(:,11:15) P_all_nmf_rfK20(:,21:25)];


% 5 primeras componentes + media y varianza
% H_join1=[H_all_pca_rfK20(:,1:5) H_all_pca_rfK20(:,11:15)...
%     H_all_pca_rfK20(:,21:25) H_all_nmf_rfK20(:,1:5)...
%     H_all_nmf_rfK20(:,11:15) H_all_nmf_rfK20(:,21:25) ...
%     H_all_pca_rfK20(:,31:36) H_all_nmf_rfK20(:,31:36)];
% 
% P_join1=[P_all_pca_rfK20(:,1:5) P_all_pca_rfK20(:,11:15)...
%     P_all_pca_rfK20(:,21:25)  P_all_nmf_rfK20(:,1:5)...
%     P_all_nmf_rfK20(:,11:15) P_all_nmf_rfK20(:,21:25)...
%     P_all_pca_rfK20(:,31:36) P_all_nmf_rfK20(:,31:36)];

% Árbol
nTrees=100;
B=TreeBagger(nTrees,H_join1,classE,'Method','classification');
out_join_ent=B.predict(H_join1);
out_join_ent=str2double(out_join_ent);

out_join_test=B.predict(P_join1);
out_join_test=str2double(out_join_test);


% Cálculo de FPR y TPR
[FPRe,TPRe,FNRe,TPe,FPe,FNe,TNe] = rendimiento( classE, out_join_ent );
[FPRt,TPRt,FNRt,TPp,FPp,FNp,TNp] = rendimiento( classP, out_join_test );
