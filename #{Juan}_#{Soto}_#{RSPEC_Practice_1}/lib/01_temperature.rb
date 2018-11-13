def ftoc (fahrenheit)
  celsius = (fahrenheit.to_f - 32.0) * (5.0/9.0)
end

def ctof (celsius)
  fahrenheit = (celsius.to_f * 1.8) + 32.0
end
