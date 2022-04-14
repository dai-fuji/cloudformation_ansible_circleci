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