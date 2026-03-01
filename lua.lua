-- Attempt to use game:Shutdown() (supported by many executors)
local success, result = pcall(function()
    game:Shutdown()
end)

if not success then
    -- If game:Shutdown() fails, try teleporting to an invalid place
    local TeleportService = game:GetService("TeleportService")
    local success2, result2 = pcall(function()
        -- Using placeId 0 is usually invalid; this may cause a disconnect
        TeleportService:Teleport(0)
    end)

    if not success2 then
        -- If both fail, show a notification
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Leave Failed",
            Text = "Could not leave to main menu. Try using a different executor.",
            Duration = 5
        })
    end
end
