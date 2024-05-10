# Part One: Weather Data
# In weather.dat you’ll find daily weather data for Morristown, NJ for June 2002. Download this text file, then write a program to output the day number (column one) with the smallest temperature spread (the maximum temperature is the second column, the minimum the third column).
wthr_file = "weather.dat"

def temp_differential(weather_data_file)
  input = File.open(weather_data_file, File::RDONLY){|f| f.read }
  array = input.lines.map(&:split)

  day_data = []
  array.each do |sub|
    if sub.empty? == false
      day_data << sub
    end
  end

  day_array = []  # edge case to consider, 31 day months and february
  index = 1
  while index < 31
    day_array << {day: day_data[index][0], maxtemp: day_data[index][1].to_i, mintemp: day_data[index][2].to_i}
    index += 1
  end

  # p day_array

  # temp_diff = day_array[3][:maxtemp] - day_array[3][:mintemp]
  # temp_diff = day_array[6][:maxtemp] - day_array[6][:mintemp]
  # p temp_diff

  temp_diff = 999999
  date = ''
  day_array.each do |day|
    differential = day[:maxtemp] - day[:mintemp]
    if differential < temp_diff
      temp_diff = differential
      date = day[:day]
    end
  end

  return "Smallest temp spread was #{temp_diff} degrees on the #{date}th."
end

p temp_differential(wthr_file)

#Personal directions
# going to need to use min max
# figure out what parts of the file are needed.
# take those parts and assign them to hash keys in and array of hashes
# compare temperature differential within the hash, 
# loop and do a differential temp equation, get max
