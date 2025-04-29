{{ 
    config(
        materialized='view'
    )
}}

with source as (
    select *,
        row_number() over(partition by unique_row_id) as rn
    from {{ source('staging', 'healthcare_data') }}

),

renamed as (
    select
        unique_row_id,
        filename,
        cast(statistics_code as string) as statistics_code,
        statistics_label,
        time_code,
        time_label,
        cast(time as int64) as year,
        
        one_variable_code,
        one_variable_label,
        one_variable_attribute_code,
        one_variable_attribute_label as country,

        two_variable_code,
        two_variable_label,
        two_variable_attribute_code,
        two_variable_attribute_label as sex,

        three_variable_code,
        three_variable_label,
        three_variable_attribute_code,
        three_variable_attribute_label as age_group,

        four_variable_code,
        four_variable_label,
        four_variable_attribute_code as icd_category_code,
        four_variable_attribute_label as icd_category_label,

        cast(value as int64) as diagnosis_count,
        value_unit,
        value_variable_code,
        value_variable_label

    from source
    where rn = 1
)

select * from renamed
where icd_category_label is not null
  and lower(trim(icd_category_label)) not in ('total', 'unknown')



-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %}
limit 100
{% endif %}
