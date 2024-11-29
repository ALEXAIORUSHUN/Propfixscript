TriggerEvent("chat:addSuggestion", "/propfix", "Kezedbe lévő prop eltüntetése", {})

RegisterCommand("propfix", function()
    local playerPed = PlayerPedId()
    
    local nearbyObjects = GetGamePool("CObject")
    local prop = nil
    for _, object in ipairs(nearbyObjects) do
        if DoesEntityExist(object) then
            local attachedEntity = GetEntityAttachedTo(object)
            if attachedEntity == playerPed then
                prop = object
                break
            end
        end
    end
    
    if prop then
        DetachEntity(prop, true, true)
        DeleteEntity(prop)
        print("Sikeresen eltünt a prop ami a kezedbe volt.")
    else
        print("Nincs semmilyen prop a kezedben.")
    end
end, false)
