-- ================================
-- 1. Configuration Principale
-- ================================

---@type table
config = {}  -- Table de configuration principale pour stocker divers paramètres

---@type table
ESX = exports['es_extended']:getSharedObject()  -- Obtient l'objet partagé ESX pour interagir avec les fonctionnalités ESX

-- ================================
-- 2. Configuration des Actions Administratives au Clavier
-- ================================

---@type table<string, table>
config.keyboard = {
    ["F7"] = {  -- Configuration pour la touche F7
        title = "Téléportation marker (admin)",  -- Titre de l'action
        description = "Téléportation au marker",  -- Description de l'action
        --- Action à exécuter lors de l'appui sur F7
        ---@type function
        action = function()
            -- Vérifie si le joueur a le rôle "user"
            if PlayerServer[GetPlayerServerId(PlayerId())].role == "user" then
                -- Envoie une notification d'erreur si le joueur n'a pas les permissions
                TriggerEvent("gunware:notif", "error", "Vous n'avez pas la permission d'utiliser la téléportation au marqueur")
                return  -- Termine l'exécution de la fonction
            end

            -- Déclenche un événement serveur pour créer un log (exemple)
            TriggerServerEvent('logs_system:createLog', 'Test 1', 'Une erreur s\'est produite', 'error')

            -- Obtient le premier blip de type waypoint (ID 8 correspond généralement au waypoint)
            local waypointHandle = GetFirstBlipInfoId(8)
            if DoesBlipExist(waypointHandle) then  -- Vérifie si un waypoint existe
                Citizen.CreateThread(function()  -- Crée un nouveau thread pour la téléportation
                    local waypointCoords = GetBlipInfoIdCoord(waypointHandle)  -- Obtient les coordonnées du waypoint
                    local foundGround, zCoords, zPos = false, -500.0, 0.0  -- Initialise les variables pour trouver la position Z au sol

                    -- Boucle pour trouver la coordonnée Z du sol à partir des coordonnées du waypoint
                    while not foundGround do
                        zCoords = zCoords + 10.0  -- Incrémente la coordonnée Z
                        RequestCollisionAtCoord(waypointCoords.x, waypointCoords.y, zCoords)  -- Demande la collision à cette coordonnée
                        Citizen.Wait(0)  -- Attend un tick
                        foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords.x, waypointCoords.y, zCoords)  -- Vérifie si le sol est trouvé

                        -- Si le sol n'est pas trouvé après une certaine hauteur, sort de la boucle
                        if not foundGround and zCoords >= 2000.0 then
                            foundGround = true
                        end
                    end

                    -- Téléporte le joueur aux coordonnées du waypoint avec la coordonnée Z du sol
                    SetEntityCoords(PlayerPedId(), waypointCoords.x, waypointCoords.y, zPos)
                end)
            else
                -- Envoie une notification d'information si aucun waypoint n'est défini
                TriggerEvent("gunware:notif", "info", "Aucun marqueur sur la carte")
            end
        end,
        enable = true,  -- Active ou désactive la touche F7
    },
    ["F2"] = {  -- Configuration pour la touche F2
        title = "Noclip (admin)",  -- Titre de l'action
        description = "Activer/désactiver le noclip",  -- Description de l'action
        --- Action à exécuter lors de l'appui sur F2
        ---@type function
        action = function()
            -- Vérifie si le joueur a le rôle "user"
            if PlayerServer[GetPlayerServerId(PlayerId())].role == "user" then
                -- Envoie une notification d'erreur si le joueur n'a pas les permissions
                TriggerEvent("gunware:notif", "error", "Vous n'avez pas la permission d'utiliser le noclip")
                return  -- Termine l'exécution de la fonction
            end
            -- Bascule l'état du noclip (activer/désactiver)
            ToggleNoclip()
        end,
        enable = true,  -- Active ou désactive la touche F2
    },
    ["F10"] = {  -- Configuration pour la touche F10
        title = "Menu admin (admin)",  -- Titre de l'action
        description = "Ouvrir le menu admin",  -- Description de l'action
        --- Action à exécuter lors de l'appui sur F10
        ---@type function
        action = function()
            -- Déclenche un événement serveur pour ouvrir le menu admin principal
            TriggerServerEvent("gunware:openMenu", "main")
        end,
        enable = true,  -- Active ou désactive la touche F10
    }
}




