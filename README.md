# Discriminating Variable Star Candidates using SVM/RF and PCA/NMF.

This work classifies images from the High Cadence Transient Survey (HiTS) project, which tries to find a transient event that occurs during the first instants of a supernova.

The dataset has 100,000 samples with 3 images from each sample; the sizes of these images are 21x21. The two classes of images to classify are: transient candidates associated with stellar variability (true or positive class) and transient candidates associated with cosmic rays and artifacts (false or negative class). The next figure shows examples of the negative and positive classes

![Captura de pantalla (33)](https://user-images.githubusercontent.com/19544865/71312696-8b177800-240c-11ea-9253-c4c262995191.png)

# Classification of samples

The methodology employed to classify the samples is as follows:
1) Transform the 3 images into one vector of dimension 3x21x21=1323
2) Extract features of this vector with PCA and NMF
3) Train an SVM and a Random Forest classifier to determine the class of a sample of test.


# Results

The best result was with Random Forest using features from PCA and NMF simultaneously, plus the mean and the standard deviation of each vector. With this configuration, the True Positive Rate was equal to 99.32% and the False Positive Rate was equal to 1.12%
