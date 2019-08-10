class AdminsController < ApplicationController
  layout "admin"
  after_action :verify_authorized
  before_action :set_agg
  before_action :set_greeting
  before_action :authenticate_user!

  def dashboard
    authorize :admin, :package?
    @orders = Order.all
    @single_orders = SingleOrder.all
    @packages = Package.all
    @faqs = Faq.all
    @galleries = Gallery.all
    @industries = Industry.all
    @tasks = Task.all
  end

  def order
    authorize :admin, :order?
    @orders = Order.all
    @single_orders = SingleOrder.all

  end

  def package
    authorize :admin, :package?
    @packages = Package.all
  end

  def faq
    authorize :admin, :faq?
    @faqs = Faq.all
  end

  def gallery
    authorize :admin, :gallery?
    @galleries = Gallery.all
  end

  def industry
    authorize :admin, :industry?
    @industries = Industry.all
  end

  def product
    authorize :admin, :product?
    @products = Product.all
  end

  def post
    authorize :admin, :post?
    @posts = Post.all
  end

  def company_detail
    authorize :admin, :company_detail?
    @company_details = CompanyDetail.all
  end

  def style
    authorize :admin, :style?
    @styles = Style.all
  end

  def industry
    authorize :admin, :industry?
    @industries = Industry.all
  end

  def task
    authorize :admin, :task?
    @task = Task.find(params[:id])
    @tasks = Task.all
  end

  private

  def set_agg
    @income_this_year = Order.sales_this_year + SingleOrder.sales_this_year
    @income_this_month = Order.sales_this_month + SingleOrder.sales_this_month
    @active_orders = Order.active_orders
    @active_single_orders = SingleOrder.active_orders
    @all_active_orders = Order.active_orders.count + SingleOrder.active_orders.count
    @all_active_order_instances = Order.active_orders.count + SingleOrder.active_orders.count
    @sales_revenue_by_item = Product.product_revenue_hash.merge(Package.package_revenue_hash)
    @user = current_user
    @my_tasks = Task.where(user: current_user.id)
    @my_task_count = @my_tasks.count
    @all_task_count = Task.all.count
  end

  def set_greeting
    current_time = Time.now.to_i
    midnight = Time.now.beginning_of_day.to_i
    noon = Time.now.middle_of_day.to_i
    five_pm = Time.now.change(:hour => 17 ).to_i
    eight_pm = Time.now.change(:hour => 20 ).to_i
    four_am = Time.now.change(:hour => 4).to_i

    if midnight.upto(four_am).include?(current_time)
      @greeting = ("God Natt, #{@user.first_name}!")
    elsif four_am.upto(noon).include?(current_time)
      @greeting = ("God Morgen, #{@user.first_name}!")
    elsif noon.upto(five_pm).include?(current_time)
      @greeting =  "God Ettermiddag, #{@user.first_name}!"
    elsif five_pm.upto(eight_pm).include?(current_time)
      @greeting = "God Kveld, #{@user.first_name}!"
    elsif eight_pm.upto(midnight + 1.day).include?(current_time)
      @greeting = "God Kveld, #{@user.first_name}!"
    end
    @greeting
  end

end
