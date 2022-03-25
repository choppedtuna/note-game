--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local NoteData = require(ReplicatedStorage.Data.Notes)

local NoteByTone = {}

local NoteInfo = {}

table.foreach(NoteData, function (noteIndex, noteObject)
	local noteValue, noteTones = noteObject[1], noteObject[2]

	table.foreach(noteTones, function (noteIndex, noteTone)
		NoteByTone[noteTone] = noteIndex
	end)
end)