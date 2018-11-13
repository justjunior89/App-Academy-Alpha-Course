class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end

  def time_string
    hours = 0
    minutes = 0

    until @seconds < 60
        if @seconds >= 3600
            @seconds = @seconds - 3600
            hours += 1
        elsif @seconds >= 60
            @seconds = @seconds - 60
            minutes += 1
        end
    end
    hours > 9 ? hours = hours.to_s : hours = '0' + hours.to_s
    minutes > 9 ? minutes = minutes.to_s : minutes = '0' + minutes.to_s
    @seconds > 9 ? @seconds = @seconds.to_s : @seconds = '0' + @seconds.to_s
    return "#{hours}:#{minutes}:#{seconds}"
  end
end
