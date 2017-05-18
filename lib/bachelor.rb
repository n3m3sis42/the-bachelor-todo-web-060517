require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].find { |contestant_data| contestant_data["status"] == "Winner"}["name"].split(" ")[0]
end

def get_contestant_name(data, occupation)
  contestant_name = ""
  data.keys.each { |season| data[season].each { |contestant_data|
    if contestant_data["occupation"] == occupation
      contestant_name = contestant_data["name"]
    end
    }
  }
  contestant_name
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.keys.each { |season| data[season].each { |contestant_data|
    if contestant_data["hometown"] == hometown
      count += 1
    end
    }
  }
  count
end

def get_occupation(data, hometown)
  data.keys.each { |season|
    data[season].each { |contestant_data| return contestant_data["occupation"] if contestant_data["hometown"] == hometown}
  }
end

def get_average_age_for_season(data, season)
  age = 0.0
  data[season].each { |contestant_data| age += contestant_data["age"].to_i}
  (age / data[season].size).round
end