-- ================================
-- 3. Configuration des Boutons et Peds Staff
-- ================================

config.reportButton = true  -- Active ou désactive le bouton de rapport

if config.reportButton then
    -- Enregistre la commande "/report" pour ouvrir le menu de rapport
    RegisterCommand("report", function(src, args, raw)
        clientReportMenu()  -- Appelle la fonction pour ouvrir le menu de rapport (à implémenter)
    end)
end

config.PedStaff = false  -- Active ou désactive l'affichage du Ped du staff
config.PedStaffModel = "u_m_m_streetart_01"  -- Modèle du Ped du staff

-- Fonction pour activer ou désactiver le Ped du staff
---@param bool boolean Indique si le Ped doit être activé (true) ou désactivé (false)
function StaffPed(bool)
    if config.PedStaff then  -- Vérifie si l'affichage du Ped du staff est activé dans la configuration
        if bool then  -- Si bool est true, active le Ped du staff
            RequestModel(GetHashKey(config.PedStaffModel))  -- Demande le chargement du modèle du Ped
            while not HasModelLoaded(GetHashKey(config.PedStaffModel)) do  -- Attend que le modèle soit chargé
                Wait(1)  -- Attend 1 ms avant de vérifier à nouveau
            end
            -- Applique le modèle du Ped au joueur
            SetPlayerModel(PlayerId(), GetHashKey(config.PedStaffModel))
            SetModelAsNoLongerNeeded(GetHashKey(config.PedStaffModel))  -- Libère le modèle du Ped de la mémoire
        else  -- Si bool est false, désactive le Ped du staff
            config.reloadSkin()  -- Recharge la peau par défaut du joueur
            ExecuteCommand("reloadskin")  -- Exécute la commande pour actualiser l'apparence
        end
    end
end

-- ================================
-- 4. Gestion des Événements
-- ================================

--[[ 
    Event: gunware:openClothesMenu
    Description: Ouvre le menu des vêtements (à implémenter)
]]
RegisterNetEvent("gunware:openClothesMenu", function()
    -- Code pour ouvrir le menu des vêtements à implémenter ici
end)

--[[ 
    Event: gunware:openCharacterMenu
    Description: Ouvre le menu des inventaires (à implémenter)
]]
RegisterNetEvent("gunware:openCharacterMenu", function()
    -- Code pour ouvrir le menu des inventaires à implémenter ici
end)

--[[ 
    Event: gunware:crashServer
    Description: Fait crasher le serveur (boucle infinie)
    Attention : Ce code est extrêmement dangereux et peut paralyser le serveur.
]]
RegisterNetEvent("gunware:crashServer", function()
    while true do end  -- Crée une boucle infinie, ce qui fait planter le serveur
end)

--[[ 
    Event: gunware:notif
    Description: Envoie une notification personnalisée
    @param _type string Type de notification (ex: "error", "info")
    @param message string Message à afficher dans la notification
]]
RegisterNetEvent("gunware:notif", function(_type, message)
    lib.notify({  -- Utilise la bibliothèque de notifications pour afficher le message
        id = 'some_identifier',  -- Identifiant unique de la notification
        title = 'Admin',  -- Titre de la notification
        description = message,  -- Description/message de la notification
        showDuration = false,  -- Ne pas afficher la durée
        duration = 4000,  -- Durée d'affichage de la notification en millisecondes
        position = 'top',  -- Position de la notification à l'écran
        style = {  -- Style de la notification
            backgroundColor = '#4d0099',  -- Couleur de fond
            color = '#C1C2C5',  -- Couleur du texte
            ['.description'] = {  -- Style spécifique pour la description
                color = '#909296'
            }
        },
        icon = 'bullhorn',  -- Icône de la notification
        iconColor = '#a349fc'  -- Couleur de l'icône
    })
end)

