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
<br>
<br>

## 実行結果
***
```
PLAY [all] *********************************************************************

TASK [Gathering Facts] *********************************************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [general : yum update] ****************************************************
ok: [13.112.38.53]
ok: [35.78.146.159]

TASK [general : install general packages] **************************************
ok: [13.112.38.53]
ok: [35.78.146.159]

TASK [node_yarn : check if nodejs already installed] ***************************
ok: [13.112.38.53]
ok: [35.78.146.159]

TASK [node_yarn : add repository for nodejs] ***********************************
changed: [35.78.146.159]
changed: [13.112.38.53]

TASK [node_yarn : install nodejs] **********************************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [node_yarn : install yarn] ************************************************
ok: [13.112.38.53]
ok: [35.78.146.159]

TASK [ruby : check was rbenv already installed] ********************************
ok: [13.112.38.53]
ok: [35.78.146.159]

TASK [ruby : check was ruby-build already installed] ***************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [ruby : check was ruby-version already installed] *************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [ruby : install rbenv] ****************************************************
skipping: [35.78.146.159]
skipping: [13.112.38.53]

TASK [ruby : install ruby-build] ***********************************************
skipping: [35.78.146.159]
skipping: [13.112.38.53]

TASK [ruby : register path and update bash] ************************************
skipping: [35.78.146.159]
skipping: [13.112.38.53]

TASK [ruby : ruby install] *****************************************************
skipping: [35.78.146.159]
skipping: [13.112.38.53]

TASK [ruby : ruby set global] **************************************************
skipping: [35.78.146.159]
skipping: [13.112.38.53]

TASK [rails : check has directory var/www] *************************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [rails : check has Gemfile] ***********************************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [rails : check has directory rails-app] ***********************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [rails : check bundler 2.3.11 installed 1] ********************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [rails : install mysql] ***************************************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [rails : create dir for rails-app] ****************************************
skipping: [35.78.146.159]
skipping: [13.112.38.53]

TASK [rails : clone rails-app] *************************************************
skipping: [35.78.146.159]
skipping: [13.112.38.53]

TASK [rails : update bundler] **************************************************
skipping: [35.78.146.159]
skipping: [13.112.38.53]

TASK [rails : check bundler 2.3.11 installed 2] ********************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [rails : install gems] ****************************************************
changed: [13.112.38.53]
changed: [35.78.146.159]

TASK [rails : install webpacker] ***********************************************
changed: [13.112.38.53]
changed: [35.78.146.159]

TASK [nginx : ckeck installed nginx] *******************************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [nginx : install nginx] ***************************************************
skipping: [35.78.146.159]
skipping: [13.112.38.53]

TASK [setup_server : is running unicorn] ***************************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [setup_server : is running nginx] *****************************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [setup_server : has database.yml] *****************************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [setup_server : provide database.yml] *************************************
skipping: [35.78.146.159]
skipping: [13.112.38.53]

TASK [setup_server : provide unicorn.rb] ***************************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [setup_server : provide unicorn.rake] *************************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [setup_server : create dir for unicorn.sock] ******************************
ok: [35.78.146.159]
ok: [13.112.38.53]

TASK [setup_server : provide rails.conf] ***************************************
ok: [13.112.38.53]
ok: [35.78.146.159]

TASK [setup_server : start unicorn] ********************************************
skipping: [35.78.146.159]
skipping: [13.112.38.53]

TASK [setup_server : start nginx] **********************************************
skipping: [35.78.146.159]
skipping: [13.112.38.53]

PLAY RECAP *********************************************************************
13.112.38.53               : ok=26   changed=3    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0   
35.78.146.159              : ok=26   changed=3    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0 
```