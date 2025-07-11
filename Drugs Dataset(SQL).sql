-- 1)Get all drugs used for "Acne"
SELECT * FROM drugs
WHERE medical_condition = 'Acne';

-- 2)List distinct medical conditions
SELECT DISTINCT medical_condition
FROM drugs;

-- 3)Count of drugs by pregnancy category
SELECT pregnancy_category, COUNT(*) as 'Total drugs'
FROM drugs
GROUP BY pregnancy_category;

-- 4)Number of drugs available as OTC vs Rx
SELECT rx_otc, COUNT(*) as 'Total drugs'
FROM drugs
GROUP BY rx_otc;

-- 5)Top 5 highest-rated drugs
SELECT drug_name, rating
FROM drugs
ORDER BY rating desc
LIMIT 5;

-- 6)Average rating per medical condition
SELECT medical_condition, AVG(rating) as 'Average rating'
FROM drugs
GROUP BY medical_condition;

-- 7)Top 10 drugs with most reviews
SELECT drug_name, no_of_reviews
FROM drugs
ORDER BY no_of_reviews desc
LIMIT 10;

-- 8)Count of drugs per drug class
SELECT drug_classes, COUNT(*) as Total_drugs
FROM drugs
GROUP BY drug_classes
ORDER BY Total_drugs desc;

-- 9)Drugs with alcohol warnings
SELECT drug_name
FROM drugs
WHERE alcohol = 'X';

-- 10)Drugs safe during pregnancy (Category A or B)
SELECT drug_name, pregnancy_category
FROM drugs
WHERE pregnancy_category = 'A' OR pregnancy_category = 'B';

-- 11)Average activity % per medical condition
SELECT medical_condition, AVG(activity) as Average_activity
FROM drugs
GROUP BY medical_condition
ORDER BY Average_activity desc;

-- 12)Drugs with more than one brand name
SELECT drug_name, brand_names
FROM drugs
WHERE brand_names LIKE "%,%";

-- 13)Find drugs whose generic name is different from the brand name
SELECT drug_name, generic_name
FROM drugs
WHERE drug_name != generic_name;

-- 14)Get drug_link for a specific condition
SELECT drug_link
FROM drugs
WHERE medical_condition = 'Covid 19';

-- 15)Ranking based on activity
SELECT drug_name, medical_condition, brand_names, activity,
RANK() OVER(partition by medical_condition ORDER BY activity desc) as 'Rank'
FROM drugs;

SELECT * FROM drugs;

