function [ H_all,P_all,pH1] = makePca2( entH1,entH2,entHs,pH1,pH2,pHs,k)
% Realiza PCA a las tres imágenes y luego
% arma el conjunto de características H_all
[coeffH1]= pca(entH1);
[coeffH2]= pca(entH2);
[coeffHs]= pca(entHs);
pH1=pH1*coeffH1(:,1:k);pH2=pH2*coeffH2(:,1:k);pHs=pHs*coeffHs(:,1:k);
%H1=scoreH1(:,1:k);H2=scoreH2(:,1:k);Hs=scoreHs(:,1:k);
H1=entH1*coeffH1(:,1:k);H2=entH2*coeffH2(:,1:k);Hs=entHs*coeffHs(:,1:k);
H_all=[H1 H2 Hs];
P_all=[pH1 pH2 pHs];
end

