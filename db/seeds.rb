5.times do |i|
  User.create(name: "user#{i}", email: "user#{i}@user.jp", password: "user#{i}")
end