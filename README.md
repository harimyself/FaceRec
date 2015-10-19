# TellMeWho
This applicaiton can be trained very easily to find the best match for an image. Follow the steps below to train your own version.

1. Downlaod the code base from git hub.
2. Takes sample faces of your freids in different dimentions(Only faces).
3. Make sure at least 6-10 samples are there for each face.
4. Name all these images files with prefix as their name. Then seperate the index of the file with "-"
For example, if name of you friend is John and you have 9 sample of his image. Then name the files as "John-1.png", "John-2.jpg",...,"John-9.png". Please make sure use only images with extension ".png" or ".jpg" for this version.
5. Copy these smaples to "teach_images" folder.
6. Run the script "train.sh". This should finish your app training. Isn't simple? :)

Now place the image of the face you want to recoginze under "guess_image" folder.
Run the "guess.sh" to get the result. Just give it a try and have fun :)

Prerequisites:
Octave/Matlab needs to be installed.
