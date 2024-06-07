# Heart Disease Prediction Models [Project-4-Group-4]

# Contributors
[Blake Sandvick](https://github.com/BlakeSandvick)<br>
[Christopher Loch](https://github.com/CONTEMPL8git)<br>
[Eric Zhou](https://github.com/zhou0366)<br>
[Wanderson Oliveira](https://github.com/wwoliver7)<br>

# Introduction
Our group did data cleaning / ETL on a heart disease dataset called ["Indicators of Heart Disease (2022 UPDATE)"](https://www.kaggle.com/datasets/kamilpytlak/personal-key-indicators-of-heart-disease) and then created an ERD / schema and used that to make an SQL database. We added a new column for PatientID and used that as the primary key. We then proceeded to use several different machine learning models to analyze the data, do predictions, and determine precision, recall, F1, and overall accuracy.


# What this Repository Contains
These are the contents of our repository:<br>

• README.md - Our readme file<br>
• .gitignore - Our gitignore file<br>
• ETL_code.ipynb<br>
• K-Means and Cluster Results Code ( Wanderson Oliveira).ipynb<br>
• logistic_regression_trial_1.ipynb<br>
• logistic_regression_trial_2.ipynb<br>
• logistic_regression_trial_3.ipynb<br>
• logistic_regression_trial_4.ipynb<br>
• logistic_regression_trial_5.ipynb<br>
• logistic_regression_trial_6.ipynb<br>
• neural_net.ipynb<br>
• random_forest.ipynb<br>
• unsupervised_learning.ipynb<br>
• ERD / Schema file and screenshot<br>
• SQL screenshots for table creation and SELECT * query<br>
• QuickDBD-export.sql<br>
• Heart_Disease_2022_Analysis.sql<br>
• Resources - The original dataset we used, as a csv file<br>
• New csv files after replaced non-numeric values and cleaned up<br>
• Images and visualizations<br>


# About The Data
The dataset ...

# Importing and Cleaning
We downloaded the dataset csv file and used pandas on it in a jupyter notebook. This allowed us to easily view the data and see how it was structured. We also used pyjanitor, a library that allowed multiple data cleaning functions to be performed with fewer lines of code.
Our data cleaning included:
Dropping BMI...
Converting categorical data to integers...
We created a new csv titled Patient_Data...

# Designing the ERD and Database Schema
Our ERD only has one table because of how our dataset ....
Patient id is the primary key because it touches all of the other columns and is a unique identifier. We created patient id for this reason, as it did not exist in the dataset. We had to redo the ERD several times because various of the columns had numbers that were actually floats even though they had looked as if they were integers. We ran a dtype in our notebook to figure out for sure what data type each column was and then made sure that we assigned them that in the ERD, and that took care of it. We probably should have done this in the first place.<br>

<img width="566" alt="ERD creation screen in quick DBD" src="https://github.com/CONTEMPL8git/Project-4-Group-4/assets/153468339/67d04f82-2446-4690-bc8c-becdf8208a93"><br>

# Importing the Data into PostgreSQL
Once we had the proper ERD created, we created the table in Postgres and linked the csv file to it successfully and then we did SELECT * of it to demonstrate that the database and table are created and working properly.<br>
<img width="954" alt="Screenshot 2024-06-03 202212" src="https://github.com/CONTEMPL8git/Project-4-Group-4/assets/153468339/e49efbf6-8580-4e26-8585-e50e2998cffb"><br>
<br>
<img width="953" alt="Screenshot 2024-06-03 202325" src="https://github.com/CONTEMPL8git/Project-4-Group-4/assets/153468339/2e940c17-9480-4831-afac-0326f3a5d865"><br>
<br>



# Getting to Know Our Dataset via Some Initial Visualizations
We created some visualizations in Tableau to show how some of the demographics relate to having a heart attack or not. First, we looked at BMI vs. Had Heart Attack and it does show that a higher BMI does lead to higher liklihood of having a heart attack, but not by a huge amount. However the nature of our dataset which has a lot more people who did not have heart attacks has likely skewed that and made it show up as less correlated to having a heart attack than BMI actually is.
Second, we looked at smoker status. There are four different groups within this: current smoker who now smokes every day, current smoker who smokes only some days, former smoker, and never smoked. As expected, even this dataset that has overrepresentation of people who have not had a heart attack still shows that the more people smoke are more likely to have had a heart attack, and even former smokers are more likely to have had a heart attack than people who have never smoked.<br>
<br>

![Smoker-Status-Viz-final](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/153468339/2e66d37b-feb2-4972-9f2f-329beb8083f4)<br>
<br>

![BMI-Viz-final](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/153468339/1769fd5d-75c0-431c-a6f7-3ebf6e1661ed)<br>
<br>
[Link to our Tableau Public page: https://public.tableau.com/app/profile/christopher.loch/viz/Project4FINAL_17177226678500/Smokervs_Non-smoker?publish=yes]
<br>

# Supervised Learning: Logistical Regression
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

# Supervised Learning: Random Forest

When running the random forest, the skewing of the data towards patients without heart disease caused poor performance from the initial model once again. Like the logistical regression, the class weight and oversampler were applied to the data set to balance the training data to be more even. We can see that this model has the best performance overall across all metrics of precision and recall. 

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/b53cc200-6c9b-458c-b8e2-bed526c64d5a)

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/c988d895-15fb-4790-80bd-269895e7e439)

Age category, weight, state, chest scan, and general health are the most important features of the model. Note that these do not necessarily indicate high correlation or causation.

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/5c19d28f-1faf-4585-8988-aaee51a7104b)


 # Plotting Elbow curve To find the optimal K value for the dataset:

When determining K-Means value for Elbow curve many factors was taken into consideration in the dataset, however , number 3 was the optimal number for representing the model. Beyond number 3, Inertia still decreased, however not in a drastically way as observed when K-Means values is less than 3.


![Elbow Curve](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/152826034/00ed9212-67e3-4e35-a959-90f1304da7a1)



# K-Means cluster results :

With this method, we could notice that clusters have more similarities and do have one of the parameters in common. Another observation in the results is that majority of red clusters(N1) are concentrated  on the right side of the graphic, which corrrelates to having heart attack, meaning that K-Means clustering algorithm is more inclined to reflecting true versus false results.



![Clusters results](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/152826034/e63cc57b-da37-4a1e-9386-c82cebac2c31)






# Neural Network

We created a Keras Sequential model, added the layers, and trained the model for predicting if someone has heart disease

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/blob/main/images/Neural-Network-Setup.png)

After training the model we printed out the following visualizations

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/blob/main/images/Loss-graph.png)


![image](https://github.com/CONTEMPL8git/Project-4-Group-4/blob/main/images/Accuracy-graph.png)

Looking at the loss visualization we noticed that we were losing a quarter of our resources that we were training. That made us look closer at the data set when we noticed that our data is heavily skewed towards patients that don't have heart disease. We then decided to check a confusion matrix and class report.

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/blob/main/images/Neural-Network-confusion.png)

We noticed that we were getting a lot of false negatives, if we had more time we would have done some research into oversampling. With the model where it is we decided it isn't an accurate predictor of whether a patient has heart disease or not.


# References
*Presentation slide image: Image provided by Microsoft Co-Pilot generative ai<br>
*Python Pandas replace multiple columns zero to Nan  https://stackoverflow.com/questions/45416684/python-pandas-replace-multiple-columns-zero-to-nan<br>
*We used Microsoft Co-Pilot to find this code: columns_to_replace = ['column1', 'column2', 'column3']
replacement_dict = {True: 1, False: 0}
for col in columns_to_replace:
    df[col] = df[col].replace(replacement_dict)<br>

