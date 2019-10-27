function Z = projectData(X, U, K)
%   computes the projection of the normalized inputs X into 
%	the reduced dimensional space spanned by the first K columns of U.
%

Z = zeros(size(X, 1), K);

U_reduce = U(:, 1:K);

Z = X * U_reduce;

end
