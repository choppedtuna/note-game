--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Assert = require(ReplicatedStorage.Shared.Modules.Assert)

local NoteLogic = require(ReplicatedStorage.Shared.Modules.NoteLogic)
local Types = require(ReplicatedStorage.Shared.Types)

local Note = {}
Note.__index = Note

export type INote = Types.INote

function Note.new(createNoteParams: INote)
	assert(#createNoteParams >= 1, "Must provide at least one create param")

	local frequency = createNoteParams.Frequency
	local octave = createNoteParams.Octave
	local tone = createNoteParams.Tone
	local midi = createNoteParams.MIDI

	local properties = {}

	if (octave ~= nil or tone ~= nil) then
		assert(octave ~= nil and tone ~= nil, "Must provide both Octave and Frequency create params")

		Assert.isOctave(octave)
		Assert.isTone(tone)

		properties = NoteLogic.fromTone(octave, tone)
		frequency, midi = properties.Frequency, properties.Tone
	elseif (frequency ~= nil) then
		Assert.isFrequency(frequency)

		properties = NoteLogic.fromFrequency(frequency)
		octave, tone, midi = properties.Octave, properties.Tone, properties.MIDI
	elseif (midi ~= nil) then
		Assert.isMIDI(midi)

		properties = NoteLogic.fromMIDI(midi)
		frequency, octave, tone = properties.Frequency, properties.Octave, properties.Tone
	end

	local self = {
		Frequency = frequency,
		Octave = octave,
		Tone = tone
	}

	return setmetatable(self, Note)
end

-- Octave

function Note:GetOctave(): string
	return self.Octave
end

-- Tone

function Note:GetTone(): string
	return self.Tone
end

-- Frequency

function Note:GetFrequency(): number
	return self.Frequency
end

-- MIDI

function Note:GetMIDI(): number
	return self.MIDI
end

return Note