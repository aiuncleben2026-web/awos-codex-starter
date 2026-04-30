# 使用教學

這份文件補充 `README.zh-TW.md` 的快速開始流程。第一次使用時，請先確認你已經可以在終端機執行 `codex`。

## 準備 AWOS.md

目前啟動器固定要求 Codex 讀取：

```text
C:\AWOS_WORKSPACE\AWOS.md
```

請先建立資料夾：

```text
C:\AWOS_WORKSPACE
```

然後把本專案提供的 `AWOS.md` 放到該位置。

## 放置啟動器

`start-awos-codex.bat` 可以放在專案資料夾，也可以放在桌面。它的位置不等於任務資料夾的位置。

每次啟動時，批次檔都會要求你選擇這次要讓 Codex 操作的任務資料夾。

## 啟動流程

1. 雙擊 `start-awos-codex.bat`
2. 在資料夾選擇視窗選擇任務資料夾
3. 等待 Codex CLI 啟動
4. 確認 Codex 已讀取 `C:\AWOS_WORKSPACE\AWOS.md`
5. 開始輸入任務

## 建議用法

- 每個任務使用獨立資料夾，降低誤改其他檔案的機率。
- 重要資料夾先建立 Git repository 或先備份。
- 修改 `AWOS.md` 時，只放工作規則，不要放密碼、API Key 或私密金鑰。
