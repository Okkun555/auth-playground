## 検証方法
### Basic認証
```terminaloutput
# 認証なしでアクセス → 401
curl -i http://localhost:3000/basic_auth

# 認証ありでアクセス → 成功
# -u オプションをつける事でcurlが自動でBase64エンコード & ヘッダーをつけてくれる
curl -i -u username:password http://localhost:3000/basic_auth
```

### API Key
API Keyを事前に作成しておき、APIを叩くリクエストのヘッダーに含めて送信する<br>
app2のAPI_KEYの値を変えるとリクエストに失敗する
```terminaloutput
curl -s http://localhost:3001/call_main_system
```