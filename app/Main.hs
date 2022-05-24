{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified GI.Gtk as Gtk
import Data.GI.Base
import System.Directory

main :: IO ()
main = do
  Gtk.init Nothing

-- Define variables
  win <- Gtk.windowNew Gtk.WindowTypeToplevel               -- Set the variable win to be a new GTK window
  home <- getHomeDirectory
  imgLogout <- Gtk.imageNewFromFile $ home ++ "/commandr/image/logout.png"
  imgShutdown <- Gtk.imageNewFromFile $ home ++ "/commandr/image/shutdown.png"
  imgCancel <- Gtk.imageNewFromFile $ home ++ "/commandr/image/cancel.png"
  imgSuspend <- Gtk.imageNewFromFile $ home ++ "/commandr/image/suspend.png"
  imgHibernate <- Gtk.imageNewFromFile $ home ++ "/commandr/image/hibernate.png"
  imgRestart <- Gtk.imageNewFromFile $ home ++ "/commandr/image/restart.png"

  Gtk.setContainerBorderWidth win 10                        -- Set the border width of win
  Gtk.setWindowTitle win "Commandr"                         -- Set the window title of win
  Gtk.setWindowResizable win False                          -- Determines if win can be resized
  Gtk.setWindowDefaultWidth win 750                         -- Default window width
  Gtk.setWindowDefaultHeight win 225                        -- Default window height
  Gtk.setWindowWindowPosition win Gtk.WindowPositionCenter  --Sets the window's position on the screen
  Gtk.windowSetDecorated win False                          -- Disable window decorations

  Gtk.onWidgetDestroy win Gtk.mainQuit
  #showAll win
  Gtk.main
