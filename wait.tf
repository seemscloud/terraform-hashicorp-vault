resource "null_resource" "previous" {}

resource "time_sleep" "wait_1_seconds" {
  depends_on = [
    null_resource.previous
  ]

  create_duration = "1s"
}

resource "time_sleep" "wait_2_seconds" {
  depends_on = [
    null_resource.previous
  ]

  create_duration = "2s"
}

resource "time_sleep" "wait_5_seconds" {
  depends_on = [
    null_resource.previous
  ]

  create_duration = "5s"
}