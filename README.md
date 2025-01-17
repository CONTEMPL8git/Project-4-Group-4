# Heart Disease Prediction Models [Project-4-Group-4]

# Contributors
[Blake Sandvick](https://github.com/BlakeSandvick)<br>
[Christopher Loch](https://github.com/CONTEMPL8git)<br>
[Eric Zhou](https://github.com/zhou0366)<br>
[Wanderson Oliveira](https://github.com/wwoliver7)<br>

# Introduction
Our group did data cleaning / ETL on a heart disease dataset called ["Indicators of Heart Disease (2022 UPDATE)"](https://www.kaggle.com/datasets/kamilpytlak/personal-key-indicators-of-heart-disease) and then created an ERD / schema and used that to make an SQL database. We added a new column for PatientID and used that as the primary key. We then proceeded to use several different machine learning models to analyze the data, do predictions, and determine precision, recall, F1, and overall accuracy.

# Question<br>
Which type of machine learning can produce the highest accuracy prediction model for whether a patient will have heart disease?<br>

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
• New csv files after replacing non-numeric values and cleaning up<br>
• Images and visualizations<br>


# About The Data
The Kaggle dataset contains data from a 2022 CDC Behavioral Risk Factor Surveillance System (BRFSS) survey of the health status of adults in the US. The data contains information covering health history, lifestyle, and demographics. Most data fields contain results of a yes/no or multiple choice response.

# Importing and Cleaning
A jupyter notebook was created to clean the initial data file. Pyjanitor was also used which allowed multiple data cleaning functions to be performed with fewer lines of code.

The following steps were performed in data cleaning:

-BMI was dropped as its value is directly dependent on height and weight

-Yes/no answers were replaced using the method illustrated below.

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/de176f71-f343-487b-8aff-7aff0c3e1370)

-Non-numeric values were replaced using the method illustrated below. For each of these columns, each unique value was extracted and assigned an ID. Then the values were replaced with this ID.

-The final dataframe as well as dataframes containing IDs and string values for replaced non-numeric data were exported to csv.

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/0302a780-b43d-4650-8bd4-30b5ed77ce2c)

# Designing the ERD and Database Schema
A main data table called PatientData was created to hold all the main data set. Additional tables were created to contain information on which integer IDs correspond to which values. This was done as many patient responses were transformed from string values to integer values. As a result, data retrieved simply from querying the patient data table will not necessarily be intelligible.

![patientdatatable](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/4ec4f451-a152-434a-a2f1-fdcd353c0ca0)

The following ERD shows which columns of the PatientData table will need a connected table which can be used in a joined query to get the actual response string from the original data.

![erd2](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/5571aec6-435e-4c5a-8b7d-9fc9c383cb47)

The following example shows a joined query which both retrieves the integer vale from the PatientData table and its corresponding string value from one of the other tables

![id vs value example](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/13ecbd85-f5b8-4613-8fd5-df6172423360)

SQL files containing the script to create the tables and the sample query above are saved in the "Sql" folder. Data imported is located in the "csv" folder.


# Getting to Know Our Dataset via Some Initial Visualizations
We created some visualizations in Tableau to show how some of the demographics relate to having a heart attack or not. First, we looked at BMI vs. Had Heart Attack and it does show that a higher BMI does lead to a higher likelihood of having a heart attack, but not by a huge amount. However, the nature of our dataset which has a lot more people who did not have heart attacks has likely skewed that and made it show up as less correlated to having a heart attack than BMI actually is.
Second, we looked at smoker status. There are four different groups within this: current smoker who now smokes every day, current smoker who smokes only some days, former smokers, and never smoked. As expected, even this dataset that has an overrepresentation of people who have not had a heart attack still shows that more people who smoke are more likely to have had a heart attack, and even former smokers are more likely to have had a heart attack than people who have never smoked.<br>
<br>

![Smoker-Status-Viz-final](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/153468339/2e66d37b-feb2-4972-9f2f-329beb8083f4)<br>
<br>

![BMI-Viz-final](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/153468339/1769fd5d-75c0-431c-a6f7-3ebf6e1661ed)<br>
<br>
[Link to our Tableau Public page:<br>
https://public.tableau.com/app/profile/christopher.loch/viz/Project4FINAL_17177226678500/Smokervs_Non-smoker?publish=yes]
<br>
<br>

# Supervised Learning: Logistical Regression
Trial 1: lbfgs, no weight

The initial trial of the logistic reaction uses lbfgs. The resulting model’s confusion matrix indicates that it generally classifies most patients as not having heart disease. While this means the model is correct with most patients who did not have heart disease, most patients who did have heart disease were incorrectly predicted as not having heart disease by the model.  

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/2a786015-2491-4ac6-b6f4-4b339fbff01e)

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/4b31ac3d-92a0-493a-ae1e-625e5e3d8bbb)


Trial 2: lbfgs, 1:10 weight

Here, we can see that this class weight is overcompensating for the distribution of the test data. While the model is 100% accurate in predicting no heart disease, it was only able to predict one case of a patient having heart disease. This results in a precision of 1.0 for having a heart attack but near 0 recall in having a heart attack which indicates a very high rate of false negatives.

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

By setting the class weight to ‘balanced’, the solver automatically adjusts the weight. Here, the results shown in the confusion matrix and classification report are the best out of all the trial models.
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

 
By retrieving the coefficients of the model and plotting them for each column, we can show the level of importance for each feature. Chest scan, Sex, and having a stroke were the highest coefficients. Note that these do not necessarily indicate high correlation or causation.
 
![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/ab4414ec-30bf-408d-aae3-225ddbfce349)

# Supervised Learning: Random Forest

When running the random forest, the skewing of the data towards patients without heart disease caused poor performance from the initial model again. Like the logistical regression, the class weight and oversampler were applied to the data set to balance the training data to be more even. We can see that this model has the best performance overall across all metrics of precision and recall. 

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/b53cc200-6c9b-458c-b8e2-bed526c64d5a)

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/c988d895-15fb-4790-80bd-269895e7e439)

