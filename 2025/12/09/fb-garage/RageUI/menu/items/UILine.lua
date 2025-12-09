local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 30 },
    Text = { X = 8, Y = 3, Scale = 0.30 },
}

function RageUI.Line()
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                -- Calcul de la position Y pour centrer la ligne verticalement
                local lineHeight = 3
                local centerY = CurrentMenu.Y + RageUI.ItemOffset + (SettingsButton.Rectangle.Height / 2) - (lineHeight / 2)
                
                -- Calcul de la position X pour centrer la ligne horizontalement
                local lineWidth = 350
                local menuWidth = CurrentMenu.WidthOffset * 2.5 ~= 0 and CurrentMenu.WidthOffset * 2.5 or 431
                local centerX = CurrentMenu.X + (menuWidth / 2) - (lineWidth / 2)
                
                -- Rendu du rectangle centré
                RenderRectangle(centerX, centerY, lineWidth, lineHeight, 35, 35, 35, 255)
                
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height
                if (CurrentMenu.Index == Option) then
                    if (RageUI.LastControl) then
                        CurrentMenu.Index = Option - 1
                        if (CurrentMenu.Index < 1) then
                            CurrentMenu.Index = RageUI.CurrentMenu.Options
                        end
                    else
                        CurrentMenu.Index = Option + 1
                    end
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end