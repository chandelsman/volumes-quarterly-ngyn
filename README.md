# Cytology volumes reporting
Monthly NGYN cytology volumes summarized by location

## Overview

Monthly and annual report of non-gyn cytology cases. Report is summarized by facility.

## Data

Query is performed in LigoLab

- Reporting module > Test Result Stats

### Settings

- Summary By = Result ID Prefix
- Report = Activity Report
- Unit of Measure = Monthly
- Field = Collected

### Base tab

- Collected = *set filter to appropriate date range (first of year through end of quarter)*
- Received = *set filter to "All"*

### Extended tab

- Status = Completed

### Test and Panel tab

- Result Type = Cytopathology [NGYN]

## Export Data

- Export query results as an Excel file to IT Projects > volumes-monthly-ngyn > data; file = YYYY-volumes-ngyn
    - The file can be overwritten each month because the report calculates year to date results

## Output

### Build Report

- Knit the Rmarkdown script with parameters set to the current year.

### Printing and Saving

- Print to PDF with scaling set to 74% and file named 20XXq#_NGYN-volumes

## Distribution

- The PDF report is sent to the Director of Cytology: Sara Kane (skane@summitpathology.com).