require('usage-tracker').setup({
    keep_eventlog_days = 30,
    cleanup_freq_days = 60,
    event_wait_period_in_sec = 5,
    inactivity_threshold_in_min = 5,
    inactivity_check_freq_in_sec = 5,
    verbose = 0,
    telemetry_endpoint = "" -- you'll need to start the restapi for this feature
})
