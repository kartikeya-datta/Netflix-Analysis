# Netflix-Analysis
In this repository I intend to analyse netflix data using SQL queries to refresh and revise my Query optimization skills.


#   Netflix Data Analysis with SQL

    This repository contains SQL queries used to analyze a Netflix dataset. The goal of this analysis is to gain insights into trends, patterns, and characteristics of the content available on Netflix.

    ##   Dataset

    The dataset used in this analysis includes information about movies and TV shows on Netflix. Key columns include:

    * `show_id`: Unique identifier for each title
    * `type`: Type of content (Movie or TV Show)
    * `title`: Title of the movie or TV show
    * `director`: Director of the content
    * `casts`: Cast members
    * `country`: Country of production
    * `date_added`: Date when the content was added to Netflix
    * `release_year`: Year when the content was released
    * `rating`: Content rating
    * `duration`: Duration of the content
    * `listed_in`: Genre of the content
    * `description`: Description of the content

    ##   SQL Queries and Analysis

    The SQL file in this repository (`netflix_analysis.sql`) contains a series of queries to explore and analyze the Netflix dataset. Below is a summary of the types of analyses performed:

    **1.  Basic Data Exploration:**

    * Creating the database table and loading data.
    * Retrieving data and counting total content items.
    * Identifying distinct content types and handling missing values.

    **2.  Content Analysis:**

    * Comparing the number of movies and TV shows.
    * Analyzing content ratings.
    * Filtering content based on release year and type.
    * Determining top content-producing countries.

    **3.  Data Transformation and Normalization:**

    * Splitting and expanding country information for accurate analysis.

    **4.  Advanced Content Analysis:**

    * Finding the longest movie.
    * Analyzing content added within a specific timeframe.
    * Searching for content by specific directors (including case-insensitive search).
    * Analyzing director productivity.
    * Filtering TV shows based on the number of seasons.
    * Counting content items by genre.

    **5.  Country-Specific Analysis:**

    * Analyzing content release trends for a specific country (e.g., India).
    * Listing movies by genre (e.g., documentaries).

    **6.  Data Cleaning and Missing Value Handling:**

    * Identifying content with missing director information.

    **7.  Cast Analysis:**

    * Counting cast member appearances.
    * Filtering content based on cast and release year.
    * Identifying top actors from a specific country.

    **8.  Content Categorization:**

    * Categorizing content based on keywords in the description (e.g., "Good" or "Bad" categories).

    **9.  Hypothetical Analysis (Note: Requires Additional Data):**

    * This section includes an example of a query that would require additional data (e.g., a "views" column) to be present in the table.

    ##   How to Use

    1.  Clone this repository to your local machine.
    2.  Ensure you have a database system (e.g., PostgreSQL) set up.
    3.  Execute the SQL script (`netflix_analysis.sql`) to create the table and run the queries.
    4.  Review the query results to gain insights from the Netflix dataset.

    ##   Contributions

    Contributions to this project are welcome! Feel free to submit pull requests for improvements or additional analyses.