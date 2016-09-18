%% This describes the way non unoform random Noise is introduced in training dataset
clc;close all;clear all
prob = 0.8;
w = zeros(10,10);
for i=1:1:10
    ran = randfixedsum(9,1,(1-prob),0.002,0.1);
    ind = 0;
    for j=1:1:10
        if i==j
            w(i,j) = prob;
        else
            ind = ind+1;
            w(i,j) = ran(ind);
        end
    end
end
% imagesc(w)
% save('true_dist_rand30.mat','w');
load('imdb_actual.mat'); % load the actual 
ima = zeros(1,50000);
image_labels = images.labels;

for tt=1:1:10
indxes  = find(image_labels(1:50000) == tt);
for i = 1:5000
%   r(i) = randi(10); % for uniform distribution
%   r(i) = randperm(10,1); 
vect_prob = mnrnd(1,w(tt,:));
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
save('imdbRand_20%.mat','images','meta');
