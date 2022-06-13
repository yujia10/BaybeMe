class ChildcareMailer < ApplicationMailer

  default from: 'Baybeme.lewagon@gmail.com'

  def new_childcare_email
    # @childcare = params[:childcare]
    mail(to: 'Baybeme.lewagon@gmail.com', subject: "You got new application")
  end
end


# bcc: ["bcc@example.com", "Order Watcher <watcher@example.com>"])
