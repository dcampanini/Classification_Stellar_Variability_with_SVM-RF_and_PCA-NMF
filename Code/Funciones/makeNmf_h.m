function [ P_all,e1,e2,e3] = makeNmf_h(V1,V2,V3,W1,W2,W3,k,m_ent,std_ent)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[P1,e1] = nmf_h(V1,W1,k);
[P2,e2] = nmf_h(V2,W2,k);
[P3,e3] = nmf_h(V3,W3,k);
P_all=[P1' P2' P3' m_ent std_ent];

end

