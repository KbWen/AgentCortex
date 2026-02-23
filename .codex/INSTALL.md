# AI Brain Superpowers Installer (Codex)

目標：讓 Codex（Web / App）快速載入本模板的 workflow-first 行為。

## 1) 安裝（在目標 repo 執行）

```bash
curl -fsSL <REPLACE_WITH_YOUR_TEMPLATE_RAW_DEPLOY_SCRIPT_URL> -o deploy_brain.sh
chmod +x deploy_brain.sh
./deploy_brain.sh .
```

> 若已經有本 repo，可直接執行：`./deploy_brain.sh .`

## 2) 驗證

```bash
./.agent/superpowers/validate.sh
```

## 3) Codex 開場指令（建議貼上）

```text
請先執行 /bootstrap。
接著用 /brainstorm 釐清方案，再用 /write-plan 產出可執行計畫。
未通過 /review 與 /test 前，不可宣告完成。
```