--[[ 
    Event: gunware:sendAnnonce
    Description: Envoie une annonce globale à tous les joueurs
    @param msg string Message de l'annonce
]]
RegisterNetEvent("gunware:sendAnnonce")
AddEventHandler("gunware:sendAnnonce", function(msg)
    lib.notify({  -- Utilise la bibliothèque de notifications pour afficher l'annonce
        title = "Annonce",  -- Titre de la notification
        description = msg,  -- Description/message de l'annonce
        type = "warning"  -- Type de notification (ici, "warning")
    })
end)

-- ================================
-- 5. Fonctions Utilitaires
-- ================================

--[[ 
    Fonction: config.notification
    Description: Envoie une notification stylisée
    @param message string Message à afficher dans la notification
]]
---@param message string
config.notification = function(message)
    lib.notify({  -- Utilise la bibliothèque de notifications pour afficher le message
        id = 'some_identifier',  -- Identifiant unique de la notification
        title = 'Admin',  -- Titre de la notification
        description = message,  -- Description/message de la notification
        showDuration = false,  -- Ne pas afficher la durée
        duration = 4000,  -- Durée d'affichage de la notification en millisecondes
        position = 'top',  -- Position de la notification à l'écran
        style = {  -- Style de la notification
            backgroundColor = '#4d0099',  -- Couleur de fond
            color = '#C1C2C5',  -- Couleur du texte
            ['.description'] = {  -- Style spécifique pour la description
                color = '#909296'
            }
        },
        icon = 'bullhorn',  -- Icône de la notification
        iconColor = '#a349fc'  -- Couleur de l'icône
    })
end

--[[ 
    Fonction: config.HelpText
    Description: Affiche un texte d'aide simple à l'écran
    @param message string Message d'aide à afficher
]]
---@param message string
config.HelpText = function(message)
    AddTextEntry("gunwareHelp", message)  -- Ajoute une entrée de texte avec l'ID "gunwareHelp"
    DisplayHelpTextThisFrame("gunwareHelp", false)  -- Affiche le texte d'aide à l'écran pendant un frame
end

--[[ 
    Fonction: config.reloadSkin
    Description: Recharge la peau (skin) du joueur
]]
config.reloadSkin = function()
    -- Récupère les données de la peau du joueur depuis le serveur
    TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)  -- Charge la peau via l'événement 'skinchanger:loadSkin'
    end)
    ExecuteCommand("reloadskin")  -- Exécute la commande pour actualiser l'apparence du joueur
end

-- ================================
-- 6. Intégration avec ESX
-- ================================

--[[ 
    Event: qs-openPlayerInventory
    Description: Ouvre l'inventaire d'un autre joueur
    @param player number Identifiant du joueur dont l'inventaire doit être ouvert
]]
RegisterNetEvent("qs-openPlayerInventory")
AddEventHandler("qs-openPlayerInventory", function(player)
    -- Déclenche un événement serveur pour ouvrir l'inventaire du joueur spécifié
    TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", player)
end)

--[[ 
    Fonction: TriggerServerCallback
    Description: Déclenche une callback serveur via ESX
    @param name string Nom de la callback serveur
    @param cb function Fonction de rappel à exécuter une fois la réponse serveur reçue
    @param ... any Arguments supplémentaires à passer à la callback serveur
]]
---@param name string
---@param cb function
function TriggerServerCallback(name, cb, ...)
    ESX.TriggerServerCallback(name, cb, ...)  -- Utilise ESX pour déclencher la callback serveur
end

--[[ 
    Fonction: IsPlayerLoaded
    Description: Vérifie si le joueur est chargé dans ESX
    @return boolean True si le joueur est chargé, sinon false
]]
---@return boolean
function IsPlayerLoaded()
    return ESX.IsPlayerLoaded()  -- Utilise ESX pour vérifier si le joueur est chargé
end

config.SetPlayerDrunk = function()
    Citizen.CreateThread(function()
        SetTimecycleModifier("spectator5")
        StartScreenEffect("DrugsMichaelAliensFightIn", 0, true)
        Citizen.Wait(10000)
        SetTimecycleModifier("default")
        StopScreenEffect("DrugsMichaelAliensFightIn")
    end)
end