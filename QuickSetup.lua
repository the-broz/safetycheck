local CONFIG : Config = {
	mode = "LENIENT",
	messageToPlayer = "🚩 You have been flagged for a user safety concern.",
	messageToModeration = "🚩 User was flagged by SafetyChecker for having %s violations." -- %s is replaced with the amount of flags.
}


type Config = {
	mode: "STRICT" | "VSTRICT" | "LENIENT",
	messageToPlayer : string,
	messageToModeration : string
}

local safetyChecker = require(script.SafetyChecker)

local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	local flags = safetyChecker:scanUser(player.UserId)
	player.CharacterAdded:Wait()
	if flags > 0 then
		if CONFIG.mode == "LENIENT" then
			player:Kick(CONFIG.messageToPlayer)
		elseif CONFIG.mode == "STRICT" then
			Players:BanAsync({
				UserIds = {player.UserId},
				Duration = -1,
				DisplayReason = CONFIG.messageToPlayer,
				PrivateReason = string.format(CONFIG.messageToModeration,flags),
				ExcludeAltAccounts = true
			})
		elseif CONFIG.mode == "VSTRICT" then
			Players:BanAsync({
				UserIds = {player.UserId},
				Duration = -1,
				DisplayReason = CONFIG.messageToPlayer,
				PrivateReason = string.format(CONFIG.messageToModeration,flags),
				ExcludeAltAccounts = false
			})
		end	
	end
end)
