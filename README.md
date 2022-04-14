## What is this?
***
AWSの環境構築からRailsアプリケーションのデプロイとテストコード実行を自動化。  
以下のツールを使用しています。
- Cloudformation
- Ansible
- Servespec
- CircleCI
<br>
<br>

## Overview
***
![全体図](/image/circleci_overview.jpg)
<br>
<br>

## Direcroty
***
```
document_root
│
├── README.md
│
│── .circleci
│   │── config.yml
│   └── Readme.md
│
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
│
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
│
└── service
    ├── ec2.yml
    ├── infrastructure.yml
    ├── rds.yml
    ├── s3.yml
    └── vpc.yml
```
<br>
<br>

## Details
***
ひとつ下のディレクトリ階層のReadmeを参照