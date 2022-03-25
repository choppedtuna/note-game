--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Assert = require(ReplicatedStorage.Shared.Modules.Assert)

local NoteLogic = require(ReplicatedStorage.Shared.Modules.NoteLogic)
local Types = require(ReplicatedStorage.Shared.Types)

local Note = {}
Note.__index = Note

type INote = Types.INote

function Note.new(createNoteParams: INote)
	assert(#createNoteParams >= 1, "Must provide at least one create param")

	local frequency = createNoteParams.Frequency
	local octave = createNoteParams.Octave
	local tone = createNoteParams.Tone

	if (octave ~= nil or tone ~= nil) then
		assert(octave ~= nil and tone ~= nil, "Must provide both Octave and Frequency create params")

		do
			Assert.isOctave(octave)
			Assert.isTone(tone)
		end

		frequency = NoteLogic.fromTone(octave, tone)
	else
		assert(frequency ~= nil, "Must provide Frequency as create params")
		
		do
			Assert.isFrequency(frequency)
		end

		tone, octave = NoteLogic.fromFrequency(frequency)
	end

	local self = {
		Frequency = frequency,
		Octave = octave,
		Tone = tone
	}

	return setmetatable(self, Note)
end

function Note:GetOctave(): string
	return self.Octave
end

function Note:GetTone(): string
	return self.Tone
end

function Note:GetFrequency(): number
	return self.Frequency
end