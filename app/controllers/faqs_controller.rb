class FaqsController < ApplicationController
  before_action :find_faq, only: [:show, :edit, :update, :destroy]

  def import
    authorize :faq, :import?
    Faq.import(params[:file])
    redirect_to faqs_path
  end
  def new
    @faq = Faq.new
    authorize @faq
  end

  def create
    @faq = Faq.new(faq_params)
    authorize @faq
    if @faq.save!
      redirect_to faqs_path
    else
      render new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @faq.update_attributes(faq_params)
      redirect_to admins_faq_path
    else
      render edit
    end
  end

  def index
    @faqs = policy_scope(Faq)
  end

  def destroy
    @faq.destroy
    redirect_to admins_faq_path
  end

  def about
  end

  private
  def faq_params
    params.require(:faq).permit(:question, :answer)
  end

  def find_faq
    @faq = Faq.find(params[:id])
    authorize @faq
  end

end
