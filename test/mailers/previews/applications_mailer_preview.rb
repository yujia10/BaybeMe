# Preview all emails at http://localhost:3000/rails/mailers/applications_mailer
class ApplicationsMailerPreview < ActionMailer::Preview

  def new_applications_email
    # Set up a temporary order for the preview
    # order = Childcare.new(address: "1-2-3 Chuo, Tokyo, 333-0000", phone: "090-7777-8888", message: "I want to place an order!")

    ApplicationsMailer.new_applications_email
  end

end
