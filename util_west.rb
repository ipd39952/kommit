# Method to get ye quotes online
def load_kanye_quotes
  kanye_quotes = []
  puts 'Time to get some nice Kanye quotes'
  10.times do
    kanye_quotes << `curl -s api.kanye.rest/\?format\=text`
    print '+1 Kanye quote   '
  end
  puts ''
  kanye_quotes
end

def ask_for(stuff)
  puts stuff
  gets.chomp
end

def random_chance_for_date(day_index)
  case day_index
  # 0 == Sunday
  when 0
    @chance_to_commit_on_sunday >= rand(1..100)
  # 6 == Saturday
  when 6
    @chance_to_commit_on_saturday >= rand(1..100)
  end
end

def random_amount(average)
  rand(0..average * 2)
end

def test_results
  instance_variables.each do |item|
    puts "#{item}: #{instance_variable_get(item)} | Type: #{instance_variable_get(item).class}"
  end
end
