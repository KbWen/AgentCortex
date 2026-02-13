---
name: compliance
type: rule
token_threshold: 150
default_model: flash
---

# 安全與合規規則 (08)

## 📋 核心原則

- **隱私優先**: 嚴禁在輸出中包含個人識別資訊 (PII)。
- **安全編碼**: 遵循 OWASP 安全開發原則。

## 🛡️ 隱私掩碼 (PII Masking)

- **Email**: `user@example.com` -> `u***@example.com`
- **電話**: `0912345678` -> `0912****78`
- **地址**: 僅保留城市與行政區，隱藏路徑與門牌。

## 🔐 敏感資訊保護

- **禁止輸出**: API Keys, Secrets, Passwords, Token。
- **檢測模式**: 偵測到 `sk-`, `ghp-`, `AIza` 等字串時必須立即遮蔽並警告使用者。

## ⚖️ 法律與合規

- **地區法規**: 遵循 GDPR (歐盟) 或 PDPA (台灣個資法) 之精神。
- **版權**: 禁止生成受版權保護的專有代碼，除非使用者明確授權。
