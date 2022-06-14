class ApplicationsMailer < ApplicationMailer

  def new_applications_email

    # @application = params[:application]
    # @user = params[:user]
    mail(to: 'Baybeme.lewagon@gmail.com', subject: "You got new application")
  end
# bcc: ["bcc@example.com", "Order Watcher <watcher@example.com>"])
end
