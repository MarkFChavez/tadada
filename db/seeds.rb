
user = User.new email: 'los_populares@yahoo.com'
user.password = 'foobar123'
user.save!

discussion = Discussion.create!(title: 'Sample discussion', body: 'In response to a blog written by the leader of Rails community', user: user)

