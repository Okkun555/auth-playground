## 検証方法
### Basic認証
```terminaloutput
# 認証なしでアクセス → 401
curl -i http://localhost:3000/basic_auth

# 認証ありでアクセス → 成功
# -u オプションをつける事でcurlが自動でBase64エンコード & ヘッダーをつけてくれる
curl -i -u username:password http://localhost:3000/basic_auth
```