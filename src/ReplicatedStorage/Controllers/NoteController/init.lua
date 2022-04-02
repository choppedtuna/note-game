local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Modules
local Knit = require(ReplicatedStorage.Packages.Knit)

-- Shared
local Note = require(ReplicatedStorage.Shared.Classes.Note)

local NoteController = Knit.CreateController {
	Name = "NoteController",
}

function NoteController:KnitInit()

end

function NoteController:KnitStart()
	print('Started!')

	local myNote = Note.new({Frequency = 440})
	print(myNote)
end

return NoteController