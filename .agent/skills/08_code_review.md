---
name: code_review
type: skill
token_threshold: 200
default_model: pro
---

# 技能：專業代碼審查與漏洞掃描 (08)

## 📋 審查重點 (OWASP Top 10)

1. **注入攻擊 (Injection)**: 檢查 SQL, NoSQL, OS Command 注入。
2. **無效的身分驗證**: 檢查 Session 管理與登入邏輯。
3. **敏感資料外洩**: 搜尋硬編碼的 Secrets (Passwords, Keys)。
4. **失效的存取控制**: 權限校驗是否嚴謹。
5. **跨站腳本 (XSS)**: 檢查輸入過濾與輸出轉義。

## 🔍 Secrets 掃描特徵

- `apiKey`, `secret`, `password`, `token`
- `AKIA...` (AWS), `AIza...` (Google), `sk-...` (OpenAI)
- `.env` 檔案洩露檢查。

## 🏗️ 重構建議

- **安全性優化**: 提供參數化查詢範例。
- **效能優化**: 識別重複計算或資源洩漏。
- **可讀性**: 變數命名與邏輯簡化。
