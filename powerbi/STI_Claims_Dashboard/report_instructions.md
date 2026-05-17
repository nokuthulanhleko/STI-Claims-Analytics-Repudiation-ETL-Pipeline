# STI Claims Dashboard — Report build instructions

This document walks through the steps I used to assemble the Power BI report from the provided reporting views. Follow these steps in Power BI Desktop.

1) Connect to the data
- Open Power BI Desktop → Get Data → Blank Query → Advanced Editor.
- Paste the M snippet for `vw_claims_summary` from `queries.txt`. Replace `SERVER_NAME` and `DATABASE_NAME` with your environment values.
- Repeat for the other views (`vw_repudiation_analysis`, `vw_fraud_analysis`, `vw_monthly_claim_trends`, `vw_driver_eligibility_analysis`).

If you want to work with the included sample CSV instead of a database:
- Open Power BI Desktop → Get Data → Text/CSV and select `powerbi/STI_Claims_Dashboard/sti_claims_sample.csv`.
- Or use Blank Query → Advanced Editor and paste the M from `csv_queries.txt`. Update `samplePath` if your file is elsewhere.

2) Load strategy
- I recommend loading `vw_claims_summary` as the primary table (it is denormalized and includes most fields). Load the smaller, purpose-built views (repudiation, fraud, driver eligibility, monthly trends) as reference tables used on their specific pages.
- Do not create additional relationships if you keep `vw_claims_summary` as source of truth; if you load multiple views and want relationships, create them on `ClaimID` and `FullDate` as appropriate.

3) Add the DAX measures
- Open Modeling → New measure and paste measures from `measures.txt`. Verify column names match the loaded table names. Update table names (if you renamed queries) accordingly.

4) Report pages and visuals (suggested layout)
- Page 1: Summary
  - KPI cards: `Total Claims`, `Total Claim Amount`, `Repudiation Rate`, `High Fraud Rate`.
  - Bar chart: Claims by `ClaimStatus` or `CoverageType` (use `vw_claims_summary` fields).
  - Slicer: `YearNumber`, `MonthName`, `CoverageType`.

- Page 2: Repudiation
  - Table: `ClaimID`, `FullDate`, `CoverageType`, `RepudiationReason`, `ClaimAmount`, `ApprovedAmount` (from `vw_repudiation_analysis`).
  - Donut/treemap: Repudiation Reason distribution (use `RepudiationReason`).
  - KPI/measure: `Forced Entry Repudiation Count`, `Proof Of Ownership Issue Count`.

- Page 3: Fraud Analysis
  - Scatter: `FraudScore` (x) vs `ClaimAmount` (y) with `RepudiatedFlag` color.
  - Table of high fraud claims (filter `FraudScore` threshold).

- Page 4: Monthly Trends
  - Line chart: `Month` vs `Total Claim Amount` and `Total Claims` from `vw_monthly_claim_trends` or aggregate `vw_claims_summary` by `FullDate`/`MonthNumber`.

5) Formatting and interactions
- Set report-level filters for `YearNumber` if desired.
- Configure cross-filtering between visuals (Edit interactions) so clicking a bar affects the KPI cards and tables.

6) Export and make downloadable
- Save the report as `.pbix` (File → Save As). Name it `STI_Claims_Dashboard.pbix`.
- To make it downloadable from this repo: commit the `.pbix` file into `powerbi/STI_Claims_Dashboard/` (if the repo size policy permits) or compress it and add as a release asset on GitHub.

Sample PBIX checklist (what I prepared for you):
- `sti_claims_sample.csv` — first 200 rows of the dataset for offline building.
- `csv_queries.txt` — Power Query M to import and type the CSV.
- `measures.txt` — DAX measures to paste into the model.

To build the sample `.pbix` quickly:
1. Get Data → Text/CSV → select `sti_claims_sample.csv` → Transform Data.
2. If you used Transform Data UI, ensure `ClaimDate` is `date` type and numeric fields are `decimal number`/`whole number` as appropriate.
3. Close & Apply.
4. Open Modeling → New measure and paste each measure from `measures.txt`.
5. Create visuals using the page layouts in this file; save as `STI_Claims_Dashboard_sample.pbix`.


7) Optional: Publish to Power BI Service
- Publish → Sign in to Power BI Service to host the report online and share dashboards and apps. When publishing, configure dataset credentials (gateway) if using an on-prem SQL Server.

If you want, I can (1) assemble a sample `.pbix` for you (I will need access to a running instance of the database), or (2) create a zip with these files ready for upload. Which do you want me to do next?
