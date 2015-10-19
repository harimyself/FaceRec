input_args = cellstr(argv ());

Theta1 = load('Theta1.mat');
Theta2 = load('Theta2.mat');

X = load(["../" input_args{1} "/ImgByteFile"]);

pred = predict(Theta1, Theta2, X);

mapping_file =  fopen(["../" input_args{2} "/yFileMappping"], "r");
fskipl(mapping_file, pred-1);
disp(fscanf(mapping_file,"%s", 1));