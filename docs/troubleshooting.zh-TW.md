# 疑難排解

## 只看到黑色視窗，沒有看到資料夾選擇視窗

資料夾選擇視窗可能被終端機視窗擋住。

新版啟動器已加入 TopMost owner form，會盡量把資料夾選擇視窗顯示在最前面。若仍然看不到，請使用 Alt+Tab 切換視窗，或先移開黑色終端機視窗確認後方是否有選擇視窗。

## 顯示找不到 AWOS.md

請確認以下檔案存在：

```text
C:\AWOS_WORKSPACE\AWOS.md
```

如果沒有，請先建立 `C:\AWOS_WORKSPACE`，再把本專案的 `AWOS.md` 複製到該位置。

## 顯示找不到 codex 指令

代表系統目前找不到 Codex CLI。

請確認 Codex CLI 已安裝、已登入，且 `codex` 指令已加入 PATH。你可以先開啟一般終端機，執行：

```bat
codex --version
```

如果這個指令也失敗，請先處理 Codex CLI 安裝或 PATH 設定。

## 不確定 .bat 是否安全

不要執行來路不明的 `.bat` 檔。你可以先用文字編輯器打開 `start-awos-codex.bat` 檢查內容。

如果仍不放心，可以依照 `README.zh-TW.md` 的說明自行建立啟動器。
