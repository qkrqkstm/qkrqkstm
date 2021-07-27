# README

注意: このフォルダは機密情報を含んでいますので決してバージョン管理下に置かないようにしてください。


```
private/
  etckeeper_id_rsa            # git-1.cocone.jp にログインするための SSH 秘密鍵 (etckeeper で使用)
  infra_password_hashed       # infra ユーザーパスワード (sha512)
  public_keys/
    nakano_daisuke            # 各従業員のSSH 公開鍵
    ..
  root_password_hashed_aws        # AWS root パスワード sha512
  root_password_hashed_nbp0       # NBP root パスワード md5 (IP アドレス末尾0)
  root_password_hashed_nbp[1-9]   # 同様に NBP root パスワード md5 IPアドレス末尾1-9
```
