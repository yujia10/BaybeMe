class ChildcareMailer < ApplicationMailer



  def new_childcare_email

    @applications = params[:applications]
    @user = params[:user]

    mail(to: 'Baybeme.lewagon@gmail.com', subject: "BaybeMe Application Report")
  end
end


# bcc: ["bcc@example.com", "Order Watcher <watcher@example.com>"])
