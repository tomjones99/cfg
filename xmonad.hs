import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

-- main
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- status bar
myBar = "xmobar"

-- PP
myPP = xmobarPP { ppCurrent = xmobarColor "492942" "" . wrap "<" ">" }

-- show/hide status bar
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- move applications to a given workspace
myManageHook = composeAll
    [ className =? "Chromium" --> doShift "2:web"
    , manageDocks
    ]

-- config
myConfig = defaultConfig
    {
    workspaces = ["1:dev", "2:web", "3:mail" ],
    manageHook = myManageHook <+> manageHook defaultConfig
    }


