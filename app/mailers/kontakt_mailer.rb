class KontaktMailer < ApplicationMailer

  def kontakt_epost
    @bruker  = params
    @fornavn = @bruker.first_name
    @etternavn = @bruker.last_name
    @telefon = @bruker.phone
    @melding = @bruker.message
    @epost = @bruker.email
    mail(to: "mose89@gmail.com", subject: 'Welcome to My Awesome Site')
  end
end
