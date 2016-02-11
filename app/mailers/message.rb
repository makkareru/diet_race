class Message < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message.regist.subject
  #
  def regist ticket
    @ticket = ticket
    filepath = Rails.root.join('app/assets/images/higuchi.jpg')
    attachments['filename.jpg'] = File.read(filepath)

    mail to: @ticket.email, subject: "【IACCダイエットレース】Thanks メール"
  end
end
