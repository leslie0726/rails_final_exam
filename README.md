step1 bundle install
step2 開啟瀏覽器到http://localhost:3000/ 並建立管理者 (admin@ntub.edu.tw) 姓名及密碼隨意
若在註冊或登入的過程有出現cannot load such file -- bcrypt_ext問題(目前使用windows環境會有這個問題)
請至 https://github.com/codahale/bcrypt-ruby/issues/142 的@AliOsm的指示處理 (過程請只使用一個終端機，我也測很久才過...)
gem uninstall bcrypt (應該會跳出說要移除哪個版本，請點3全砍或一個一個慢慢砍)
gem uninstall bcrypt-ruby (本人執行時並無出現訊息，但還是照做)
gem install bcrypt --platform=ruby (等它一下再重啟伺服器)
rails s 在試一次 應該就會成功了
step3 可以直接新增競選人囉~
