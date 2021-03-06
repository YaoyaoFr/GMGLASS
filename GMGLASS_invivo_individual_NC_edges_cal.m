% Reference: The Matlab code is based on the following paper:
%            Xiaoyun Liang, David N. Vaughan, Alan Connelly, Fernando Calamante. A novel
%            group-fused sparse partial correlation method for simultaneous
%            estimation of functional networks.in group comparison studies. Brain Topography, 12/2017; DOI:10.1007/s10548-017-0615-6.
%
% Copyright 2017 Florey Institute of Neuroscience and Mental Health, Melbourne, Australia
% Written by Xiaoyun Liang (Email: x.liang@brain.org.au)
% This software is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied  
% warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 

%%
%%% Calculating number of edges for each subject of NC group

%%
clear all
load('.../I1_FMGL_GGL_SS200_50_invivo_individual_rand_200_NC2016.mat')
Y=I2NC;
Y1_reshape=reshape(Y(:,:,1,:,:,:),90,90,100,50); %just an example for the first subject here
% Y2_reshape=reshape(Y2,78,78,100,50);
for i=1:90
    for j=1:90
        for k=1:100
            for l=1:50
                if Y1_reshape(i,j,k,l)<0
                    Y1_reshape(i,j,k,l)=1;
                else
                    Y1_reshape(i,j,k,l)=0;
                end
            end
        end
    end
       Y1_reshape(i,i,:,:)=0;
%     Y2_reshape(i,i,:,:)=0;
end

for i=1:100
    for j=1:50
        edges1(i,j)=nnz(Y1_reshape(:,:,i,j))/2;
%         edges2(i,j)=nnz(Y2_reshape(:,:,i,j))/2;
    end
end

mean_edges1=mean(edges1,1);
% mean_edges2=mean(edges2,1);
mean_all1=mean(mean_edges1);
% mean_all2=mean(mean_edges2);



