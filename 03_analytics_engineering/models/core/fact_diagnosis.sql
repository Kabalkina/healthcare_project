{{ config(materialized='table') }}

with base as (
    select
        year,
        sex,
        age_group,
        icd_category_code,
        icd_category_label,
        diagnosis_count
    from {{ ref('stg_healthcare_data') }}
    where icd_category_code is not null
)

select
    year,
    sex,
    age_group,
    icd_category_code,
    icd_category_label,
    sum(diagnosis_count) as total_diagnoses
from base
group by 1, 2, 3, 4, 5
