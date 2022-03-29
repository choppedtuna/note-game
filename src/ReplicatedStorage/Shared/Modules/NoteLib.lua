--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local NoteInfo = require(ReplicatedStorage.Shared.Modules.NoteInfo)

local DEFAULT_TUNING = NoteInfo.getDefaultTuning()
local PITCH_REFERENCE = NoteInfo.getPitchReference()

local NoteLib = {}

-- Conversion F(x)

-- Freq(X) -> Y
function NoteLib.freq_to_value(frequency: number): number
	return (math.floor((12 * math.log(frequency / PITCH_REFERENCE.Frequency, 2)) + 9) % 12) + 1
end

function NoteLib.freq_to_octave(frequency: number): number
	return math.ceil(NoteLib.freq_to_value(frequency) / 12) + PITCH_REFERENCE.Octave
end

function NoteLib.freq_to_tone(frequency: number): string
	return NoteInfo.ValueToTone[NoteLib.freq_to_value(frequency)][1]
end

function NoteLib.freq_to_midi(frequency: number): number
	return math.floor(12 * math.log(frequency / PITCH_REFERENCE.Frequency, 2)) + PITCH_REFERENCE.MIDI
end

-- Midi(X) -> Y
function NoteLib.midi_to_freq(midi: number): number
	return math.pow(2, (midi - PITCH_REFERENCE.MIDI) / 12) * PITCH_REFERENCE.Frequency
end

function NoteLib.midi_to_octave(midi: number): number
	return NoteLib.freq_to_octave(NoteLib.midi_to_freq(midi))
end

function NoteLib.midi_to_tone(midi: number): string
	return NoteInfo.ValueToTone[(midi % 12) + 1][1]
end

-- Octave(X) & Tone(X) -> Y
function NoteLib.tone_to_value(tone: string): number
	return NoteInfo.ToneToValue[tone]
end

function NoteLib.tone_to_midi(octave: number, tone: string): number
	return ((octave + 1) * 12) + NoteLib.tone_to_value(tone) - 1
end

function NoteLib.tone_to_freq(octave: number, tone: string): number
	return NoteLib.midi_to_freq(NoteLib.tone_to_midi(octave, tone))
end

return NoteLib