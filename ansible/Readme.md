## EC2インスタンスにRailsの環境構築及びアプリケーションのデプロイを実行する 
### 1.ディレクトリ階層
---

```
root
├── Readme.md
├── ansible.cfg
├── inventory.yml
├── playbook.yml
├── roles
│   ├── general
│   │   └── tasks
│   │       └── main.yml
│   ├── nginx
│   │   └── tasks
│   │       └── main.yml
│   ├── node_yarn
│   │   └── tasks
│   │       └── main.yml
│   ├── rails
│   │   └── tasks
│   │       └── main.yml
│   ├── ruby
│   │   └── tasks
│   │       └── main.yml
│   └── setup_server
│       ├── handlers
│       │   └── main.yml
│       ├── tasks
│       │   └── main.yml
│       └── templete
│           ├── database.yml.j2
│           ├── rails.conf.j2
│           ├── unicorn.rake.j2
│           └── unicorn.rb.j2
└── ssh_config
```
### 2.各ディレクトリ（ファイル）について
---
- ansible.cfg・・・オプション設定を記述
- inventry・・・実行するホスト情報を管理
- playbook・・・実行内容を記述（メイン）
- roles・・・実行内容を任意の領域で分割（サブ）
- ssh_config・・・ホストにSSH接続するための記述*非追跡ファイル