local Players = game:GetService("Players")

local module = {}
module.flaggedUsers = require(script.FlaggedUsers)

local function iteratePageItems(pages)
	return coroutine.wrap(function()
		local pagenum = 1
		while true do
			for _, item in ipairs(pages:GetCurrentPage()) do
				coroutine.yield(item, pagenum)
			end
			if pages.IsFinished then
				break
			end
			pages:AdvanceToNextPageAsync()
			pagenum += 1
		end
	end)
end


function module:scanUser(userId : number)
	local friendPages = Players:GetFriendsAsync(userId)
	local flags = 0
	
	for item, _pageNo in iteratePageItems(friendPages) do
		if table.find(module.flaggedUsers,item.Id) then
			flags += 1
		end
	end
	
	return flags
end

return module
