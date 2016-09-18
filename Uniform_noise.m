%% This describes the way we have selected the nosie inmodel
clc;close all
clear all;
% now define the true noise model
p = 0.3;
diagonal = 1-p
off_diagonal = (1-diagonal)/10;
mat = zeros(10,10);
mat(:,:) = off_diagonal;
C = single(mat+diagonal*eye(10,10)); % define the 10x10 matrix of noise model
% 
% load('/Users/ishanjindal/Documents/class_proj_docs/matconvnet-1.0-beta18/examples/mnist/lin_weigh50.mat');
load('imdb_actual.mat'); % actual dataset is loaded here
ima = zeros(1,50000);
image_labels = images.labels;

for tt=1:1:10
indxes  = find(image_labels(1:50000) == tt);
for i = 1:5000
%   r(i) = randi(10); % for uniform distribution
%   r(i) = randperm(10,1); 
vect_prob = mnrnd(1,C(tt,:));
r(i) = find(vect_prob==1);

end
% kk = zeros(1,5000-lab);
% kk(:) = tt;
% new_vect = [kk r];
ima(indxes) = r;
% clear r;
end
% new_img = [ima(1:50000), image_labels(50001:60000)];
images.labels = single(ima);
save('imdbUniJ_30%.mat','images','meta');