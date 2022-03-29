--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Assert = require(ReplicatedStorage.Shared.Modules.Assert)

local Types = require(ReplicatedStorage.Shared.Types)
local NoteLib = require(ReplicatedStorage.Shared.Modules.NoteLib)

local NoteLogic = {}

-- Types

type INoteTone = Types.INoteTone
type INoteMIDI = Types.INoteMIDI
type INoteFrequency = Types.INoteFrequency

type INote = Types.INote

-- Module Logic

function NoteLogic.fromFrequency(frequency: number): INote
	local octave: number, tone: string, midi: number

	do
		Assert.isFrequency(frequency)
	end

	midi = NoteLib.freq_to_midi(frequency)
	octave = NoteLib.freq_to_octave(frequency)
	tone = NoteLib.freq_to_tone(frequency)

	return {
		Octave = octave,
		Tone = tone,
		MIDI = midi,
		Frequency = frequency,
	} :: INote
end

function NoteLogic.fromTone(octave: number, tone: string): INote
	local frequency: number, midi: number

	do
		Assert.isOctave(octave)
		Assert.isTone(tone)
	end

	frequency = NoteLib.tone_to_freq(octave, tone)
	midi = NoteLib.tone_to_midi(octave, tone)

	return {
		Octave = octave,
		Tone = tone,
		MIDI = midi,
		Frequency = frequency
	} :: INote
end

function NoteLogic.fromMIDI(midi: number): INote
	local octave: number, tone: string, frequency: number
	
	do
		Assert.isMIDI(midi)
	end

	octave = NoteLib.midi_to_octave(midi)
	tone = NoteLib.midi_to_tone(midi)
	frequency = NoteLib.midi_to_freq(midi)

	return {
		Octave = octave,
		Tone = tone,
		MIDI = midi,
		Frequency = frequency
	} :: INote
end

return NoteLogic