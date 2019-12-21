function [H,W,iter] = nmf_hw( V,k)
iter=1;
%% Inicializar el algoritmo
[fv,cv]=size(V);% Para el cnjunto de entrenamiento fv=7000 y cv=441
W=rand(cv,k);
%H=rand(k,fv);
H = W'*V';

%H=W'*V';
factor=1/sqrt(fv*cv);
%%
while iter<=10
    waitbar(iter/1000);
    iter=iter+1;
    %% Definir la función objetivo
    fo=factor*norm(V'-(W*H),'fro')

    %% Reglas de actualización
    %fw=(W*H-V)*H';
    %fh=W'*((W*H)-V');
    %% Tamaño del paso
    %V=entH1;
    
    %Hnew=H.*((W'*V')./(W'*W*H));
    Hnew=max(H,0.001)-(max(H,0.001)/(W'*W*H+0))*W'*(W*H-V');
    %W=W.*((V'*H')./(W*H*H'));
    W=max(W,0.001)-(max(W,0.001)/(W*H*H'+0))*(W*H-V')*H';
    H=Hnew;
    
end
% fo=factor*norm(V'-(W*H),'fro');
% error=fo;


end

