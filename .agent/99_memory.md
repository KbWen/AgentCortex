# MEMORY MODULE v2.6.5 (INDUSTRIAL-GRADE)

## ⚖️ 效能與成本控制

- **OPERATING_MODE**: FLASH_FIRST        # 優先由 Flash 啟動，降低成本
- **MAX_TOKEN_FLASH**: 300            # 建議閾值。若您信任模型的長文本能力，可調高至 1000+
- **CONFIDENCE_BRAKE_THRESHOLD**: 0.7

## 🧠 用戶偏好

- **互動語言**: 絕對優先使用【繁體中文 (台灣)】。
- **判斷標準**: 您可以藉由調整 `MAX_TOKEN_FLASH` 來減少「升級提示」的頻率。若設為 9999，則 Flash 會嘗試處理所有大小的任務，直到它真的卡住為止。

[...技術棧與原則 同前版本...]
