class Message < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message.regist.subject
  #
  def regist
    @greeting = "Hi"

    mail to: "info@iacc-diet-race.com"
  end
end
