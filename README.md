# 🏠 California Housing Market Analysis

**Predictive & exploratory data analysis on 20,640 California housing block groups — applying clustering, regression, decision trees, and neural networks to uncover what drives house prices.**

🌐 **Portfolio:** [m-shreyas.github.io](https://m-shreyas.github.io)  
📦 **Dataset:** [California Housing Prices — Kaggle](https://www.kaggle.com/datasets/camnugent/california-housing-prices)

---

## 📁 Dataset Overview

| Detail | Value |
|---|---|
| Source | 1990 U.S. Census — Kaggle |
| Records | 20,640 block groups |
| Target Variable | Median House Value |

**Key Features:** Median Income · Housing Age · Total Rooms · Bedrooms · Population · Households · Latitude/Longitude · Ocean Proximity

---

## 🧹 Data Preprocessing

- Imputed missing values using appropriate techniques
- Removed duplicates and irrelevant attributes
- Detected and treated outliers to reduce distribution skew
- Normalized numerical features for model stability
- Encoded categorical variables (Ocean Proximity)

---

## 📈 Exploratory Data Analysis

**Key Findings:**
- Strong positive correlation between **median income** and house value
- Coastal regions show significantly higher prices — geography is a top predictor
- Regional disparities reveal clear affordability inequality across California

**Visualizations produced:**
- Income vs. House Value scatter analysis
- Geographic distribution heatmaps (latitude/longitude)
- Housing age distribution
- Population vs. household density

---

## 🔗 Clustering Analysis

Four clustering techniques applied to identify neighborhood patterns:

| Method | Outcome |
|---|---|
| Ward Clustering | Most stable and consistent — **best results** |
| K-Means (K=6) | Clear regional segmentation |
| Centroid Clustering | Comparable to K-Means |
| Average Linkage | Less stable with outliers |

**Key Insight:** Three distinct cluster types emerged — high-value coastal, mid-range suburban, and dense inland regions.

---

## 🤖 Predictive Modeling

| Model | Notes |
|---|---|
| Decision Tree (RegTree B3D6) | **Best overall accuracy** |
| Neural Network (5 Hidden Units) | Lowest MSE — best at capturing non-linearity |
| Linear Regression | Baseline model |
| Exhaustive Regression | Feature selection benchmark |

**Optimization techniques:** Cross-validation · Regularization · Early stopping

---

## 🏆 Key Results

- **Median income** and **location** are the strongest price predictors
- Decision Trees outperformed regression on accuracy
- Neural networks captured non-linear housing market relationships effectively
- Ward clustering produced the most reliable neighborhood segmentation

---

## 💡 Business & Policy Insights

- Supports **real estate investment** decisions by identifying high-growth regions
- Assists **urban planners** in understanding affordability challenges
- Enables **market segmentation** for targeted housing strategies
- Highlights regional housing inequality across California

---

## 🛠️ Tools & Technologies

`SAS Enterprise Miner` `Machine Learning` `Clustering (Ward, K-Means, Centroid, Average Linkage)` `Decision Trees` `Neural Networks` `Linear Regression` `Statistical Analysis` `Data Visualization`

---

## 🚀 Future Enhancements

- Incorporate economic indicators (interest rates, employment data)
- Time-series analysis for price trend forecasting
- Deploy predictive models as an interactive web dashboard

---

*Part of Shreyas Mupparapu's data analytics portfolio — [m-shreyas.github.io](https://m-shreyas.github.io)*
