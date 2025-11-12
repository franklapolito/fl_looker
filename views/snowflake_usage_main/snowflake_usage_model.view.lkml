view: snowflake_usage_model {
    label: "snowflake_usage_model"
    sql_table_name: "snowflake_usage_main"."snowflake_usage_model";;
    dimension: Data_Organization_Hierarchy_Database {
        label: "   Database"
        description: "Database that the table belongs to."
        group_label: "Data Organization.Data Organization Hierarchy"
        type: string
        sql: ${TABLE}."Database";;
        drill_fields: [Data_Organization_Hierarchy_Schema]
    }

    dimension: Data_Organization_Hierarchy_Schema {
        label: "  Schema"
        description: "Schema that the table belongs to."
        group_label: "Data Organization.Data Organization Hierarchy"
        type: string
        sql: ${TABLE}."Schema";;
    }

    dimension: Date_Hierarchy_Date {
        label: " Date"
        group_label: "Dates.Date Hierarchy"
        type: date
        sql: ${TABLE}."Date";;
    }

    dimension: Date_Hierarchy_Month {
        label: "  Month"
        group_label: "Dates.Date Hierarchy"
        type: string
        sql: ${TABLE}."Month";;
        drill_fields: [Date_Hierarchy_Date]
    }

    dimension: Date_Hierarchy_Year {
        label: "   Year"
        group_label: "Dates.Date Hierarchy"
        type: number
        sql: ${TABLE}."Year";;
        drill_fields: [Date_Hierarchy_Month]
    }

    dimension: Is_AtScale_Query {
        label: "Is AtScale Query"
        description: "If the query was sent from AtScale."
        group_label: "Queries"
        type: number
        sql: ${TABLE}."Is AtScale Query";;
    }

    dimension: Query_Tag {
        label: "Query Tag"
        description: "Query tag set for this statement through the QUERY_TAG session parameter."
        group_label: "Queries"
        type: string
        sql: ${TABLE}."Query Tag";;
    }

    dimension: Query_Text {
        label: "Query Text"
        description: "Text of the SQL statement. Limit is 100K characters. SQL statements containing more than 100K characters will be truncated."
        group_label: "Queries"
        type: string
        sql: ${TABLE}."Query Text";;
    }

    dimension: Query_Hierarchy_Query_ID {
        label: " Query ID"
        group_label: "Queries.Query Hierarchy"
        type: string
        sql: ${TABLE}."Query ID";;
    }

    dimension: Query_Hierarchy_Query_Type {
        label: "  Query Type"
        description: "DML, query, etc. If the query failed, then the query type may be UNKNOWN."
        group_label: "Queries.Query Hierarchy"
        type: string
        sql: ${TABLE}."Query Type";;
        drill_fields: [Query_Hierarchy_Query_ID]
    }

    dimension: Warehouse {
        label: "Warehouse"
        group_label: "Resources"
        type: string
        sql: ${TABLE}."Warehouse";;
    }

    dimension: Created_on {
        label: "Created on"
        group_label: "User Attributes"
        type: date_time
        sql: ${TABLE}."Created on";;
    }

    dimension: Email {
        label: "Email"
        group_label: "User Attributes"
        type: string
        sql: ${TABLE}."Email";;
    }

    dimension: First_Name {
        label: "First Name"
        group_label: "User Attributes"
        type: string
        sql: ${TABLE}."First Name";;
    }

    dimension: Last_Name {
        label: "Last Name"
        group_label: "User Attributes"
        type: string
        sql: ${TABLE}."Last Name";;
    }

    dimension: Last_Success_Login {
        label: "Last Success Login"
        group_label: "User Attributes"
        type: date_time
        sql: ${TABLE}."Last Success Login";;
    }

    dimension: Login_Name {
        label: "Login Name"
        group_label: "User Attributes"
        type: string
        sql: ${TABLE}."Login Name";;
    }

    dimension: User_Hierarchy_User_Name {
        label: "User Name"
        group_label: "User Attributes"
        type: string
        sql: ${TABLE}."User Name";;
    }

    measure: Average_Bytes_Scanned {
        label: "Average Bytes Scanned"
        group_label: "Metrics - Averages"
        description: "Average number of bytes scanned by this statement."
        type: average
        sql: ${TABLE}."Average Bytes Scanned";;
    }

    measure: Average_Compilation_Time {
        label: "Average Compilation Time"
        group_label: "Metrics - Averages"
        description: "Compilation time (in milliseconds)"
        type: average
        sql: ${TABLE}."Average Compilation Time";;
    }

    measure: Average_Execution_Time {
        label: "Average Execution Time"
        group_label: "Metrics - Averages"
        description: "Execution time (in milliseconds)"
        type: average
        sql: ${TABLE}."Average Execution Time";;
    }

    measure: Average_Number_of_Rows_Produced {
        label: "Average Number of Rows Produced"
        group_label: "Metrics - Averages"
        description: "The number of rows produced by this statement. The ROWS_PRODUCED column will be deprecated in a future release. The value in the ROWS_PRODUCED column doesn’t always reflect the logical number of rows affected by a query. Snowflake recommends using the ROWS_INSERTED, ROWS_UPDATED, ROWS_WRITTEN_TO RESULTS, or ROWS_DELETED columns instead."
        type: average
        sql: ${TABLE}."Average Number of Rows Produced";;
    }

    measure: Average_Total_Elapsed_Time {
        label: "Average Total Elapsed Time"
        group_label: "Metrics - Averages"
        description: "Elapsed time (in milliseconds)."
        type: average
        sql: ${TABLE}."Average Total Elapsed Time";;
    }

    measure: Number_of_Queries {
        label: "Number of Queries"
        group_label: "Metrics - Counts"
        type: count_distinct
        sql: ${TABLE}."Number of Queries";;
    }

    measure: Total_Bytes_Scanned {
        label: "Total Bytes Scanned"
        group_label: "Metrics - Totals"
        description: "Total number of bytes scanned"
        type: sum
        sql: ${TABLE}."Total Bytes Scanned";;
    }

    measure: Total_Cost {
        label: "Total Cost"
        group_label: "Metrics - Totals"
        description: "This is the cost based on number of credits time $2.00 per credit. Edit this formula if you want to use a different price per credit."
        value_format: "$#,##0.00"
        type: average
        sql: ${TABLE}."Total Cost";;
    }

    measure: Total_Credits_Used {
        label: "Total Credits Used"
        group_label: "Metrics - Totals"
        description: "Total number of credits used for the warehouse in the hour. This is a sum of CREDITS_USED_COMPUTE and CREDITS_USED_CLOUD_SERVICES. This value does not take into account the adjustment for cloud services, and may therefore be greater than the credits that are billed."
        type: sum
        sql: ${TABLE}."Total Credits Used";;
    }

    measure: Total_Elapsed_Time {
        label: "Total Elapsed Time"
        group_label: "Metrics - Totals"
        description: "Elapsed time (in milliseconds)."
        type: sum
        sql: ${TABLE}."Total Elapsed Time";;
    }

    measure: Total_Execution_Time {
        label: "Total Execution Time"
        group_label: "Metrics - Totals"
        description: "Execution time (in milliseconds)"
        type: sum
        sql: ${TABLE}."Total Execution Time";;
    }

    measure: Total_Number_of_Rows_Produced {
        label: "Total Number of Rows Produced"
        group_label: "Metrics - Totals"
        description: "The number of rows produced by this statement. The ROWS_PRODUCED column will be deprecated in a future release. The value in the ROWS_PRODUCED column doesn’t always reflect the logical number of rows affected by a query. Snowflake recommends using the ROWS_INSERTED, ROWS_UPDATED, ROWS_WRITTEN_TO RESULTS, or ROWS_DELETED columns instead."
        type: sum
        sql: ${TABLE}."Total Number of Rows Produced";;
    }

}
