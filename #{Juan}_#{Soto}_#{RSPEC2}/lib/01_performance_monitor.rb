def measure(num = 1,&blk)
  average = 0
  num.times do
    start_time = Time.now
    yield
    end_time = Time.now
    average += end_time - start_time
  end
  average / num
end
p measure(1){10}
