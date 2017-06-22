class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  
  # 引数としてblogを追加します。
  def sendmail_blog(blog)
    @blog = blog

    mail to: "aj07333@icloud.com",
         subject: '【Achieve】ブログが投稿されました'
  end
    # 引数としてcontactを追加します。
  def sendmail_contact(contact)
    @contact = contact

    mail to: @contact.email,
         subject: '【Achieve】問い合わせが完了しました。'
  end
end