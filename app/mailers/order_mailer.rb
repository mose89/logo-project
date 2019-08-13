class OrderMailer < ApplicationMailer

# For pakke bestillinger til kunde
  def bestilling_bekreftelse(order)

    @fornavn = order.company_detail.first_name
    @etternavn = order.company_detail.last_name
    @fullt_navn = "#{order.company_detail.first_name} #{order.company_detail.last_name}"
    @epost = order.company_detail.email
    @pakke = order.package.name
    @pris = order.total


    mail(to: @epost, subject: 'Ordrebekreftelse - Logo Maker\'n')
  end

# For produkt bestillinger til kunde
  def produkt_bestilling(order)
    @fornavn = order.company_detail.first_name
    @etternavn = order.company_detail.last_name
    @fullt_navn = "#{order.company_detail.first_name} #{order.company_detail.last_name}"
    @epost = order.company_detail.email
    @produkt = order.product.name
    @pris = order.total


    mail(to: @epost, subject: 'Ordrebekreftelse - Logo Maker\'n')
  end

# For pakke bestillinger til admin
  def pakke_bestilling_bekreftelse(order)
    @id = order.id
    @fullt_navn = "#{order.company_detail.first_name} #{order.company_detail.last_name}"
    @epost = order.company_detail.email
    @telefon = order.company_detail.phone
    @pakke = order.package.name
    @pris = order.total
    @adresse = order.company_detail.address
    @postnummer = order.company_detail.zip_code


    mail(to: "logomakern@gmail.com", subject: 'Ny pakkebestilling er lagt inn på Logo Maker\'n')

  end

# For produkt bestillinger til admin
  def produkt_bestilling_bekreftelse(order)
    @id = order.id
    @fullt_navn = "#{order.company_detail.first_name} #{order.company_detail.last_name}"
    @epost = order.company_detail.email
    @telefon = order.company_detail.phone
    @produkt = order.product.name
    @pris = order.total
    @adresse = order.company_detail.address
    @postnummer = order.company_detail.zip_code


    mail(to: "logomakern@gmail.com", subject: 'Ny produktbestilling er lagt inn på Logo Maker\'n')
  end

end
