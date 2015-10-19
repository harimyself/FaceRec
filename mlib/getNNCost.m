function [J grad] = getNNCost(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));


X = [ones(m ,1) X];

z2 = X * Theta1';
a2 = sigmoid(z2);

%ouput
a2 = [ones(size(a2, 1), 1), a2];
z3 = a2 * Theta2';
h = sigmoid(z3);


%Create a matrix of output nodes * training size
%Convert earch output to vector to train
yVec = zeros(num_labels, m);
for i = 1:m
	yVec(y(i), i) = 1;
end;

%cost
J = (1/m) * sum(sum((-yVec' .* log(h)) - ((1-yVec)' .* log(1 - h))));

%Regularization
Theta1_with_out_bias = Theta1(:, 2:size(Theta1, 2));
Theta2_with_out_bias = Theta2(:, 2:size(Theta2, 2));

regVal = (lambda/(2*m)) * (sum(sum(Theta1_with_out_bias .^ 2)) + sum(sum(Theta2_with_out_bias .^ 2)));

J = J + regVal;

for train_idx = 1:m
	a_1 = X(train_idx,:)';
    a_1 = [a_1];

    z_2 = Theta1 * a_1;

    a_2 = sigmoid(z_2);
    a_2 = [1; a_2];

    z_3 = Theta2 * a_2;

    a_3 = sigmoid(z_3);
    
	y_train = yVec(:, train_idx);
	
	%Error at final layer
	delta_3 = a_3 - y_train;
	
	delta_2 = (Theta2' * delta_3) .* sigmoidGradient([1; z_2]);
	%remove bias unit
	delta_2 = delta_2(2:end);
	
	dt2 = delta_3 * a_2';
	dt1 = delta_2 * a_1';
	
	%Now adjust theta in all layers
	Theta2_grad = Theta2_grad + dt2;
	Theta1_grad = Theta1_grad + dt1;
    
end


Theta1_grad = (1/m) * Theta1_grad;
Theta2_grad = (1/m) * Theta2_grad;

% Add regularization terms
Theta1_grad(:,2:end) = Theta1_grad(:,2:end) + (lambda/m) * Theta1(:,2:end);
Theta2_grad(:,2:end) = Theta2_grad(:,2:end) + (lambda/m) * Theta2(:,2:end);

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
