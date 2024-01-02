# Docker

q1. --iidfile string

q2. used command ``` docker run -it --entrypoint=bash python:3.9 ```. 3 packages were installed: pip, setuptools and wheel

q3. 
```
SELECT 
	COUNT(1)
FROM
	green_taxi_data
WHERE
	DATE(lpep_pickup_datetime) = '01/15/2019' AND
	DATE(lpep_dropoff_datetime) = '01/15/2019'
```
DATE function makes the returns only date from datetime. The count returns 20530.

q4. 
```
SELECT 
	MAX(trip_distance)
FROM
	green_taxi_data
WHERE
	DATE(lpep_pickup_datetime) = '01/18/2019' OR
	DATE(lpep_pickup_datetime) = '01/25/2019' OR
	DATE(lpep_pickup_datetime) = '01/15/2019' OR
	DATE(lpep_pickup_datetime) = '01/10/2019'
```
Selects the max distance from the pickup dates. According to the pdf this is the distance in miles, so the max distance is 117.99 miles

q5. 
```
SELECT 
	sum(CASE WHEN Passenger_count = 2 then 1 else 0 end) as passenger_count_2, 
	sum(CASE WHEN Passenger_count = 3 then 1 else 0 end) as passenger_count_3 
FROM
	green_taxi_data
WHERE
	DATE(lpep_pickup_datetime) = '01/01/2019'
```
Returns the sum of trips that had 2 and 3 passengers in separate columns. Returned 2: 1282 ; 3: 254.

q6. 
```
SELECT
	tip_amount, 
	"Zone"
FROM
	green_taxi_data
	LEFT JOIN zones 
	ON green_taxi_data."DOLocationID"=zones."LocationID"
WHERE 
	"PULocationID" = 7
ORDER BY
	tip_amount DESC
```
This returns Long Island City/Queens Plaza

# Terraform

q1. 
```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
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
      + project                    = "rich-wavelet-408011"
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
      + name                        = "rich-wavelet-408011-terra-bucket"
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

  Enter a value: yes

google_bigquery_dataset.demo_dataset: Creating...
google_storage_bucket.demo-bucket: Creating...
google_bigquery_dataset.demo_dataset: Creation complete after 1s [id=projects/rich-wavelet-408011/datasets/demo_dataset]
google_storage_bucket.demo-bucket: Creation complete after 1s [id=rich-wavelet-408011-terra-bucket]
```

