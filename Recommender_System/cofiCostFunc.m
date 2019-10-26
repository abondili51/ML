function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));



J = 1/2 * sum(sum((((X * Theta') .- Y).^2) .* R));

X_grad = (((X * Theta') .- Y) .* R) * Theta;
Theta_grad = (((X * Theta') .- Y) .* R)' * X;

%Regularization Value
RegVal = lambda/2 * ( sum(sum(Theta.^2)) + sum(sum(X.^2)) );

J = J + RegVal;

%regularization 
X_grad = X_grad + (lambda * X);
Theta_grad = Theta_grad + (lambda * Theta);

% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
