--[[ 
	This is the function that teleports players to the field of play. 
  ]]

function OnStartTouch(trigger)
        -- Get the position of the "point_teleport_spot"-entity we put in our map
        local point =  Entities:FindByName( nil, "r_telepoint" ):GetAbsOrigin()

        local iDuration = FrameTime()

        -- Find a spot for the hero around 'point' and teleports to it
        FindClearSpaceForUnit(trigger.activator, point, false)
        -- Play blink sound.
        trigger.caller:EmitSound("DOTA_Item.BlinkDagger.Activate") 
        -- Stop the hero, so he doesn't move
        trigger.activator:Stop()
        -- Refocus the camera of said player to the position of the teleported hero.
        --[[ Causes issues with HOST
        SendToConsole("dota_camera_center")
        ]]
        
        --[[may not be needed anymore
        PlayerResource:SetCameraTarget( trigger.activator:GetPlayerID(), trigger.activator )

        Timers:CreateTimer(iDuration + .1, function()
            PlayerResource:SetCameraTarget(trigger.activator:GetPlayerID() , nil)
            Timers:CreateTimer(FrameTime(), function() --fail-safe
                PlayerResource:SetCameraTarget(trigger.activator:GetPlayerID() , nil)
            end)
            Timers:CreateTimer(FrameTime() * 3, function() --fail-safe
                PlayerResource:SetCameraTarget(trigger.activator:GetPlayerID() , nil)
            end)
        end)]]
end