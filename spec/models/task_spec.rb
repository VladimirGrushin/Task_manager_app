require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'is valid with valid attributes' do
    user = User.create!(email: 'test@example.com', password: 'password')
    task = Task.new(
      title: 'Test Task',
      description: 'Something useful',
      status: 'pending',
      user: user # привязка к пользователю
    )
    expect(task).to be_valid
  end

  it 'is not valid without a title' do
    task = Task.new(title: nil)
    expect(task).to_not be_valid
  end

it 'raises an error when given an invalid status' do
  user = User.create!(email: 'another@example.com', password: 'password')
  expect {
    Task.new(title: 'Task', status: 'unknown', user: user)
  }.to raise_error(ArgumentError, /is not a valid status/)
end


end
