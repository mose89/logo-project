class AdminPolicy < ApplicationPolicy

  def dashboard?
    is_admin?
  end

  def package?
    is_admin?
  end

  def order?
    is_admin?
  end

  def faq?
    is_admin?
  end

  def gallery?
    is_admin?
  end

  def industry?
    is_admin?
  end

  def product?
    is_admin?
  end

  def post?
    is_admin?
  end

  def company_detail?
    is_admin?
  end

  def style?
    is_admin?
  end

  def industry?
    is_admin?
  end

  def task?
    is_admin?
  end
end
