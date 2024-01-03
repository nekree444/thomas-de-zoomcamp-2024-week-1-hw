# Docker

Q1. --rm

Q2. docker run -it --entrypoint=bash python:3.9, pip list, wheel version is 0.42.0

Q3. 
```
SELECT 
	COUNT(1)
FROM
	green_taxi_data
WHERE
	DATE(lpep_pickup_datetime) = '09/18/2019' AND
	DATE(lpep_dropoff_datetime) = '09/18/2019'
```
DATE function makes the returns only date from datetime. The count returns 15612.

Q4. 
```SELECT 
	DATE(lpep_pickup_datetime), 
	trip_distance
FROM
	green_taxi_data
WHERE
	DATE(lpep_pickup_datetime) = '09/18/2019' OR
	DATE(lpep_pickup_datetime) = '09/16/2019' OR
	DATE(lpep_pickup_datetime) = '09/26/2019' OR
	DATE(lpep_pickup_datetime) = '09/21/2019'
ORDER BY
	trip_distance DESC```
Shows trip distance in descending order for the specified dates. According to the pdf this is the distance in miles, so the max distance is 341.64 miles on 2019-09-26

Q5. 
```SELECT
	"Borough", 
	ROUND(sum(total_amount))
FROM
	green_taxi_data
	LEFT JOIN zones 
	ON green_taxi_data."PULocationID"=zones."LocationID"
GROUP BY
	"Borough"
ORDER BY
	sum(total_amount) DESC```
Shows the rounded total amount values for each borough (rounded for visual) and sorted by the total amount. The 3 boroughs were Brooklyn, Queens, Manhatten

Q6. 
```SELECT
	tip_amount, 
	"Zone"
FROM
	green_taxi_data
	LEFT JOIN zones 
	ON green_taxi_data."DOLocationID"=zones."LocationID"
WHERE 
	"PULocationID" = 7 -- Astoria
ORDER BY
	tip_amount DESC
LIMIT 
	1```
This returns a $62.31 tip to JFK Airport

# Terraform

Q7. 
```Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_bigquery_dataset.demo_dataset will be created
  + resource "google_bigquery_dataset" "demo_dataset" {
      + creation_time              = (known after apply)
      + dataset_id                 = "demo_dataset"
      + default_collation          = (known after apply)
      + delete_contents_on_destroy = false
      + effective_labels           = (known after apply)
      + etag                       = (known after apply)
      + id                         = (known after apply)
      + is_case_insensitive        = (known after apply)
      + last_modified_time         = (known after apply)
      + location                   = "US"
      + max_time_travel_hours      = (known after apply)
      + project                    = "de-zoomcamp-week1-thomas"
      + self_link                  = (known after apply)
      + storage_billing_model      = (known after apply)
      + terraform_labels           = (known after apply)
    }

  # google_storage_bucket.demo-bucket will be created
  + resource "google_storage_bucket" "demo-bucket" {
      + effective_labels            = (known after apply)
      + force_destroy               = true
      + id                          = (known after apply)
      + location                    = "US"
      + name                        = "de-zoomcamp-week1-thomas-terra-bucket"
      + project                     = (known after apply)
      + public_access_prevention    = (known after apply)
      + rpo                         = (known after apply)
      + self_link                   = (known after apply)
      + storage_class               = "STANDARD"
      + terraform_labels            = (known after apply)
      + uniform_bucket_level_access = (known after apply)
      + url                         = (known after apply)

      + lifecycle_rule {
          + action {
              + type = "AbortIncompleteMultipartUpload"
            }
          + condition {
              + age                   = 1
              + matches_prefix        = []
              + matches_storage_class = []
              + matches_suffix        = []
              + with_state            = (known after apply)
            }
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:```
