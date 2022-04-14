# Ansible
パッケージのインストールやリモートリポジトリのクローン、プロセスの制御等をコード化することで自動化。各種モジュールを使用することで冪等性を維持することが容易になる。シェルスクリプトにて処理を記述する際の冪等性の確保はユーザーが担う必要がある。
<br>
<br>

## ジョブ概要
***
- パッケージのインストール
- rubyの環境構築
- railsの環境構築
- railsアプリケーションのデプロイ
- APサーバー、WEBサーバーのインストールと起動
<br>
<br>

## Directory
***
```
├── ansible
│   ├── Readme.md
│   ├── inventory.yml
│   ├── playbook.yml
│   └── roles
│       ├── general
│       │   └── tasks
│       │       └── main.yml
│       ├── nginx
│       │   └── tasks
│       │       └── main.yml
│       ├── node_yarn
│       │   └── tasks
│       │       └── main.yml
│       ├── rails
│       │   └── tasks
│       │       └── main.yml
│       ├── ruby
│       │   └── tasks
│       │       └── main.yml
│       └── setup_server
│           ├── handlers
│           │   └── main.yml
│           ├── tasks
│           │   └── main.yml
│           └── templete
│               ├── database.yml.j2
│               ├── rails.conf.j2
│               ├── unicorn.rake.j2
│               └── unicorn.rb.j2
│
├── ansible.cfg
```
<br>
<br>

## 各ディレクトリやファイルについて
***

- inventory.yml・・・対象のホスト情報を定義。
- roles/***/main.yml・・・実行内容を定義。rolesにより分割することで可読性を確保。
- playbook.yml・・・実行ファイル本体。実際に実行するホストやroleを定義。
- handlers/main.yml・・・notifyを記述したジョブに変更があった場合にhandlers内のタスクが実行される
- ansible.cfg・・・オプション設定を記述。初回SSH接続時の警告無視、ログファイルの出力先を記述。
<br>
<br>

## コマンドやtips
***
- 変数の利用  
playbook.ymlのvars以下に変数名と値を記述することでジョブの定義に利用できる。変数の展開は`{{ 変数名 }}`と記述する。  

- ローカル実行  
ローカルマシンにAnsibleをインストールすることで単独実行することも可能。 
その際はssh_configファイルを作成し、対象のホスト情報と秘密鍵を指定する。

- コマンド  
`$ ansible-playbook -i inventoryファイルパス playbookファイルパス (--オプション)　`   
`--check` : ドライラン（対象ホストに変更を加えない状態での実行）  
`--syntax-check`：構文チェック