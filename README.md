# Classification Stellar Variability with SVM or RF and PCA and/or NMF

The work consist in classify images from the High Cadence Transient Survey (HiTS) project, that is trying to find transient event that occurs during the first instants of a supernova.

The dataset has 100.000 samples with 3 images from each samples, the size of these images is 21x21. The two classes of images to classify are: transient candidates associated to stellar variability (true or positive class) and transient candidates associated to cosmic rays, and artifacts (false or negative class). The next figure shows examples of negative and positive class.

![Captura de pantalla (33)](https://user-images.githubusercontent.com/19544865/71312696-8b177800-240c-11ea-9253-c4c262995191.png)

# Classification of de samples

The methodology used to classify the samples is as follo:
1) Transform the 3 images in one vector of dimension 3x21x21=1323
2) Extract features of these vector with PCA and NMF
3) Train a SVM and a Random Forest classifier to determinate the class of a sample of test.


# Results

The best result was with Random Forest using features from PCA and NMF simultaneously, plus the mean  and the standard desviation of each vector, with these configuration the True Positive Rate was equal to 99.32% and the False Positive Rate was equal to 1.12%
