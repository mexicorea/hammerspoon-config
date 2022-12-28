local hotkeys = {'cmd', 'shift', 'ctrl'}

hs.hotkey.bind(hotkeys, 'M', function()
    hs.application.launchOrFocus('Notes')
end)

hs.hotkey.bind(hotkeys, 'C', function()
    hs.application.launchOrFocus('Google Chrome')
end)

hs.hotkey.bind(hotkeys, 'V', function()
    hs.application.launchOrFocus('Visual Studio Code')
end)

hs.hotkey.bind(hotkeys, 'T', function()
    hs.application.launchOrFocus('iTerm')
end)

hs.hotkey.bind(hotkeys, 'D', function()
    hs.application.launchOrFocus('DBeaver')
end)

hs.hotkey.bind(hotkeys, 'S', function()
    hs.application.launchOrFocus('Slack')
end)

hs.hotkey.bind(hotkeys, 'N', function()
    hs.application.launchOrFocus('Notion')
end)

hs.hotkey.bind(hotkeys, 'G', function()
    hs.application.launchOrFocus('Gather')
end)

hs.hotkey.bind(hotkeys, 'P', function()
    hs.application.launchOrFocus('Postman')
end)

hs.hotkey.bind(hotkeys, 'F', function()
    hs.application.launchOrFocus('Figma')
end)

hs.hotkey.bind(hotkeys, 'K', function()
    hs.application.launchOrFocus('KakaoTalk')
end)

hs.hotkey.bind(hotkeys, 'L', function()
    hs.application.launchOrFocus('Line')
end)

hs.hotkey.bind(hotkeys, 'B', function()
    hs.application.launchOrFocus('Bitwarden')
end)

hs.hotkey.bind(hotkeys, 'Left', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(hotkeys, 'Right', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(hotkeys, 'Up', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config reloaded")
