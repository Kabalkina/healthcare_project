
## BigQuery Schema Fix: Handling Invalid Column Names

### ❗ Problem

The original CSV files in this project ([source](https://github.com/Kabalkina/healthcare_project/tree/main/data)) use column names that **start with a digit**, such as:

```csv
1_variable_code;1_variable_label;1_variable_attribute_code;...
```

This causes BigQuery to raise the following error:

```
Invalid field name "1_variable_code". Fields must contain only letters, numbers, and underscores, start with a letter or underscore...
```

As a result, attempts to create external tables or run merge queries fail due to invalid or missing field references.

---

### ✅ Solution

To resolve this:

1. **Renamed columns** to start with letters by replacing the numeric prefixes:
    - `1_variable_code` → `one_variable_code`
    - `2_variable_label` → `two_variable_label`
    - `3_variable_attribute_code` → `three_variable_attribute_code`
    - `4_variable_label` → `four_variable_label`
    - ...and so on.

2. **Updated the schema definitions** across the Kestra flow:
    - `bq_healthcare_data`: the final target table
    - `bq_healthcare_table_ext`: the external table
    - `bq_healthcare_table_tmp`: the temporary table
    - `bq_merge`: the merge logic

3. **Disabled** `schema_autodetect = TRUE` and provided an **explicit schema** with valid column names in the `bq_healthcare_table_ext` task.

---

### ✅ Result

After applying these changes, the pipeline executes successfully, with all tables using valid and consistent field names that comply with BigQuery’s schema rules.

