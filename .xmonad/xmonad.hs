import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

-- main
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- status bar
myBar = "xmobar"

-- PP
myPP = xmobarPP { ppCurrent = xmobarColor "#ff0000" "" . wrap "<" ">"
                , ppLayout = xmobarColor "#ff0000" ""
                , ppSep = xmobarColor "#93a1a1" "" " | "
                }

-- show/hide status bar
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- move applications to a given workspace
myManageHook = composeAll
    [ className =? "Chromium" --> doShift "2:web"
    , manageDocks
    ]

-- workspaces
myWorkspaces = ["1:dev", "2:web", "3:mail", "4", "5", "6", "7", "8", "9" ]

-- launch programs on startup
myStartupHook = do
    spawnOn "2:web" "chromium"

-- config
myConfig = defaultConfig
    { workspaces = myWorkspaces
    , manageHook = myManageHook <+> manageHook defaultConfig
    , startupHook = myStartupHook
    }


