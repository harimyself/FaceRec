mlib_dir="mlib"
guess_image_dir="guess_image"
sample_img_dir="sample_image_bytes"

cd jlib;
java -cp img.jar GetImgBytes $guess_image_dir $guess_image_dir

cd ../mlib;
octave guess_sample.m $guess_image_dir $sample_img_dir