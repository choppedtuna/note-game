local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Modules
local Knit = require(ReplicatedStorage.Packages.Knit)

-- Logic
local NoteLogic = require(ReplicatedStorage.Shared.Modules.NoteLogic)

local NoteService = Knit.CreateService {
	Name = "NoteService"
}

function NoteService:KnitInit()

end

function NoteService:KnitStart()
	print("Started!")
end

return NoteService