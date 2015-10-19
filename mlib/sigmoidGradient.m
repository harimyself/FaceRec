function g = sigmoidGradient(z)
	z_sigmoid = sigmoid(z);
	g = z_sigmoid .* (1 - z_sigmoid);
end
