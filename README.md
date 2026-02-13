# Personal AI OS Template v1.1

這是一個跨平台 (Antigravity / Cursor / Claude) 的 AI 協作系統模板。

## 🚀 快速開始

1. **GitHub**: 點擊 "Use this template" 建立新專案。
2. **本地部署**: 執行 `./deploy_brain.sh <你的舊專案路徑>`。

## ⚙️ 設定方式

- **Antigravity / Google IDX**: 複製 `SYSTEM_INSTRUCTION.txt` 到設定。
- **Claude Projects**: 上傳 `.agent` 資料夾並貼上 `SYSTEM_INSTRUCTION.txt`。
- **Cursor**: 自動支援 (透過 `.cursorrules`)。

## 🧠 大腦結構

- **Router**: `00_meta_router.md` (意圖判斷)
- **Engineering**: Architect (規劃) / Executor (執行) / Reviewer (檢查)
- **Content**: IG (知識方塊) / Blog (SEO)
