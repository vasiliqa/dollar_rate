every 3.hours do
  runner 'UpdateRateJob.perform_later'
end
