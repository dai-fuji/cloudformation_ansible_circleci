# Serverspec
OSレイヤーの各種設定状態をサーバー内部から確認する。RSpecというrubyのテストフレームワークを使用している。
<br>
<br>

## テスト概要
***
- ポート開放確認
- タイムゾーンがJSTに設定されていること
- 所定のパッケージがインストールされていること
- nginxが起動していること
- 所定のディレクトリが存在すること
- httpステータスコードが正常（200）であること
<br>
<br>

## Direcroty
***
```
├── serverspec
│   ├── .rspec
│   ├── Gemfile
│   ├── Gemfile.lock
│   ├── Rakefile
│   ├── properties.yml
│   └── spec
│       ├── app
│       │   └── app_spec.rb
│       ├── base
│       │   └── base_spec.rb
│       └── spec_helper.rb
```
<br>
<br>

## 各ディレクトリやファイルについて
***
- properties.yml・・・対象のホスト情報を記述
- spec/\*\/*_spec.rb・・・テスト項目を記述
- spec_helper.rb・・・対象のホストにSSH接続する為に必要な記述   
<br>
<br>

## コマンドやtips
***
<br>
<br>

## 実行結果
***
```
-------------------------------------
 35.78.146.159 START                        
-------------------------------------
/usr/local/bin/ruby -I/home/circleci/.rubygems/gems/rspec-support-3.11.0/lib:/home/circleci/.rubygems/gems/rspec-core-3.11.0/lib /home/circleci/.rubygems/gems/rspec-core-3.11.0/exe/rspec --pattern spec/\{app,base\}/\*_spec.rb

Process "nginx"
:paranoid is deprecated, please use :verify_host_key. Supported values are exactly the same, only the name of the option has changed.
verify_host_key: false is deprecated, use :never
  is expected to be running

File "/var/www/rails_app"
  is expected to be directory
  is expected to be owned by "ec2-user"
  is expected to be grouped into "ec2-user"

File "/var/www/rails_app/tmp/sockets/unicorn.sock"
  is expected to be socket

Command "curl learning-fujimoto.com -o /dev/null -w "%{http_code}\n" -s"
  stdout
    is expected to match /^200$/

Command "date"
  stdout
    is expected to match /JST/

User "ec2-user"
  is expected to exist

Package "git"
  is expected to be installed

Package "make"
  is expected to be installed

Package "gcc-c++"
  is expected to be installed

Package "patch"
  is expected to be installed

Package "libyaml-devel"
  is expected to be installed

Package "libffi-devel"
  is expected to be installed

Package "libicu-devel"
  is expected to be installed

Package "zlib-devel"
  is expected to be installed

Package "readline-devel"
  is expected to be installed

Package "libxml2-devel"
  is expected to be installed

Package "ImageMagick"
  is expected to be installed

Package "ImageMagick-devel"
  is expected to be installed

Package "libxslt-devel"
  is expected to be installed

Package "openssl-devel"
  is expected to be installed

Package "libcurl"
  is expected to be installed

Package "libcurl-devel"
  is expected to be installed

Package "curl"
  is expected to be installed

Port "80"
  is expected to be listening

Port "22"
  is expected to be listening

Finished in 22.29 seconds (files took 0.35516 seconds to load)
27 examples, 0 failures

-------------------------------------
 13.112.38.53 START                        
-------------------------------------
/usr/local/bin/ruby -I/home/circleci/.rubygems/gems/rspec-support-3.11.0/lib:/home/circleci/.rubygems/gems/rspec-core-3.11.0/lib /home/circleci/.rubygems/gems/rspec-core-3.11.0/exe/rspec --pattern spec/\{app,base\}/\*_spec.rb

Process "nginx"
:paranoid is deprecated, please use :verify_host_key. Supported values are exactly the same, only the name of the option has changed.
verify_host_key: false is deprecated, use :never
  is expected to be running

File "/var/www/rails_app"
  is expected to be directory
  is expected to be owned by "ec2-user"
  is expected to be grouped into "ec2-user"

File "/var/www/rails_app/tmp/sockets/unicorn.sock"
  is expected to be socket

Command "curl learning-fujimoto.com -o /dev/null -w "%{http_code}\n" -s"
  stdout
    is expected to match /^200$/

Command "date"
  stdout
    is expected to match /JST/

User "ec2-user"
  is expected to exist

Package "git"
  is expected to be installed

Package "make"
  is expected to be installed

Package "gcc-c++"
  is expected to be installed

Package "patch"
  is expected to be installed

Package "libyaml-devel"
  is expected to be installed

Package "libffi-devel"
  is expected to be installed

Package "libicu-devel"
  is expected to be installed

Package "zlib-devel"
  is expected to be installed

Package "readline-devel"
  is expected to be installed

Package "libxml2-devel"
  is expected to be installed

Package "ImageMagick"
  is expected to be installed

Package "ImageMagick-devel"
  is expected to be installed

Package "libxslt-devel"
  is expected to be installed

Package "openssl-devel"
  is expected to be installed

Package "libcurl"
  is expected to be installed

Package "libcurl-devel"
  is expected to be installed

Package "curl"
  is expected to be installed

Port "80"
  is expected to be listening

Port "22"
  is expected to be listening

Finished in 22.29 seconds (files took 0.49747 seconds to load)
27 examples, 0 failures

CircleCI received exit code 0
```
