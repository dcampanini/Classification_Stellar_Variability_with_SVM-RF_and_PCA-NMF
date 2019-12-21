clear all 
close all
load('HiTSall','imdata','clases')
Formar y reducir conjuntos
por=0.1;% por=0.1 => se va a trabajar con el 10% de los datos
[entrenamiento,prueba,classE,classP]=conjuntosReduct(clases,imdata,por);
%
[ m_ent,std_ent ] = standar( entrenamiento,441);
[ m_test,std_test ] = standar( prueba,441);
[ entH1,entH2,entHs] = normImg( entrenamiento,441);
[ pH1,pH2,pHs] = normImg( prueba,441);

%%
clear
addpath('Funciones')
load('HiTS2000')

%% Extracci�n de caracter�sticas con PCA y armado de conjuntos
k=10; % n�mero de componentes seleccionadas
[ H_all,P_all,pH1] = makePca2( entH1,entH2,entHs,pH1,pH2,pHs,k);% Conjunto de entrenamiento
H_all=[H_all m_ent std_ent];
P_all=[P_all m_test std_test];
%[ P_all] = makePca2( pH1,pH2,pHs,k);% COnjunto de Prueba

%% Entrenamiento
svmStruct=fitcsvm(H_all,classE,'Holdout',0.15,'KernelFunction','rbf','BoxConstraint',10,'ClassName',[1,0],'KernelScale',2);

%% C�lculo clase de salida
CompactSVMModel = svmStruct.Trained{1};
%%
out_ent = predict(CompactSVMModel,H_all);% Clasificaci�n con conjunto de entrenamiento
out_test = predict(CompactSVMModel,P_all);% Clasifiaci�n con conj de test
[FPRe,TPRe,FNRe,TPe,FPe,FNe,TNe] = rendimiento( classE, out_ent);
[FPRt,TPRt,FNRt,TPp,FPp,FNp,TNp] = rendimiento( classP, out_test);

%% Guardar Datos
%savepath1=strcat('C:\Users\Campanini\Documents\Cursos 2015-2\Redes Neuronales y Teor�a de la Informaci�n para el Aprendizaje\Proyecto\Clasificaci�n de Estrellas Variable usando NMF y PCA\HiTS_data\Resultados\pca');
%saveas(1,[savepath1 'matriz'  num2str(k) 'FPRt' 'TPRt' '.dat']);

% save('Resultados\pca\matriz_k200.mat' ,'FPRe','TPRe','FNRe','TPe',...
%             'FPe','FNe','TNe','FPRt','TPRt','FNRt',...
%             'TPp','FPp','FNp','TNp');
% save('Resultados\caract_pca\caractc_k200.mat' , 'H_all' ,'P_all');
