function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if item.uid == 12031 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) == 30 then
			player:setStorageValue(Storage.TheIceIslands.Questline, 31)
			player:setStorageValue(Storage.TheIceIslands.Mission07, 3) -- Questlog The Ice Islands Quest, The Secret of Helheim
			player:say("You discovered the necromantic altar and should report about it.", TALKTYPE_ORANGE_1)
			position:sendMagicEffect(CONST_ME_MAGIC_RED)
			for x = -1, 1 do
				for y = 1, 1 do
					if y ~= 0 and x ~= 0 then
						doSendMagicEffect({x = position.x + x, y = position.y + y, z = position.z}, CONST_ME_DEATH)
						doSendMagicEffect({x = position.x, y = position.y - 1, z = position.z}, CONST_ME_YALAHARIGHOST)
					end
				end
			end
		end
	end
	return true
end


