local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)

local NoteService = Knit.CreateService {
	Name = "NoteService"
}

function NoteService:KnitInit()
	
end

function NoteService:KnitStart()
	print('Started!')
end

return NoteService