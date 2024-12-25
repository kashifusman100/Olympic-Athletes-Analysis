# Olympic-Athletes-Analysis
To analyze the history of the Olympic Games and it's athletes, spanning from Athens 1896 to Rio 2016.

## Project Description 
This project explores the history of the modern Olympic Games, spanning from Athens 1896 to Rio 2016. Using SQL in Microsoft SQL Server Management Studio (SSMS), I performed data cleaning, transformation, and analysis to uncover valuable insights and trends. The findings were then [visualized using Tableau](https://public.tableau.com/app/profile/kashif.usman/viz/OlympicsAthletesInsights/Dashboard)
, providing a clear understanding of athlete participation, gender ratios, medal distribution, and age variations across sports.

## Problem Statement
The modern Olympic Games have evolved from a modest gathering in 1896 to a global celebration of athleticism and unity by 2016. This project examines the history of the Games, uncovering trends in athlete participation, gender equality, medal achievements, and age dynamics across sports. The analysis sheds light on how the Olympics have reflected and driven societal progress while showcasing the diversity and inclusivity of sports on the world stage.

## Dataset:
[Kaggle](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results)

## Software:
- SSMS (Microsoft SQL Server Management Studio)
- Tableau for creating visualizations and an interactive dashboard

## ETL
1.EXTRACT

Extracted from Kaggle’s 120 Years of Olympic History Dataset
Filtered historical data of modern Olympic Games spanning 1896 to 2016
Evaluated 271,116 rows and 15 columns containing details like athlete demographics, events, and medal records.

2.TRANSFORM

Data Cleaning: Identified and removed almost 10,000 duplicate rows. Checked for and addressed missing values in critical fields such as Medal, Age, Height, and Weight. Removed rows with incorrect or unrealistic values (e.g., age outliers).  
Data Transformation: Renamed and standardized column names for clarity and consistency. Performed SQL queries to extract trends, group data, and calculate aggregate statistics for analysis.  
Normalization and Preparation: Ensured the dataset was cleaned, formatted, and analysis-ready for Tableau visualizations.

3.LOAD

Exported the cleaned and transformed data into .CSV format for visualization.  
Tool for Visualization: Tableau  
Tableau Dashboard: [Tableau Dashboard](https://public.tableau.com/app/profile/kashif.usman/viz/OlympicsAthletesInsights/Dashboard)

## Visualizations and Insights

## Athlete Participation Over Time
In 1896, the first modern Olympics featured only 176 athletes. By 2016, participation had grown to 10,903 athletes, showcasing its transformation into a global sporting event. It highlights the steady growth in athlete participation, reflecting increased global interest, better accessibility, and expanded inclusion of new sports.

<img src="./Visualizations/Athlete%20Participation%20Over%20Time.png" alt="Athlete Participation Over Time" width="800">

## Male & Female Ratio Over Time
In 1900, only 21 female athletes competed alongside 1,036 males, accounting for a mere fraction of total participants. By 2016, significant strides in gender equality were evident, with 6,003 male athletes and 4,009 female athletes. It illustrates the gradual narrowing of the gender gap, driven by changing societal norms and increased inclusion of women in various sports.

![M & F Ratio Over Time](./Visualizations/M%20&%20F%20Ratio%20Over%20Time.png)

## Top 10 Medalists
Russian athletes are dominated in top 10 medalists with 4 spots. Leading the list is Larysa Semenivna Latynina from Russia with 18 medals. 

![Top 10 Medalists](./Visualizations/Top%2010%20Medalists.png)

## Top 10 Countries with Most Medals
The United States leads the Olympic medal tally, with 4,390 medals. Following closely are Russia and Germany. China, despite entering the Games much later, secured the 10th spot with 901 medals, showcasing rapid progress.

![Top 10 Countries with Most Medals](./Visualizations/Top%2010%20Countries%20with%20Most%20Medals.png)

## Average Age by Sport
Gymnastics features the youngest athletes with an average age of 19 years, where agility and flexibility play a critical role. On the other hand, Roque, a precision sport, has the oldest average age of 47 years.

![Visualizations/Avg Age By Sport](./Visualizations/Avg%20Age%20By%20Sport.png)

## Key Findings
- The Olympics grew from 176 athletes in 1896 to 10,903 athletes in 2016.
- Gender participation has improved significantly, with female participation rising to nearly 40% by 2016.
- Larysa Semenivna is the most decorated Olympian with 18 medals.
- The United States dominates the medal tally with 4,390 medals.
- Sports like Gymnastics attract younger athletes, while strategic sports like Roque have older participants.



