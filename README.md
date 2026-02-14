# Personal AI OS v3.0 (Pragmatic Lean)
>
> **極致省錢、專為 Google Antigravity 打造的研發大腦。**

## 🎯 核心理念

別再讓複雜的「自動路由」浪費您的 Token。v3.0 捨棄了 40 個繁重的檔案，回歸本質：**一個極簡的核心 Prompt + 一份給人類的決策指南。**

每次對話節省超過 **90%** 的 System Prompt Token，讓您每一分額度都用在代碼實作上。

## 🚀 3 步快速部署 (Google Antigravity)

1. **部署**: 在專案目錄執行 `./deploy_brain.sh .` (將此 repo 中的 `.agent/` 複製過去)
2. **初始化**: 打開 `.agent/AGENT.md`，填入您的技術棧 (Frontend/Backend/Database)。
3. **啟動**: 確保 IDE 模型設為 **Gemini 1.5 Flash**，然後開始對話。

## 🏗️ v3.0 簡約架構

- **`.agent/AGENT.md`**: 唯一的核心 Prompt。包含語言偏好、代碼風格、安全規則 (PII/Secrets)。
- **`MODEL_GUIDE.md`**: 給「您」看的指南。告訴您何時該省錢 (Flash)，何時該用專業 (Pro)。

## 🔗 整合舊專案 (Integration Guide)

如果您想將此大腦加入既有的 GitHub Repo：

- **方法 A**: 直接將 `.agent/AGENT.md` 複製到該專案根目錄。
- **方法 B**: 在 Antigravity 中對 AI 說：「請幫我在 `.agent/AGENT.md` 建立一份研發守則，遵循 v3.0 Pragmatic Lean 規範。」

## ⚖️ 模型策略

| 任務 | 推薦模型 | 說明 |
| :--- | :--- | :--- |
| **80% 日常** | **Gemini 1.5 Flash** | 翻譯、寫測試、單檔修改、格式化、代碼搬運。 |
| **20% 關鍵** | **Claude 3.5 Sonnet / Pro** | 架構設計、大規模重構、複雜 Bug 調查、安全審核。 |

---
詳細變更請見 [CHANGELOG.md](./CHANGELOG.md)
