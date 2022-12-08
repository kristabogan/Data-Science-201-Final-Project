<!-- 
  <<< Author notes: DS201 Final Project >>> 
  Creating a Machine Learning algorithm for UCI's Wheat Seed dataset.
  Evaluating the performance of 5 different algorithms, and conducting a business analysis on what the data taught us.
-->

# DS201: Machine Learning Classification on Wheat Seed Varieties
# By Krista Bogan and Jessica Booth

The data can be found on UCI's Machine Learning repository [here](https://archive.ics.uci.edu/ml/datasets/seeds)

To run the code in Kaggle, please click [here](https://www.kaggle.com/code/kristabogan/ds-final-project-bogan-booth/notebook)

In this analysis, we will be constructing the best classification algorithm for "Seeds", a dataset viewing the various geometric properties of three varieties of wheat seed. The wheat seeds are the varieties Kama, Rosa and Canadian.

<img alt="image showing the three wheat varieties" src="/images/Wheat%20Varieties.png"/>

During data collection, a soft X-ray technique and GRAINS package were
used to create the 7 real attributes in the data set. We will be
evaluating which algorithm can best classify and predict the wheat
seed level from the given attributes.

# Business Understanding

# Data Understanding

**What is the purpose of the dataset?**: The purpose of this analysis is to craft a machine learning algorithm to assist the sorting process of wheat seeds in the food industry.

**What are the attributes of the dataset?**: The dataset views 7 different geometric attributes of kernels. The class for this data set is wheat variety. There are 3 disctinct wheat varieties in the dataset. We could not find specifics on the wheat varieties. 

1\. Area, A

2\. Perimeter, P

3\. Compactness C = 4*pi*A/P\^2

4\. Kernel length

5\. Kernel width

6\. Asymmetry coefficient

7\. Kernel groove length.


**What analyses does the code conduct?**: The code analyzes everything from descriptive statistics to full ML algorithm selected. We began by viewing the boxplots of individual attributions, followed by multivariate plots to evaluate the relationship between the attributions and classes.

# Data Preparation

The class is three varieties of wheat, as described in the previous section. In order to make the levels for the attributes a factored variable, we created a new column under
"TypeFac", the factored version of the class variable, Type. Before
getting into any statistics, we began by creating a validation dataset.
We split the dataset, seeds, into two halves. We decided to use the
80/20 method, where 80% of the training data will be used to train our
models, and 20% will be used as a validation dataset.

<img alt="validation" src="/images/validation.JPG"/>

We then decided to conduct descriptive statistics and peek at our data
before crafting our models. We can see that our data includes 199
instances and 9 attributes (including Type and factored Type). We can
also see that our attributes are all numeric, with a factored class of
wheat variety.

<img alt="sapply" src="/images/sapply.JPG"/>

<img alt="head()" src="/images/head().JPG"/>

Now that we have evaluated the attributes of our dataset, we can go
about conducting our summary statistics. Using the summary statistics, below are a couple of univariate plots evaluating our isolated variables. Below are two types of barcharts: one showing the averages for each attribute, regardless of wheat variety, and the other ensuring that each level has roughly the same number of observations.

<img alt="3" src="/images/Rplot003.png"/>
<img alt="4" src="/images/Rplot004.png"/>

Now, we can create multivariate plots investigating the relationship between the attributes and wheat varieties. Below is a scatterplot matrix with ellipses surrounding the clusters of data. This gives us an understanding of the mean distribution for each attribute, colored by level. Green indicates Kama seeds, blue indicates Rosa seeds, and pink represents Canadian seeds.

<img alt="5" src="/images/Rplot005.png"/>

We then created a boxplot representation of the relationships between
the classes and the attributes. We believe that this plot in particular
gives us a clear idea of the different trends present.

<img alt="5" src="/images/Rplot007.png"/>

As a final multivariate plot, we will be looking at the
distribution-like curve.

<img alt="5" src="/images/Rplot006.png"/>

Using the information from all three multivariate plots, there are a
couple of trend observations that can be made before algorithm creation.
It seems as though wheat variety 3 likely has a higher asymmetry
coefficient, and a lower area and perimeter. It also seems as though
wheat variety 2 has a greater overall area and perimeter in comparison
to the other wheat varieties.

Now that we have evaluated the trends and relationships of the class and
attributes, we can go ahead and begin crafting the algorithms.

# Data Modeling

The algorithm building process consists of three steps:

1\. Set up the test harness and use 10-fold cross validation

2\. Build 5 different models to predict seed type from measurements

3\. Select the best model using accuracy measures

For the test harness, we performed a 10-fold cross validation to
estimate accuracy. We randomly divided our dataset into 10 parts. Then,
we used 9 parts of that split for training, and save the last part for
testing. The way that cross validation works is that we repeat this
process 10 times, using a different 10th part for testing each time. The
metric that we are using is called "Accuracy" to evaluate performance of
our models. Accuracy is the ratio of the number of correctly predicted
instances by the total number of instances, in percentage form. This
process provides reliable estimates of algorithm performance on the data
that is not seen.

<img alt="10fold" src="/images/10fold.JPG"/>

Upon running 10-fold cross validation, we can begin by building our
models. For this analysis, we crafted 5 different models to get a good
combination of linear, nonlinear, and complex nonlinear algorithms. We
reset the seed building each model to make sure that each algorithm uses
the same data splits. By doing this, our algorithms can be compared and
evaluated against one another.

1.  Linear Discriminant Analysis (LDA)

    A dimensionality reduction technique used for supervised
    classification problems. It is a simple linear analysis that creates
    the highest possible discrimination across different classes (in
    this case, the three wheat varieties).

2.  Classification and Regression Trees (CART)

    A predictive algorithm that explains how classes can be predicted by
    other attributes.

3.  k-Nearest Neighbors (kNN):

    A data classification method that estimates the probability that a
    given data point will be under one group or another depending on the
    points closest to it.

4.  Support Vector Machines (SVM) with a linear kernel:

    Supervised learning models used for classification, regression, and
    outlier detection. Identifies and classifies based on data point
    positions to the hyperplane.

5.  Random Forest (RF):

    Supervised learning technique that is a tree-based algorithm. It
    uses multiple different decision trees to make decisions on
    classification.
    
<img alt="alg" src="/images/alg.JPG"/>

# Model Evaluation

Now that we have crafted all of our models, we can view the accuracy of
each to decide which is the best for our dataset. Evaluating our
results, it is clear that the LDA algorithm returns the highest accuracy
level. In our summary, LDA has a much higher accuracy in comparison to
the other algorithms. We can also see from the Accuracy/Kappa charts
that LDA is consistently the most accurate.

<img alt="8" src="/images/Rplot008.png"/>

We decided to run the results of LDA separately as a final evaluation.
As we can see, across the 10-fold cross validations, the LDA algorithm
had an accuracy of 97% Although it isn't perfect, it's definitely a
highly accurate classification model for the grouping wheat seeds.

<img alt="accuracy" src="/images/accuracy.JPG"/>

As a final step in our analysis, we made some predictions with our
algorithm. In our prediction test, the algorithm accuracy was about
98%. It is important to conduct a final check of the accuracy in case
we made an error somewhere in our algorithm building. Overall, we have
overwhelming evidence to suggest that a Linear Discriminant Analysis
algorithm is the most proficient in classifying wheat variety by our 7
geometric attributes.

<img alt="predict" src="/images/predic.JPG"/>

# Deployment
