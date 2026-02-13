---
name: engineering_flow
type: workflow
token_threshold: 400
default_model: pro
multistage: true
---

# 工程開發與需求分析流程 (01)

## ⚖️ 執行策略

- **規劃階段 (Pro)**: 需求解析與架構設計。
- **實作階段 (Flash)**: 代碼編寫與單元測試。

## 📋 執行步驟

1. **需求解析**: 提取驗收標準 (AC) 與技術約束。
2. **架構設計**: 生成技術規範書 (Tech Spec)，包含檔案變動清單。
3. **編碼實作**: 依據規範實作邏輯，確保遵循 `99_memory.md` 中的技術棧。
4. **質量審查**: 使用 `skills/code_review.md` 檢查潛在漏洞。
