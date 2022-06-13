# Preview all emails at http://localhost:3000/rails/mailers/childcare_application_mailer
class ChildcareMailerPreview < ActionMailer::Preview
  def new_childcare_email
    # Set up a temporary order for the preview
    # order = Childcare.new(address: "1-2-3 Chuo, Tokyo, 333-0000", phone: "090-7777-8888", message: "I want to place an order!")

    ChildcareMailer.new_childcare_email
  end

end
