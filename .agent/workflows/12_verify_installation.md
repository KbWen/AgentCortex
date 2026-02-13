---
name: verify_installation
type: workflow
token_threshold: 100
default_model: flash
---

# 環境與配置自檢流程 (12)

## 📋 執行步驟

1. **目錄檢查**: 確認 `.agent/` 下子資料夾是否齊全。
2. **配置檢查**: 確認 `99_memory.md` 是否已由用戶更新。
3. **安全檢查**: 提醒用戶檢查檔案權限 (chmod 755/644) 與 Secrets 是否洩露。
4. **路由測試**: 模擬一個任務，確保 `00_meta_router.md` 可被正確讀取。
5. **輸出報告**: 本地配置的狀態摘要。
