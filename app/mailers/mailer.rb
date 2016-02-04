class Mailer < ApplicationMailer

  default from: "Piadas Nerds <piadasnerds@gmail.com.br>"

  def registro
    mail(to: "lopesronanufsj@gmail.com", subject: "Seja bem-vindo ao Piadas Nerds!").deliver    
  end


end