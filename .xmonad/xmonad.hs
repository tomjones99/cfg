import XMonad
import XMonad.Hooks.DynamicLog

-- main
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- status bar
myBar = "xmobar"

-- PP 
myPP = xmobarPP { ppCurrent = xmobarColor "492942" "" . wrap "<" ">" }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig 

