class Notifications < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.borrow.subject
  #
  def borrow(borrowed)
    @greeting = "Hi"
    @borrower = borrowed.user.name
    @book = borrowed.book.title
    @lender = borrowed.book.user.name
    @bemail = borrowed.user.email

    mail to: borrowed.book.user.email
  end

  def followed(follow)
    @greeting = "Hi"
    @follower = follow.follower.name
    @id = follow.follower_id

    mail to: follow.followee.email
  end
  
end
