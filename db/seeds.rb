# ユーザーの作成
5.times do |i|
  User.create(name: "user#{i+1}", email: "user#{i+1}@user.jp", password: "user#{i+1}")
end