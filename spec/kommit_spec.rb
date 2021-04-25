require 'kommit'

# Comments in this file are learning points that I've made for myself

describe '#git_repo?' do
  it 'should return true' do
    expect(git_repo?).to eq true
  end
end

describe '#user_confirmation' do
  it 'should handle empty input correctly' do
    # Sending certain value to a #gets method
    allow_any_instance_of(Kernel).to receive(:gets).and_return('')
    # user_confirmation should be wrapped in a block in this example
    expect { user_confirmation }.to output("\nWould you like to push the  commits?\nAll these commits for nothing! 😭\n").to_stdout
  end
end

describe '#load_kanye_quotes' do
  result = load_kanye_quotes
  it 'should return and array' do
    # use be_a to check for a certain datatype
    expect(result).to be_a(Array)
  end

  it 'should have 10 elements' do
    expect(result.length).to eq 10
  end

  it 'every element should be a string' do
    expect(result.sample).to be_a(String)
  end
end

describe '#random_amout(average_amount)' do
  result = []
  100.times { result << random_amount(3) }
  it 'should return a result similiar to the argument given' do
    # be_within(difference).of(value) - very intuitive and useful
    expect(result.sum.to_f / result.size).to be_within(0.6).of(3)
  end
end

describe '#random_chance_for_date(day_index)' do
  @chance_to_commit_on_saturday = 20
  @chance_to_commit_on_sunday = 10
  saturday_result = []
  sunday_result = []
  100.times do
    saturday_result << random_chance_for_date(6)
    sunday_result << random_chance_for_date(0)
  end

  it 'should return true 20% of the time (+-5)' do
    expect(saturday_result.count(true)).to be_within(5).of(20)
  end

  it 'should return true 10% of the time (+-5)' do
    expect(sunday_result.count(true)).to be_within(5).of(10)
  end
end