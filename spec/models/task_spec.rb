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

it 'is not valid without a user' do
  task = Task.new(title: 'Orphan Task', status: 'pending', user: nil)
  expect(task).not_to be_valid
  expect(task.errors[:user]).to include("must exist")
end

it 'has a default status of pending' do
  user = User.create!(email: 'test4@example.com', password: 'password')
  task = Task.create!(
    title: 'Default Status Task',
    description: 'Task without explicit status',
    user: user
  )
  expect(task.status).to eq('pending')
end

it 'is valid with a category' do
  user = User.create!(email: 'test5@example.com', password: 'password')
  category = Category.create!(name: 'Work')
  task = Task.new(
    title: 'Categorized Task',
    description: 'A task with category',
    status: 'pending',
    user: user,
    category: category
  )
  expect(task).to be_valid
end

it 'is not valid without a user' do
  task = Task.new(
    title: 'No User Task',
    description: 'No user assigned',
    status: 'pending'
  )
  expect(task).to_not be_valid
end

it 'is valid without a category' do
  user = User.create!(email: 'valid@example.com', password: 'password')
  task = Task.new(
    title: 'No Category Task',
    description: 'This task has no category',
    status: 'pending',
    user: user
  )
  expect(task).to be_valid
end


end
