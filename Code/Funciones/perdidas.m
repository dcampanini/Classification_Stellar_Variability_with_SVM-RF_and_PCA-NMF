%% Datos clasificados de forma incorrecta

CVSVMModel = crossval(svmStruct);
classLoss = kfoldLoss(CVSVMModel)