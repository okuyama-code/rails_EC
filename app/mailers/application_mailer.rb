# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'rails_ec@example.com'
  layout 'mailer'
end
