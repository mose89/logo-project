class KontaktMailer < ApplicationMailer

  def kontakt_epost(melding)
    @fornavn = @melding.first_name
    @etternavn = @melding.last_name
    @telefon = @melding.phone
    @melding = @melding.message
    @epost = @melding.email
    mail(to: @epost, subject: 'Logo <Maker\'n - Bekreftelse på Mottatt Melding')
  end
end
