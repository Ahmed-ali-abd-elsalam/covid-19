# COVID-19 Analysis

## 📘 Introduction

The COVID-19 pandemic, caused by the SARS-CoV-2 virus, began in late 2019 in Wuhan, China, and rapidly spread worldwide. It led to widespread illness, millions of deaths, and severe economic and social disruptions. To control the spread, governments enforced lockdowns, travel restrictions, and vaccination campaigns. The pandemic exposed global health vulnerabilities, driving advancements in vaccine technology and public health preparedness.

### Key Points

- **Initial Outbreak**: The novel coronavirus, designated 2019-nCoV, was first identified in Wuhan, Hubei province, China.
- **Health Impact**: Cases of pneumonia with no clear cause emerged, and existing vaccines or treatments were ineffective.
- **Transmission**: Human-to-human transmission was confirmed, with infection rates escalating significantly by mid-January 2020.

---

## 📂 The Dataset

This dataset, hosted on Kaggle, can be accessed [here](https://www.kaggle.com/datasets/imdevskp/corona-virus-report/data). It was compiled from two major sources:

1. **Center for Systems Science and Engineering (CSSE) at Johns Hopkins University**
   - The CSSE COVID-19 Data Repository publicly provides real-time pandemic data.
   - The **COVID-19 Dashboard** launched on January 22, 2020, and evolved into the comprehensive **Coronavirus Resource Center (CRC)** by March 3, 2020.
   - Data contributions come from ESRI Living Atlas Team and the Johns Hopkins University Applied Physics Lab (JHU APL).

2. **Worldometer Statistics Site** ([Worldometer](https://www.worldometers.info/about/))
   - Worldometer is managed by a global team of developers, researchers, and volunteers.
   - It aggregates and delivers timely and accurate global coronavirus statistics.
   - Its statistics have been used by governments and prestigious institutions, including CERN and Oxford University Press.

### Data Categories

The collected and formatted data is categorized as follows:

1. **Country-wise Latest Data**
2. **COVID-19 Clean Complete Data**
3. **Day-wise Data**
4. **Full Grouped Data**
5. **USA County-wise Data**
6. **Worldometer Data**

---

## 📊 Analysis

The analysis process began by loading the dataset into **PostgreSQL**. Key steps included:

- **Data Cleaning**: Checked for null values, standardized country names across files, and removed unnecessary columns.
- **Exploratory Data Analysis (EDA)**: Used PostgreSQL views and window functions to explore patterns and relationships.

### 🛠️ Skills Used

- **SQL Views**: To create dynamic data snapshots for analysis.
- **Window Functions**: For calculations across specific data partitions.
- **EDA**: To understand data structure and identify meaningful insights.

---

## 📈 Visualization

To visualize the analysis, a **Tableau Dashboard** was created. You can explore it [here](https://public.tableau.com/views/COVID-19_17341187652010/Dashboard1?\:language=en-US&\:sid=&\:redirect=auth&\:display_count=n&\:origin=viz_share_link). The dashboard provides a clear overview of COVID-19 case distributions, featuring insights on:

- **Case Distribution**: View cases by continent, WHO region, and country.
- **Top 5 Countries**: Identify the top 5 countries for key COVID-19 statistics.

---

## 📢 Conclusion

This project offers a comprehensive analysis of the COVID-19 pandemic, using a robust dataset from trusted sources. It showcases skills in data cleaning, SQL, and data visualization, offering valuable insights through a Tableau dashboard. By presenting clear and accessible data, it highlights the impact of COVID-19 globally and provides a strong foundation for future health data projects.
