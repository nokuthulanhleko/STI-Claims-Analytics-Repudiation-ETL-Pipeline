# STI Claims Power BI Dashboard

Overview
---
I built a Power BI dashboard specification for the STI Claims Analytics project. The assets in this folder include Power Query (M) snippets to load the reporting views, a set of DAX measures I use in the report, and step-by-step instructions to build, export and share the Power BI (.pbix) file.

What I included
---
- `queries.txt`: Power Query M snippets to load each reporting view from the data warehouse.
- `measures.txt`: DAX measures I created for the dashboard (totals, rates, averages).
- `report_instructions.md`: Step-by-step instructions to import the queries, create visuals, and export the report.

How I expect you to use this
---
1. Open Power BI Desktop.
2. Replace `SERVER_NAME` in the queries with your SQL Server host; the database for the reporting views is `sti_claims_dw`.
	Use Windows Authentication in Power BI (no password required) if your user has access to `sti_claims_dw`.
3. Use Get Data → Blank Query → Advanced Editor and paste each M query from `queries.txt` to create the tables.
4. Paste the DAX measures from `measures.txt` into the report (Modeling → New measure) while the correct table is selected.
5. Follow `report_instructions.md` to build the visuals for each page.

Packaging and download
---
After I build the report locally you can export the report as a `.pbix` file (File → Save As). To make it downloadable from this repo, add the `.pbix` file into this folder and commit it; if the file is large, I can instead provide a zip of the `.pbix` or host it in a release.

Notes and assumptions
---
- The queries reference the following views: `vw_claims_summary`, `vw_driver_eligibility_analysis`, `vw_fraud_analysis`, `vw_monthly_claim_trends`, `vw_repudiation_analysis` (found under `sql/05_reporting_views.sql`).
- Column names used in the measures are taken from the views; if you renamed columns, update the measure definitions accordingly.
- I designed the dashboard to work with a single denormalized view (`vw_claims_summary`) as the primary table and the other views for specialized pages.

Next steps you can ask me to do
---
- Build a sample `.pbix` for you (requires a database connection I can use).
- Create a zipped package of the `.pbix` and assets for direct download.
- Add screenshots or a Power BI Theme file to standardize visuals.

If you'd like me to produce a `.pbix` now, provide `SERVER_NAME` and confirm Windows vs SQL authentication; I will generate ready-to-copy M queries. Note: I cannot run Power BI Desktop from here to produce the `.pbix` file.
