local ReplicatedStorage = game.ReplicatedStorage

local Knit = require(ReplicatedStorage.Packages.Knit)

local NoteController = Knit.CreateController {
	Name = "NoteController",
}

function NoteController:KnitInit()
	
end

function NoteController:KnitStart()
	print('Started!')
end

return NoteController