mlib_dir="mlib"
source_images_dir="teach_images"
sample_img_dir="sample_image_bytes"

cd jlib;
java -cp img.jar GetImgBytes $source_images_dir $sample_img_dir

cd ../mlib;

octave Train_Driver.m $sample_img_dir

