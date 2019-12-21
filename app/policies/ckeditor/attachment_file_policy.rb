# frozen_string_literal: true

class Ckeditor::AttachmentFilePolicy
  attr_reader :user, :attachment

  def initialize(user, attachment)
    @user = user
    @attachment = attachment
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
