Config = {}

Config.NewSharedObjectForEsx = false
Config.DevMode = false -- It must be enabled to be used when the script is restarted.
Config.WatchCoords = vector3(445.48, -998.77, 34.97)

Config.Items = {
    ["bodycam"] = "bodycam",
    ["dashcam"] = "dashcam"
}

Config.Lang = {
    -- E BUTTON TEXT
    ["e-button-text"] = "Press [~g~E~w~] to access the cameras.",

    -- NOTIFICATIONS
    ["menu-updated"] = "The menu has changed. The menu is being revamped...",
    ["no-active-cam"] = "No active cameras found.",
    ["bodycam-off"] = "Bodycam turned off.",
    ["bodycam-on"] = "Bodycam turned on.",
    ["dashcam-off"] = "Dashcam turned off.",
    ["dashcam-on"] = "Dashcam turned on.",
    ["near-vehicles"] = "You are not near a vehicle.",

    -- MENUS
    ["exit-cam"] = "Exit cam",
    ["main-menu-title"] = "Cams",
    ["bodycam-list"] = "Bodycam List",
    ["bodycam-list-desc"] = "Click to see the police officers with active bodycam.",
    ["dashcam-list"] = "Dashcam List",
    ["dashcam-list-desc"] = "Click to see the vehicles with Dashcam.",

    ["watch-bodycam"] = "Watch the camera of cop %s",
    ["watch-dashcam"] = "Watch the dashcam of cop %s"
}


-- TODOS
-- 1 -> When the bodycam is switched off, the recording will be archived and available for viewing.
-- 2 -> Config function to show prop on police when using bodycam
-- 3 -> Config function to show prop on police car when using dashcam