Age category, weight, state, chest scan, and general health are the most important features of the model. Note that these do not necessarily indicate high correlation or causation.

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/22827830/5c19d28f-1faf-4585-8988-aaee51a7104b)


 # Plotting Elbow curve To find the optimal K value for the dataset:

When determining K-Means value for Elbow curve many factors were taken into consideration in the dataset, however, number 3 was the optimal number for representing the model. Beyond number 3, Inertia still decreased, however not in a drastic way as observed when K-Means values are less than 3.


![Elbow Curve](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/152826034/00ed9212-67e3-4e35-a959-90f1304da7a1)



# K-Means cluster results :

With this method, we could notice that clusters have more similarities and do have one of the parameters in common. Another observation in the results is that the majority of red clusters(N1) are concentrated  on the right side of the graphic, which corresponds to having a heart attack, meaning that the K-Means clustering algorithm is more inclined to reflect true versus false results.



![Clusters results](https://github.com/CONTEMPL8git/Project-4-Group-4/assets/152826034/e63cc57b-da37-4a1e-9386-c82cebac2c31)






# Neural Network

We created a Keras Sequential model, added the layers, and trained the model to predict if someone has heart disease

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/blob/main/images/Neural-Network-Setup.png)

After training the model we printed out the following visualizations

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/blob/main/images/Loss-graph.png)


![image](https://github.com/CONTEMPL8git/Project-4-Group-4/blob/main/images/Accuracy-graph.png)

Looking at the loss visualization we noticed that we were losing a quarter of the resources that we were training. That made us look closer at the data set when we noticed that our data is heavily skewed towards patients who don't have heart disease. We then decided to check a confusion matrix and class report.

![image](https://github.com/CONTEMPL8git/Project-4-Group-4/blob/main/images/Neural-Network-confusion.png)

We noticed that we were getting a lot of false negatives, if we had more time we would have done some research into oversampling. With the model where it is, we decided it isn't an accurate predictor of whether a patient has heart disease or not.

# Conclusion
Because the dataset was heavily skewed towards patients without a reported heart disease, machine-learning models tended to see very low recall for making accurate predictions for patients who did report heart disease. When creating supervised learning models, oversampling the test data of patients who did have heart disease appeared to generate a better model across all metrics. The random forest model that was generated had the highest performance metrics.

Further possible improvements would be to apply oversampling to other models tried in this project, try other types of models for machine learning, and examine additional data sets as the dataset in the Kaggle also contained data with slightly different columns.


# Presentation Slide Deck
https://docs.google.com/presentation/d/1J-ZoR8RHVMXo8q67zg5adFVkl2ymBw1BecWAV1WkxE4/edit#slide=id.p
<br>

# References
• https://www.kaggle.com/datasets/kamilpytlak/personal-key-indicators-of-heart-disease<br>
• Presentation slide image: Image provided by Microsoft Co-Pilot generative ai<br>
• Python Pandas replace multiple columns zero to Nan  https://stackoverflow.com/questions/45416684/python-pandas-replace-multiple-columns-zero-to-nan<br>
• We used Microsoft Co-Pilot to find this code: columns_to_replace = ['column1', 'column2', 'column3']
replacement_dict = {True: 1, False: 0}
for col in columns_to_replace:
    df[col] = df[col].replace(replacement_dict)<br>

