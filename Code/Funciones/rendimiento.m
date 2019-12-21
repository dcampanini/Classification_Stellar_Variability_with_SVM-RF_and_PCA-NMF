function [FPR,TPR,FNR,TPe,FPe,FNe,TNe] = rendimiento( real, predict )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
TPe=0;FPe=0;FNe=0;TNe=0;
for k=1:length(predict)
    if real(k)==0 && predict(k)==0
        TPe=TPe+1;
    elseif real(k)==1 && predict(k)==0
        FPe=FPe+1;
    elseif real(k)==0 && predict(k)==1
        FNe=FNe+1;
    elseif real(k)==1 && predict(k)==1
        TNe=TNe+1;
    end
end
FPR=FPe/(FPe+TNe);
TPR=TPe/(TPe+FNe);
FNR=FNe/(TPe+FNe);
end

