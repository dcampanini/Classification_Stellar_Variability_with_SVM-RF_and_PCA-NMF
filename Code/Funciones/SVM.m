%clear all 
%close all
%load('base_de_datos_tarea_3')
%p=6;% Número que se desea detectar, corresponderá a la clase 1

%[entrenamiento,prueba,claseE,claseP,claseE2,claseP2]=conjuntos2( classes,features,p );

% Entrenamiento
%svmStruct=svmtrain(entrenamiento,classE,'Kernel_Function','rbf','BoxConstraint',1,'method','LS','RBF_Sigma',2);
entrenamiento=H_all;
prueba=P_all;
svmStruct=svmtrain(entrenamiento,classE,'KernelFunction','rbf','BoxConstraint',1,'ClassName',[1,0],'KernelScale',2);


% Cambio de bias
b=svmStruct.Bias;
deltaB=b-2:0.05:b+2;

TPe=zeros(length(deltaB),1);
FPe=zeros(length(deltaB),1);
FNe=zeros(length(deltaB),1);
TNe=zeros(length(deltaB),1);

TPp=zeros(length(deltaB),1);
FPp=zeros(length(deltaB),1);
FNp=zeros(length(deltaB),1);
TNp=zeros(length(deltaB),1);



for i=1:length(deltaB)
    waitbar(i/length(deltaB))
    svmStruct.Bias=deltaB(i);
    salidaE=svmclassify(svmStruct,entrenamiento);
    salidaT=svmclassify(svmStruct,prueba);
    % Cálculos conjunto entrenamiento
    for k=1:length(classE)
        if classE(k)==0 && salidaE(k)==0
            TPe(i)=TPe(i)+1;
        elseif classE(k)==1 && salidaE(k)==0
            FPe(i)=FPe(i)+1;
        elseif classE(k)==0 && salidaE(k)==1
            FNe(i)=FNe(i)+1;
        elseif classE(k)==1 && salidaE(k)==1
            TNe(i)=TNe(i)+1;
        end
    end
    %Cálculos conjunto prueba
    for j=1:length(classP)
        if classP(j)==0 && salidaT(j)==0
            TPp(i)=TPp(i)+1;
        end
        if classP(j)==1 && salidaT(j)==0
            FPp(i)=FPp(i)+1;
        end
        if classP(j)==0 && salidaT(j)==1
            FNp(i)=FNp(i)+1;
        end
        if classP(j)==1 && salidaT(j)==1
            TNp(i)=TNp(i)+1;
        end
    end
end

%% ROC entrenamiento y prueba
hold on
FPRe=FPe./(FPe+TNe);
TPRe=TPe./(TPe+FNe);
plot(FPRe,TPRe,'linewidth',2)

FPRp=FPp./(FPp+TNp);
TPRp=TPp./(TPp+FNp);
plot(FPRp,TPRp,'r','linewidth',2)

set(gca,'Ylim',[0 1.1])
set(gca,'Xlim',[-0.01 0.14])
title('Curva ROC Kernel Gaussiano C=1 y Sigma=5','FontSize',14)
xlabel('Tasa de Falsos Positivos','fontsize',14)
ylabel('Tasa de Verdareros Positivos','fontsize',14)
legend('Curva ROC Entrenamineto','Curva ROC Prueba')

   
    
    
    
    