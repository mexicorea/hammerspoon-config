hs.hotkey.bind({'cmd', 'shift', 'ctrl'}, 'M', function()
    hs.application.launchOrFocus('Notes')
end)

hs.hotkey.bind({'cmd', 'shift', 'ctrl'}, 'C', function()
    hs.application.launchOrFocus('Google Chrome')
end)

hs.hotkey.bind({'cmd', 'shift', 'ctrl'}, 'V', function()
    hs.application.launchOrFocus('Visual Studio Code')
end)

hs.hotkey.bind({'cmd', 'shift', 'ctrl'}, 'T', function()
    hs.application.launchOrFocus('iTerm')
end)

hs.hotkey.bind({'cmd', 'shift', 'ctrl'}, 'D', function()
    hs.application.launchOrFocus('DBeaver')
end)

hs.hotkey.bind({'cmd', 'shift', 'ctrl'}, 'S', function()
    hs.application.launchOrFocus('Slack')
end)

hs.hotkey.bind({'cmd', 'shift', 'ctrl'}, 'N', function()
    hs.application.launchOrFocus('Notion')
end)

hs.hotkey.bind({'cmd', 'shift', 'ctrl'}, 'G', function()
    hs.application.launchOrFocus('Gather')
end)

hs.hotkey.bind({'cmd', 'shift', 'ctrl'}, 'P', function()
    hs.application.launchOrFocus('Postman')
end)

hs.hotkey.bind({'cmd', 'shift', 'ctrl'}, 'Left', function()
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

hs.hotkey.bind({'cmd', 'shift', 'ctrl'}, 'Right', function()
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

hs.hotkey.bind({'cmd', 'shift', 'ctrl'}, 'Up', function()
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
