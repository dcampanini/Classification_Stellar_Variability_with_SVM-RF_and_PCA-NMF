function [H_all,D1,D2,D3,W1,W2,W3] = makeNmf(img1,img2,img3,k,m_ent,std_ent)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[W1,H1,D1] = nnmf(img1',k);
[W2,H2,D2] = nnmf(img2',k);
[W3,H3,D3] = nnmf(img3',k);
H_all=[H1' H2' H3' m_ent std_ent];

end

