function [U, S] = pca(X)
% pca(X) computes eigenvectors of the covariance matrix of X
% Returns the eigenvectors U, the eigenvalues (on diagonal) in S

[m, n] = size(X);
U = zeros(n);
S = zeros(n);

sigma = 1/m * (X' * X);

[U, S, V] = svd(sigma);

end
