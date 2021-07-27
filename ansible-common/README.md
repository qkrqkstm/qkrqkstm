# Ansible

## インストール

### Mac

homebrew, virutalenv は必須ではありませんが、システム環境を汚したくないのであれば

```console
$ brew install python
$ pip install virtualenv
$ virtualenv ~/.virtualenv/2.7/ansible
$ source ~/.virtualenv/2.7/ansible/bin/activate
(ansible)$ pip install ansible==2.3.1.0
```

### Linux

CentOS 7 を想定しています。

```console
$ sudo yum install python-virtualenv libffi-devel openssl-devel
$ virtualenv ~/.virtualenv/2.7/ansible
$ source ~/.virtualenv/2.7/ansible/bin/activate
(ansible)$ pip install ansible==2.3.1.0
```

## ローカルPCへのPlaybook用意

### マスターリポジトリをForkする

1. https://git-1.cocone.jp/infrateam/ansible-common にアクセス
2. Fork をクリック
3. Click to fork the project から自身のアカウントを選択する
4. https://git-1.cocone.jp/YOUR_NAME/ansible-common が出来上がる

### リポジトリのクローン

`YOUR_NAME` は各自のCOCONE ID に置き換えてください。

```console
$ git clone git@git-1.cocone.jp:YOUR_NAME/ansible-common.git
```

### マスターリポジトリを upstream リモートリポジトリとして登録

```console
$ cd ansible-common/
$ git remote add upstream git@git-1.cocone.jp:infrateam/ansible-common.git
```

### プライベートディレクトリをコピー

infra-ops-0.cocone サーバに置いてあるので SCP でダウンロードして使う。
このディレクトリをバージョン管理下に追加しないように注意！( .gitignore には書いてある)

```console
$ scp -pr infra@infra-ops-0.cocone:git/ansible-common/private ./
```


## ディレクトリレイアウト

```text
/
  ansible.cfg        # ... Ansible 設定ファイル

  playbooks/         # ... ansible-playbook で実行可能な yaml ファイルを置く
    common/
    ap/
    mongo/
    ..

  files/             # ... 静的なファイルを置く
    common/
    ap/
    mongo/
    ..

  templates/         # ... Jinja2 テンプレートファイルを置く
    common/
    ap/
    mongo/
    ..

  vars/              # ... 変数定義

  site.yml           # master playbook

  private/           # 機密情報をこのディレクトリ下においている ( .gitignore により除外。別の手法で共有する必要あり )
    public_keys/foo  # foo さんの SSH 公開鍵
    infra_password   # infra ユーザーのパスワード

```

## 実行方法

`ansible-playbook` コマンドを使用します。
初回は infra ユーザーがいないので AWS の場合は centos, NBP の場合は root でログインします。

```console
(ansible)$ ansible-playbook site.yml -u centos --key=/path/to/infra-private-key -i <inventory_file> -l <server_name>
(ansible)$ ansible-playbook site.yml -u root -k -i <inventory_file> -l <server_name>
```

2回め以降は infra ユーザーが作成されているはずなので、以下のオプションで実行します。

```console
(ansible)$ ansible-playbook site.yml -u infra -K -i <inventory_file> -l <server_name>
```

playbook を個別に実行したい場合は `playbooks/` 以下のファイルを指定する

```console
(ansible)$ ansible-playbook playbooks/common/user_infra.yml -u infra -K -i <inventory_file> -l <server_name>
```
