class ContactMailersController < ApplicationController
  before_action :set_contact_mailer, only: [:takk, :show, :edit]

  def new
    @contact_mailer = ContactMailer.new
  end

  def create
    @contact_mailer = ContactMailer.new(contact_mailer_params)

    if @contact_mailer.save!
      KontaktMailer.with(contact_mailer = @contact_mailer).kontakt_epost.deliver_now
      redirect_to ny_takk_contact_mailer_path(@contact_mailer)
    else
      render new
    end
  end

  def show
  end

  def edit
  end

  def index
    @contact_mailers = ContactMailer.all
  end

  def takk
  end

  private
  def contact_mailer_params
    @contact_mailer_params = params.require(:contact_mailer).permit(:first_name, :last_name, :phone, :email, :message)
  end

  def set_contact_mailer
    @contact_mailer = ContactMailer.find(params[:id])
  end

end

