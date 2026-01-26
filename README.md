# 📊 California Housing Market Analysis  
### Predictive & Exploratory Data Analysis using Clustering and Machine Learning

---

## 🔍 Project Overview
This project performs **exploratory and predictive analysis** on the California Housing Prices dataset to understand the factors influencing house prices.  
The study focuses on how **location, income, housing characteristics, and demographics** affect median house values using **clustering and machine learning models**.

---

## 📁 Dataset
- **Source:** California Housing Prices (1990 U.S. Census) – Kaggle  
- **Records:** 20,640 block groups  

### Key Features
- Median House Value *(Target Variable)*
- Median Income
- Housing Median Age
- Total Rooms & Bedrooms
- Population & Households
- Latitude & Longitude
- Ocean Proximity (Categorical)

---

## 🧹 Data Preprocessing
- Handled missing values using appropriate imputation techniques.
- Removed duplicates and irrelevant attributes.
- Detected and treated outliers to reduce skew.
- Normalized numerical features for model stability.
- Encoded categorical variables for modeling.

---

## 📈 Exploratory Data Analysis (EDA)
- Identified a **strong positive correlation** between median income and house value.
- Observed **significantly higher prices in coastal regions**.
- Performed visual analysis on:
  - Income vs. house value
  - Geographic distribution using latitude & longitude
  - Housing median age distribution
  - Population vs. households density
- Revealed **regional disparities and affordability patterns**.

---

## 🔗 Clustering Analysis
Multiple clustering techniques were applied to identify neighborhood patterns:

- **Ward Clustering** *(most stable and consistent)*
- **Centroid Clustering**
- **Average Linkage Clustering**
- **K-Means Clustering (K = 6)**

### Key Clustering Insights
- Distinct clusters for **high-value coastal areas**, **mid-range suburban zones**, and **dense inland regions**.
- Ward clustering produced the most reliable segmentation results.

---

## 🤖 Predictive Modeling
The following models were developed and evaluated:

- **Decision Trees** *(Best performing – RegTree B3D6)*
- **Regression Models** (Linear & Exhaustive Regression)
- **Neural Networks** *(5 Hidden Units – lowest MSE)*

### Model Optimization Techniques
- Cross-validation
- Regularization (to prevent overfitting)
- Early stopping during training

---

## 🏆 Key Results
- **Decision Tree models** achieved the highest prediction accuracy.
- **Median income and location** emerged as the strongest predictors.
- Neural networks effectively captured **non-linear relationships** in housing data.

---

## 💡 Business & Policy Insights
- Supports **real estate investment decisions** by identifying high-growth regions.
- Assists **urban planners and policymakers** in understanding affordability challenges.
- Enables **market segmentation** for targeted housing strategies.
- Highlights **regional housing inequality** across California.

---

## 🛠️ Tools & Technologies
- SAS Enterprise Miner  
- Machine Learning Algorithms  
- Clustering Techniques  
- Data Visualization  
- Statistical Analysis  

---

## 🚀 Future Enhancements
- Incorporate economic indicators (interest rates, employment data).
- Perform time-series analysis for price trends.
- Deploy predictive models as an interactive dashboard or web service.

---

## 📌 References
- California Housing Prices Dataset – Kaggle  
  https://www.kaggle.com/datasets/camnugent/california-housing-prices
