# frozen_string_literal: true

require 'date'
require_relative 'kanye'
require_relative 'util_west'

@number_of_days = nil
@user_wants_kanye = nil
# @online_kanye_quotes = nil
@average_commits_per_day = nil
@chance_to_commit_on_saturday = nil
@chance_to_commit_on_sunday = nil

def initial_info
  @number_of_days = ask_for('How many days back do you want the commits to start?').to_i
  ask_about_ye = ask_for('Would you like to kanye-fy your commits for extra spice?')
  @user_wants_kanye = ask_about_ye.downcase.match?(/yes|ye|yup|yep|y/)
  # @kanye_quotes = load_kanye_quotes if @user_wants_kanye
  @average_commits_per_day = ask_for('What should be the average amount of commits per day?').to_i
  @chance_to_commit_on_saturday = ask_for('What should be the chance of commiting on Saturdays? (percentage)').to_i
  @chance_to_commit_on_sunday = ask_for('What should be the chance of commiting on Sundays? (percentage)').to_i
end

def git_repo?
  File.directory?("#{Dir.home}/kommitr_commits/.git")
end

def init_repo
  unless git_repo?
    system('cd && gh repo create kommitr_commits --private --confirm')
  end
end

def create_commit(days_ago)
  if @user_wants_kanye
    commit_message = KANYE_QUOTES.sample
    system("cd && cd kommitr_commits && git commit --allow-empty --date=\"#{days_ago} day ago\" -m \"#{commit_message}\"")
    puts commit_message
  else
    system("cd && cd kommitr_commits && git commit --allow-empty --allow-empty-message --date=\"#{days_ago} day ago\"  -m \"\"")
    puts 'Commit made!'
  end
end

def handle_weekend_days(day_index)
  if random_chance_for_date(day_index)
    random_amount(@average_commits_per_day).times { create_commit(@number_of_days) }
  end
end

def yeezus_commit_it!
  init_repo
  while @number_of_days > 0
    temp_date = Date.today - @number_of_days

    # Check if Saturday or Sunday
    if temp_date.wday == 0 || temp_date.wday == 6
      handle_weekend_days(temp_date.wday)
    else
      random_amount(@average_commits_per_day).times { create_commit(@number_of_days) }
    end
    @number_of_days -= 1
  end
end

initial_info
yeezus_commit_it!
system('cd && cd kommitr_commits && git push origin master')
