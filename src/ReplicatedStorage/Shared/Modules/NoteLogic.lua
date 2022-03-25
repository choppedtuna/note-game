--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Assert = require(ReplicatedStorage.Shared.Modules.Assert)

local Types = require(ReplicatedStorage.Shared.Types)
local NoteData = require(ReplicatedStorage.Data.Notes)

local NoteLogic = {}

type INote = Types.INote

function NoteLogic.fromFrequency(frequency: number): (number, string)
	local octave: number, tone: string

	do
		Assert.isFrequency(frequency)
	end

	return octave, tone
end

function NoteLogic.fromTone(octave: number, tone: string): number
	local frequency: number

	do
		Assert.isOctave(octave)
		Assert.isTone(tone)
	end



	return frequency
end

return NoteLogic