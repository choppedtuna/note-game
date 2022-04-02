--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Assert = require(ReplicatedStorage.Shared.Modules.Assert)

local NoteLogic = require(ReplicatedStorage.Shared.Modules.NoteLogic)
local Types = require(ReplicatedStorage.Shared.Types)

local Note = {}
Note.__index = Note

type INoteTone = Types.INoteTone
type INoteFrequency = Types.INoteFrequency
type INoteMIDI = Types.INoteMIDI

export type INote = Types.INote

export type Note = INote & {
	Serialize: () -> INote
}

function Note.new(createNoteParams: INoteTone | INoteFrequency | INoteMIDI): Note
	local frequency = createNoteParams.Frequency
	local octave = createNoteParams.Octave
	local tone = createNoteParams.Tone
	local midi = createNoteParams.MIDI

	Assert.minParams(1, frequency, octave, tone, midi)

	local properties = {}

	if (octave ~= nil or tone ~= nil) then
		assert(octave ~= nil and tone ~= nil, "Must provide both Octave and Frequency create params")

		Assert.isOctave(octave)
		Assert.isTone(tone)

		properties = NoteLogic.fromTone(octave, tone)
		frequency, midi = properties.Frequency, properties.MIDI
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
		Tone = tone,
		MIDI = midi
	} :: INote

	return setmetatable(self, Note) :: Note
end

-- Serialize

function Note:Serialize(): INote
	return {
		Frequency = self:GetFrequency(),
		Octave = self:GetOctave(),
		Tone = self:GetTone(),
		MIDI = self:GetMIDI()
	} :: INote
end

return Note