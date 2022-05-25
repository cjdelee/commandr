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
  grid <- Gtk.gridNew
  imgLogout <- Gtk.imageNewFromFile $ home ++ "/commandr/image/logout.png"
  imgShutdown <- Gtk.imageNewFromFile $ home ++ "/commandr/image/shutdown.png"
  imgCancel <- Gtk.imageNewFromFile $ home ++ "/commandr/image/cancel.png"
  imgSuspend <- Gtk.imageNewFromFile $ home ++ "/commandr/image/suspend.png"
  imgHibernate <- Gtk.imageNewFromFile $ home ++ "/commandr/image/hibernate.png"
  imgRestart <- Gtk.imageNewFromFile $ home ++ "/commandr/image/restart.png"
  labelLogout <- Gtk.labelNew Nothing
  labelShutdown <- Gtk.labelNew Nothing
  labelCancel <- Gtk.labelNew Nothing
  labelSuspend <- Gtk.labelNew Nothing
  labelHibernate <- Gtk.labelNew Nothing
  labelRestart <- Gtk.labelNew Nothing
  btnLogout <- Gtk.buttonNew
  btnShutdown <- Gtk.buttonNew
  btnCancel <- Gtk.buttonNew
  btnSuspend <- Gtk.buttonNew
  btnHibernate <- Gtk.buttonNew
  btnRestart <- Gtk.buttonNew

-- Setting the properties of the GTK window (variable win)
  Gtk.setContainerBorderWidth win 10                        -- Set the border width of win
  Gtk.setWindowTitle win "Commandr"                         -- Set the window title of win
  Gtk.setWindowResizable win False                          -- Determines if win can be resized
  Gtk.setWindowDefaultWidth win 750                         -- Default window width
  Gtk.setWindowDefaultHeight win 225                        -- Default window height
  Gtk.setWindowWindowPosition win Gtk.WindowPositionCenter  -- Sets the window's position on the screen
  Gtk.windowSetDecorated win False                          -- Disable window decorations

-- Setting up the grid of buttons (variable grid)
  Gtk.gridSetColumnSpacing grid 10                          -- Sets the column spacing for the grid of buttons
  Gtk.gridSetRowSpacing grid 10                             -- Sets the row spacing for the grid of buttons
  Gtk.gridSetColumnHomogeneous grid True                    -- Sets all grid cells to always be the same size

-- Setting up the labels for each button
  Gtk.labelSetMarkup labelLogout "<b>Logout</b>"
  Gtk.labelSetMarkup labelShutdown "<b>Shut Down</b>"
  Gtk.labelSetMarkup labelCancel "<b>Cancel</b>"
  Gtk.labelSetMarkup labelSuspend "<b>Suspend</b>"
  Gtk.labelSetMarkup labelHibernate "<b>Hibernate</b>"
  Gtk.labelSetMarkup labelRestart "<b>Restart</b>"

  -- Setting up the buttons, adding the images to each button
  -- Cancel
  Gtk.buttonSetRelief btnCancel Gtk.ReliefStyleNone
  Gtk.buttonSetImage btnCancel $ Just imgCancel
  Gtk.widgetSetHexpand btnCancel False
  on btnCancel #clicked $ do
    putStrLn "User cancelled"
    Gtk.widgetDestroy win

-- Logout
  Gtk.buttonSetRelief btnLogout Gtk.ReliefStyleNone
  Gtk.buttonSetImage btnLogout $ Just imgLogout
  Gtk.widgetSetHexpand btnLogout False
  on btnLogout #clicked $ do
    putStrLn "User logged out"
    Gtk.widgetDestroy win

-- Shutdown
  Gtk.buttonSetRelief btnShutdown Gtk.ReliefStyleNone
  Gtk.buttonSetImage btnShutdown $ Just imgShutdown
  Gtk.widgetSetHexpand btnShutdown False
  on btnShutdown #clicked $ do
    putStrLn "User shut down the system"
    Gtk.widgetDestroy win

  -- Suspend
  Gtk.buttonSetRelief btnSuspend Gtk.ReliefStyleNone
  Gtk.buttonSetImage btnSuspend $ Just imgSuspend
  Gtk.widgetSetHexpand btnSuspend False
  on btnSuspend #clicked $ do
    putStrLn "User suspended"
    Gtk.widgetDestroy win

  -- Hibernate
  Gtk.buttonSetRelief btnHibernate Gtk.ReliefStyleNone
  Gtk.buttonSetImage btnHibernate $ Just imgHibernate
  Gtk.widgetSetHexpand btnHibernate False
  on btnHibernate #clicked $ do
    putStrLn "User hibernated"
    Gtk.widgetDestroy win

  -- Restart
  Gtk.buttonSetRelief btnRestart Gtk.ReliefStyleNone
  Gtk.buttonSetImage btnRestart $ Just imgRestart
  Gtk.widgetSetHexpand btnRestart False
  on btnRestart #clicked $ do
    putStrLn "User restarted"
    Gtk.widgetDestroy win

-- Add buttons to the grid and the grid to the GTK window
  #attach grid btnCancel 0 0 1 1
  #attach grid btnLogout 1 0 1 1
  #attach grid btnRestart 2 0 1 1
  #attach grid btnShutdown 3 0 1 1
  #attach grid btnSuspend 4 0 1 1
  #attach grid btnHibernate 5 0 1 1
  #attach grid labelCancel 0 1 1 1
  #attach grid labelLogout 1 1 1 1
  #attach grid labelRestart 2 1 1 1
  #attach grid labelShutdown 3 1 1 1
  #attach grid labelSuspend 4 1 1 1
  #attach grid labelHibernate 5 1 1 1
  #add win grid

  Gtk.onWidgetDestroy win Gtk.mainQuit
  #showAll win
  Gtk.main
