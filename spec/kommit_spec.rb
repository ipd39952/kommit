require 'kommit'

describe '#git_repo?' do
  it 'should return true' do
    expect(git_repo?).to eq true
  end
end

describe '#user_confirmation' do
  it 'should handle empty input correctly' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('')

    expect { user_confirmation }.to output("\nWould you like to push the  commits?\nAll these commits for nothing! 😭\n").to_stdout
  end
end