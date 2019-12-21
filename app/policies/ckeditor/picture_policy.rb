# frozen_string_literal: true

class Ckeditor::PicturePolicy
  attr_reader :user, :picture

  def initialize(user, picture)
    @user = user
    @picture = picture
  end

  def index?
    true
  end

  def create?
    true
  end

  def destroy?
    true
  end
end
