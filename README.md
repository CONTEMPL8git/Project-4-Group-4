# Heart Disease Prediction Models [Project-4-Group-4]

# Contributors
[Blake Sandvick](https://github.com/BlakeSandvick)<br>
[Christopher Loch](https://github.com/CONTEMPL8git)<br>
[Eric Zhou](https://github.com/zhou0366)<br>
[Wanderson Oliveira](https://github.com/wwoliver7)<br>

# Introduction
Our group did data cleaning / ETL on a heart disease dataset called ["Indicators of Heart Disease (2022 UPDATE)"](https://www.kaggle.com/datasets/kamilpytlak/personal-key-indicators-of-heart-disease) and then created an ERD / schema and used that to make an SQL database. We added a new column for PatientID and used that as the primary key. We then proceeded to use several different machine learning models to analyze the data, do predictions, and determine precision, recall, F1, and overall accuracy.






## Supervised Learning: Logistical Regression
Trial 1: lbfgs, no weight

The initial trial of the logistic reaction uses lbfgs. The resulting model’s confusion matrix indicates that it generally classifies most patients as not having heart disease. While this means the model is correct with most patients who did not have heart disease, most patients who did have heart disease were incorrectly predicted as not having heart disease by the model.  

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/2a786015-2491-4ac6-b6f4-4b339fbff01e)

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/4b31ac3d-92a0-493a-ae1e-625e5e3d8bbb)


Trial 2: lbfgs, 1:10 weight

Here, we can see that this class weight is overcompensating for the distribution of the test data. While the model is 100% accurate in predicting no heart disease, it was only able to predict one case of having heart disease. This results in a precision of 1.0 for having a heart attack but near 0 recall in having a heart attack which indicates a very high rate of false negatives.

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/42ec6447-3408-4947-b033-f2d8f34e2352)

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/890d4b75-1060-45fb-aa89-c08d0c5a5a93)


Trial 3: lbfgs, 1:5 weight

By reducing the weight of the positive training data, we can see that the recall of predicted heart disease patients is improved insignificantly. There is still a high rate of false negatives.

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/cf65a8d9-7c87-4262-b914-06e8fc8abc03)

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/6c6ff302-3bc0-4d94-b967-8de8e1a784fa)

 
Trial 4: newton-cg

When trying out other solvers such as newton cg resulted in roughly the same or worse outcomes. Newton cg is pictured below.

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/e645f71d-f824-40f5-b9a6-cdc0c3a9f3fb)

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/082a1d11-2d28-448e-afe4-47a4c7312810)

 
Trial 5: lbfgs, ‘balanced’ weight

By setting class weight to ‘balanced’, the solver automatically adjusts the weight. Here, the results shown in confusion matrix and classification report are the best out of all the trial models.
The resulting model displays 97% precision and 75% recall when predicting that patients have no heart disease. The recall is lower since many patients who did not have heart disease were predicted by the model to have heart disease. While not ideal, false positives are less damaging than false negatives in this scenario.
The model also displays 22% precision and 77% recall for predicting that patients have heart disease. While the precision is significantly lower, this is acceptable as the training data is highly imbalanced towards patients with no heart disease. As a result, this logistical regression model allows some false positives for fewer patients receiving false negatives. Overall, most positive identifications by the model are incorrect (22%), but the rate at which the model gives a negative identification is much higher (97%).

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/4c28048b-0307-46ce-9040-f6a6e7170e0a)

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/bfc2040a-048f-49da-9d92-be3df6351358)

 
Trial 6: lbfgs, ‘balanced’ weight, oversampling
Oversampling was applied to the data to balance the data going into the linear regression model’s training. In this case, the results are much more balanced but are only about 76% accurate. Another supervised learning model could be attempted after this.
Imbalanced learning module:
https://www.geeksforgeeks.org/imbalanced-learn-module-in-python/

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/b26c8ec4-0025-44f9-adab-a30572d63ca7)

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/be950967-521d-437a-b976-c223ac264a1b)

 
Retrieving coefficients of the model and plotting them for each column, we can show the level of importance for each feature. Chest scan, Sex, and having a stroke were the highest coefficients. Note that these do not necessarily indicate high correlation or causation.
 
![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/ab4414ec-30bf-408d-aae3-225ddbfce349)

## Supervised Learning: Random Forest

When running the random forest, the skewing of the data towards patients without heart disease caused poor performance from the initial model once again. Like the logistical regression, the class weight and oversampler were applied to the data set to balance the training data to be more even. We can see that this model has the best performance overall across all metrics of precision and recall. 

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/b53cc200-6c9b-458c-b8e2-bed526c64d5a)

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/c988d895-15fb-4790-80bd-269895e7e439)

Age category, weight, state, chest scan, and general health are the most important features of the model. Note that these do not necessarily indicate high correlation or causation.

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/5c19d28f-1faf-4585-8988-aaee51a7104b)
