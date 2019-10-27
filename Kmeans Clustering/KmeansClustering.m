
fprintf('Finding closest centroids.\n\n');

% Load dataset
load('data2.mat');

% Select an initial set of centroids
K = 3;
initial_centroids = [3 3; 6 2; 8 5];

% Find the closest centroids 
idx = findClosestCentroids(X, initial_centroids);

fprintf('Closest centroids for the first 3 examples: \n')
fprintf(' %d', idx(1:3));

fprintf('\nComputing centroids means.\n\n');

%  Compute means based on the closest centroids found in the previous part.
centroids = computeCentroids(X, idx, K);

fprintf('Centroids computed after initial finding of closest centroids: \n')
fprintf(' %f %f \n' , centroids');

fprintf('\nRunning K-Means clustering.\n\n');

% Load an example dataset
load('data2.mat');

% Settings for running K-Means
K = 3;
max_iters = 10;

initial_centroids = [3 3; 6 2; 8 5];

[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true);
fprintf('\nK-Means Done.\n\n');



