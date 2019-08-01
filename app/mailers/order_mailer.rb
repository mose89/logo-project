class OrderMailer < ApplicationMailer

  def bestilling_bekreftelse(order)

    @fornavn = order.company_detail.first_name
    @etternavn = order.company_detail.last_name
    @fullt_navn = "#{order.company_detail.first_name} #{order.company_detail.last_name}"
    @epost = order.company_detail.email
    @pakke = order.package.name


    mail(to: @epost, subject: 'Ordrebekreftelse - Logo Maker\'n')
  end

  def produkt_bestilling(order)
    @fornavn = order.company_detail.first_name
    @etternavn = order.company_detail.last_name
    @fullt_navn = "#{order.company_detail.first_name} #{order.company_detail.last_name}"
    @epost = order.company_detail.email
    @product = order.product.name


    mail(to: @epost, subject: 'Ordrebekreftelse - Logo Maker\'n')
  end
end
