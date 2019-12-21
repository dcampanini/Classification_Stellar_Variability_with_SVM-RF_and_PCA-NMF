load('HiTSall','imdata','clases')
% Formar y reducir conjuntos
por=0.2;% por=0.1 => se va a trabajar con el 10% de los datos
[entrenamiento,prueba,classE,classP]=conjuntosReduct(clases,imdata,por);
[ m_ent,std_ent ] = standar( entrenamiento,441);
[ m_test,std_test ] = standar( prueba,441);
[ entH1,entH2,entHs] = normImg( entrenamiento,441);
[ pH1,pH2,pHs] = normImg( prueba,441);

%%
clear
addpath('Funciones')
load('HiTS2000')
%%  Extracción de características con NMF
k=200;% filas matriz de coeficientes
[H_all,D1,D2,D3,W1,W2,W3] = makeNmf(entH1,entH2,entHs,k,m_ent,std_ent);
[P_all,e1,e2,e3] = makeNmf_h(pH1,pH2,pHs,W1,W2,W3,k,m_test,std_test);


%% Árbol
nTrees=100;
B=TreeBagger(nTrees,H_all,classE,'Method','classification');
out_nmf_ent=B.predict(H_all);
out_nmf_ent=str2double(out_nmf_ent);

out_nmf_test=B.predict(P_all);
out_nmf_test=str2double(out_nmf_test);


%% Cálculo de FPR y TPR
[FPRe,TPRe,FNRe,TPe,FPe,FNe,TNe] = rendimiento( classE, out_nmf_ent );
[FPRt,TPRt,FNRt,TPp,FPp,FNp,TNp] = rendimiento( classP, out_nmf_test );


%% Guardar datos
% H_all_nmf_rfK200=H_all;
% P_all_nmf_rfK200=P_all;
% save('Resultados\RandomForest\nmf\matriz_k200_nmf_rf.mat',...
%             'FPRe','TPRe','FNRe','TPe',...
%             'FPe','FNe','TNe','FPRt','TPRt','FNRt',...
%             'TPp','FPp','FNp','TNp');        
% save('Resultados\RandomForest\caract_nmf_rf\caractc_k200_nmf_rf.mat',...
%     'H_all_nmf_rfK200','P_all_nmf_rfK200');



