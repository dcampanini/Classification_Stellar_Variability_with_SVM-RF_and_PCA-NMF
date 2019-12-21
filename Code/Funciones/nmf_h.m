function [H,error] = nmf_h(V,W,k)

iter=1;
%% Inicializar el algoritmo
[fv,cv]=size(V);
H=rand(k,fv);
%H=W'*V';
factor=1/sqrt(fv*cv);
%%
while iter<=1000
    waitbar(iter/1000);
    iter=iter+1;
    %% Definir la función objetivo
    %fo=factor*norm(V'-(W*H),'fro')

    %% Reglas de actualización
    %fw=(W*H-V)*H';
    %fh=W'*((W*H)-V');
    %% Tamaño del paso
    %H=H.*((W'*V')./(W'*W*H));
    H=max(H,0.001)-(max(H,0.001)/(W'*W*H+0.000001))*W'*(W*H-V');
    
%    alpha=1;beta=0.5;sigma=0.5;    
%     if sigma==0.5 % Aquí la condición con fo
%         alpha=alpha/beta;
%     else
%         alpha=alpha*beta;
%     end
%     H=max(0,H-alpha*fh);
    
end
fo=factor*norm(V'-(W*H),'fro');
error=fo;
end

