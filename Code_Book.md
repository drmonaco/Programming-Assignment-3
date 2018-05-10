Variables 


activity_labels = Labels for the different activities and the numbers they correspond to
features = Labels for the different measurement types and the number key they correspond to

subject_test = The subject id matrix for the training set
X_test = The actual measurements from the test data set
y_test = The type of activity that correlates with the measurements from X_test for a given row
subject_train = The subject id matrix for the training set
X_train = The actual measurements from the train data set
y_train = The type of activity that correlates with the measurements from X_train for a given row

fulldata = The combined matrix of the test and training data sets with subject adn activity IDs


fulldata_subject = The melted matrix of merged training and test data with columns detailing ID, activity, measurement and single value
fulldata_mean = The  matrix of merged training and test data with columns detailing ID, activity, measurement and single value with all replicates of a row averaged

