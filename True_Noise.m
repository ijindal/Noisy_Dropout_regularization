%% to calculate the true noise distribution
clc; clear all; close all
load('imdb_actual.mat') % load correct image labels
correct_lab = single(images.labels);
load('imdb.mat') % load incorrect labels
incorrect_lab = single(images.labels);
 
C = (confusionmat(correct_lab,incorrect_lab)/5000);
figure(), imagesc(C)
