import XMonad
-- Config
import XMonad.Config.Azerty
-- Actions
import XMonad.Actions.CopyWindow
-- Hooks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
-- Layouts
import XMonad.Layout.Spiral
import XMonad.Layout.Spacing
import XMonad.Layout.Maximize
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.SimplestFloat
import XMonad.Layout.ThreeColumns
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
-- Utils
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86
import System.IO

myTerminal = "st"

myWorkspaces :: [String]
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]

myManageHook = composeAll
    [ manageDocks
    , className =? "Gimp"				--> doFloat
    , className =? "Vncviewer"			--> doFloat
    , className =? "mpv"				--> doFloat
    , className =? "firefox"			--> doShift (myWorkspaces !! 1)
    , className =? "Brave-browser"		--> doShift (myWorkspaces !! 1)
    , title     =? "newsboat"           --> doShift (myWorkspaces !! 4)
    , title     =? "weechat"            --> doShift (myWorkspaces !! 7)
    , isFullscreen                      --> doFullFloat
    , isDialog                          --> doCenterFloat
    ]

myStartupHooks = do
    spawnOnce "setxkbmap -layout fr,ar -option 'grp:alt_shift_toggle'"
    spawnOnce "xsetroot -cursor_name left_ptr"
    spawnOnce "setwallpaper"
    spawnOnce "xcompmgr"
    spawnOnce "numlockx on"
    spawnOnce "synclient TapButton1=1"
    spawnOnce "xautolock -time 10 -locker 'lockscreen -l dimblur'"
    spawnOnce "xset +fp '$HOME/.local/share/fonts' && xset fp rehash"
    spawnOnce "redshift"
    spawnOnce "dunstrun"
    ewmhDesktopsStartup >> setWMName "LG3D"

myLayout = tiled ||| Mirror tiled ||| grid ||| threeCol ||| threeRow ||| full ||| floats
  where
-- default tiling algorithm partitions the screen into two panes
    tiled   =  smartSpacing 4 $ Tall nmaster delta ratio

-- The default number of windows in the master pane
    nmaster = 1

-- Default proportion of screen occupied by master pane
    ratio   = 1/2

-- Percent of screen to increment by when resizing panes
    delta   = 3/100

    --full = (fullscreenFloat . fullscreenFull . noBorders) Full
    full =  noBorders Full

    floats   = simplestFloat

    grid     = smartSpacing 4 $ mkToggle (single MIRROR) $ Grid (16/10)

    spirals  = smartSpacing 4 $ spiral (6/7)

    threeCol = smartSpacing 4 $ ThreeCol 1 (3/100) (1/2)

    threeRow = smartSpacing 4
               -- Mirror takes a layout and rotates it by 90 degrees.
               -- So we are applying Mirror to the ThreeCol layout.
               $ Mirror
               $ ThreeCol 1 (3/100) (1/2)

myKeys =
        [ ((mod4Mask, xK_b), spawn "$BROWSER")
        , ((mod4Mask, xK_d), spawn "dmenu_run")
        , ((mod4Mask, xK_f), withFocused (sendMessage . maximizeRestore))
        , ((mod4Mask .|. shiftMask, xK_f), sendMessage ToggleStruts)
        , ((mod4Mask, xK_m), spawn "$TERMINAL -e neomutt")
        , ((mod4Mask .|. shiftMask, xK_m), spawn "$TERMINAL -e ncmpcpp")
        , ((mod4Mask, xK_n), spawn "$TERMINAL -e newsboat")
        --, ((mod4Mask .|. shiftMask, xK_n), spawn "$TERMINAL -e ncmpcpp")
        , ((mod4Mask, xK_p), spawn "displayselect")
        , ((mod1Mask, xK_p), spawn "volman toggle")
        , ((mod4Mask, xK_q), spawn "prompt 'Shutdown ?' 'systemctl poweroff'")
        , ((mod4Mask .|. shiftMask, xK_p), spawn "mpd-toggle")
        , ((mod4Mask, xK_r), spawn "$TERMINAL -e ranger")
		, ((mod4Mask, xK_t), spawn "$TERMINAL -e tremc")
		, ((mod4Mask .|. shiftMask, xK_t), spawn "td-toggle")
        , ((mod4Mask, xK_w), spawn "$TERMINAL -e nmtui")
        , ((mod4Mask, xK_x), spawn "lockscreen -l dimblur")
        --, ((mod4Mask .|. shiftMask, xK_x), spawn "lockscreen -l dimblur")
        , ((mod1Mask, xK_F4), kill1)
        , ((mod4Mask, xK_F5), spawn "xmonad --recompile; xmonad --restart")
        , ((mod4Mask, xK_F9), spawn "dmenumount")
        , ((mod4Mask, xK_F10), spawn "dmenuumount")
        , ((mod4Mask .|. shiftMask, xK_r), spawn "xmonad --restart")
        , ((mod4Mask, xK_Return), spawn "$TERMINAL")
        , ((mod4Mask .|. shiftMask, xK_Return), spawn "$TERMINAL")
        , ((mod4Mask, xK_BackSpace), spawn "prompt 'Reboot ?' 'systemctl reboot'")
        , ((mod4Mask, xK_Escape), spawn "dmenushutdown")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Insert), spawn "dmenurecord")
        , ((0, xK_Print), spawn "screenshot")
        , ((0, xF86XK_AudioLowerVolume), spawn "volman dec")
        , ((0, xF86XK_AudioRaiseVolume), spawn "volman inc")
        , ((0, xF86XK_AudioMute), spawn "volman mute")
        , ((mod4Mask, xF86XK_AudioLowerVolume), spawn "volman prev")
        , ((mod4Mask, xF86XK_AudioRaiseVolume), spawn "volman next")
        , ((mod4Mask, xF86XK_AudioMute), spawn "volman stop")
		, ((0, xF86XK_MonBrightnessUp), spawn "blman inc")
        , ((0, xF86XK_MonBrightnessDown), spawn "blman dec")
		, ((mod4Mask, xF86XK_MonBrightnessUp), spawn "blman set 100")
        , ((mod4Mask, xF86XK_MonBrightnessDown), spawn "blman set 15")
        ]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ docks azertyConfig
        { manageHook = myManageHook <+> manageHook azertyConfig -- make sure to include myManageHook definition from above
        , handleEventHook    = handleEventHook azertyConfig <+> fullscreenEventHook
        , layoutHook = smartBorders . avoidStruts $ myLayout
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
						, ppCurrent = xmobarColor "#81a1c1" ""                -- Current workspace in xmobar
                        , ppHidden = xmobarColor "#d8dee9" ""                 -- Hidden workspaces in xmobar
                        , ppVisible = xmobarColor "#81a1c1" "" . wrap "[" "]" -- Visible but not current workspace
                        --, ppHiddenNoWindows = xmobarColor "#F07178" ""        -- Hidden workspaces (no windows)
                        , ppUrgent = xmobarColor "#bf616a" "" . wrap "!" "!"  -- Urgent workspace
						, ppLayout = xmobarColor "#eceff4" ""
                        , ppTitle = xmobarColor "#eceff4" "" . shorten 50     -- Title of active window in xmobar
                        , ppSep =  "<fc=#c0c0c0> | </fc>"                     -- Separators in xmobar
                        --, ppExtras  = [windowCount]                           -- # of windows current workspace
                        , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , terminal = myTerminal
        , workspaces = myWorkspaces
        , borderWidth = 2
		, normalBorderColor = "#565656"
		, focusedBorderColor = "#2897ff"
		, startupHook = myStartupHooks
        } `additionalKeys` myKeys
