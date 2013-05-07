class TestMailer < ActionMailer::Base
  default from: "zidnimubarock@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_mailer.just_test.subject
  #
  def just_test
    @greeting = "Hi"

    mail to: "zidmubarock@gmail.com"
  end
end
