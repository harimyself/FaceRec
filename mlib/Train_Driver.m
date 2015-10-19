ip_layer_size  = 2500;
hid_lyr_size = 300;
num_labels = 3;

no_of_iteratios = 350;

input_args = cellstr(argv ());

X = load(["../" input_args{1} "/ImgByteFile"]);
y = load(["../" input_args{1} "/yFile"]);

m = size(X, 1);

initial_Theta1 = initWeights(ip_layer_size, hid_lyr_size);
initial_Theta2 = initWeights(hid_lyr_size, num_labels);

initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

lambda = 1;

costFunction = @(p) getNNCost(p, ...
                            ip_layer_size, ...
                            hid_lyr_size, ...
                            num_labels, X, y, lambda);

options = optimset('MaxIter', no_of_iteratios);
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);


Theta1 = reshape(nn_params(1:hid_lyr_size * (ip_layer_size + 1)), ...
                 hid_lyr_size, (ip_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hid_lyr_size * (ip_layer_size + 1))):end), ...
                 num_labels, (hid_lyr_size + 1));

pred = predict(Theta1, Theta2, X);

save -ascii Theta1.mat Theta1
save -ascii Theta2.mat Theta2