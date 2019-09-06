--[[
	This will give vision on the clouds. 
]]

modifier_provides_fow_position = class({})

function modifier_provides_fow_position:IsHidden()
	return false
end

function modifier_provides_fow_position:CheckState()
    local state = {
	    [MODIFIER_STATE_PROVIDES_VISION] = true,
	}
 
    return state
end