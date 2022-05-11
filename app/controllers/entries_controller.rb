
class EntriesController < ApplicationController
  before_action :find_entry, only: %i[show]
  attr_accessor :session_date

  def index
    Groups.all.each. do |group|
      if groups.users.include?(current_user)
        @group = group
      end

    end

    @entry = Entry.where(group: @group)
  end

  def show
    @answer = Answer.new

    find_students
    @questions_with_answers = @entry.questions.map do |question|
      {
        question: question,
        answer: question.user_answer(current_user) || Answer.new
      }
    end
  end

  private

  def find_entry
    @entry = Entry.find(params[:id])
  end

  def find_students
    @students = @entry.users.where.not(teacher: true)
  end

  def daily_reading_params
    params.require(:entry).permit(:session_date, :subject_id, :content, :objective, :steps, :score)
  end
