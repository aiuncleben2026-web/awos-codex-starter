# AWOS Codex Starter

## 這是什麼？

這是一個給 ChatGPT + Codex CLI 使用者的小工具。它不是 Claude Code，也不是官方的 CLAUDE.md 功能，而是一個用 Windows 批次檔與 Codex CLI 組合出來的啟動流程。

它的目的很簡單：

讓 Codex CLI 每次啟動時，先讀取一份固定的 AWOS.md 規則檔，再進入指定的任務資料夾等待指令。

這樣可以模擬類似 CLAUDE.md 的效果，讓 Codex 在每次任務開始前先知道使用者的基本規則、工作方式與安全限制。

## 適合誰使用？

- 已經會基本使用 Codex CLI 的人
- 想讓 Codex 每次開工前先讀一份規則檔的人
- 想要把 ChatGPT 產出的 prompt 丟給 Codex 執行的人
- 想要用本機資料夾管理 AI 工作流的人
- 不想每次都手動複製同一段初始化規則的人

如果你完全沒有安裝過 Codex CLI，請先完成 Codex CLI 安裝與登入，本工具不負責安裝 Codex CLI。

## 它會做什麼？

1. 使用者雙擊 `start-awos-codex.bat`
2. 系統跳出資料夾選擇視窗
3. 使用者選擇這次要讓 Codex 操作的任務資料夾
4. 啟動器開啟 Codex CLI
5. Codex 被要求讀取 `C:\AWOS_WORKSPACE\AWOS.md`
6. Codex 回報已讀取規則
7. Codex 顯示目前工作資料夾
8. Codex 等待下一個任務

## 重要資料夾規則

目前這個版本的 AWOS.md 路徑是固定的：

```text
C:\AWOS_WORKSPACE\AWOS.md
```

使用者必須先在 C 槽建立資料夾：

```text
C:\AWOS_WORKSPACE
```

然後把 `AWOS.md` 放進去。

如果資料夾或檔案不存在，啟動器可能會失敗，或 Codex 會無法讀取規則檔。

`start-awos-codex.bat` 可以放在桌面，方便雙擊啟動。

任務資料夾不一定要放在桌面，可以放在 C 槽、D 槽或其他位置。啟動時會讓使用者自己選。

## 快速開始

1. 下載這個專案
2. 確認已安裝 Codex CLI
3. 在 C 槽建立 `C:\AWOS_WORKSPACE`
4. 把 `AWOS.md` 放到 `C:\AWOS_WORKSPACE\AWOS.md`
5. 把 `start-awos-codex.bat` 放到桌面，或保留在專案資料夾中
6. 雙擊 `start-awos-codex.bat`
7. 選擇這次要操作的任務資料夾
8. 等 Codex 讀取 `AWOS.md` 並回報完成
9. 開始輸入任務

## 關於資料夾選擇視窗

啟動後會先跳出資料夾選擇視窗。

新版啟動器已經加入置頂處理，會盡量讓資料夾選擇視窗顯示在最前面。

但因為不同 Windows Terminal / PowerShell / 桌面環境行為可能不同，如果你雙擊後只看到黑色終端機視窗，請先不要急著關閉。請檢查資料夾選擇視窗是否被黑色視窗擋在後面，也可以使用 Alt+Tab 切換視窗查看。

## 安全提醒

- 不要執行來路不明的 `.bat` 檔
- 建議先用文字編輯器打開 `.bat` 檢查內容
- 如果不放心，可以照 README 自己建立 `.bat` 檔
- `AWOS.md` 只是規則檔，不應放入密碼、API Key、私密金鑰
- Codex 仍可能修改檔案，請在重要資料夾操作前先備份或使用 Git

## 如何自己修改 AWOS.md？

`AWOS.md` 是你自己的規則檔，可以依照自己的工作方式修改。

例如可以放入這類規則：

- 不可刪除任何檔案，除非使用者明確要求
- 不可假裝完成任務
- 工具不存在或權限不足時必須明確回報
- 新增、修改、刪除檔案或高風險操作前，需要再次確認目前工作資料夾

## 如何自己製作 .bat？

如果你不想使用本專案提供的 `start-awos-codex.bat`，也可以依照 README 自己建立。重點是：

1. 使用 PowerShell 開啟資料夾選擇視窗
2. 把選到的資料夾當成 Codex CLI 的工作目錄
3. 啟動 `codex`
4. 要求 Codex 讀取 `C:\AWOS_WORKSPACE\AWOS.md`

README 不放過長的一行式腳本。請直接參考 `start-awos-codex.bat`，它是較容易閱讀與維護的實作。

## 常見問題

**Q1: 這是官方功能嗎？**  
A: 不是。這是用 Windows 批次檔、PowerShell 與 Codex CLI 組合出來的工作流。

**Q2: 這跟 Claude Code 的 CLAUDE.md 一樣嗎？**  
A: 不完全一樣。CLAUDE.md 是 Claude Code 的原生機制；這個方法是用啟動流程讓 Codex 在開始前讀取 AWOS.md，效果接近，但不是官方內建的同一種功能。

**Q3: AWOS.md 一定要叫這個名字嗎？**  
A: 目前這版是寫死讀取 `C:\AWOS_WORKSPACE\AWOS.md`，所以檔名與路徑要一致。進階使用者可以自行修改 `.bat`。

**Q4: start-awos-codex.bat 一定要放在哪裡？**  
A: 不一定。建議放桌面方便使用。任務資料夾會在啟動時另外選擇。

**Q5: 為什麼我看到黑色視窗但沒有看到資料夾選擇視窗？**  
A: 資料夾選擇視窗可能被擋在後面。新版已盡量置頂，但仍建議用 Alt+Tab 檢查。

**Q6: 我可以把這個拿去改成自己的版本嗎？**  
A: 可以。請依照 LICENSE 使用。

## 授權

本專案使用 MIT License。請參考 `LICENSE`。
