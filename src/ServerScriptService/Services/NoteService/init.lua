local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Modules
local Knit = require(ReplicatedStorage.Packages.Knit)

-- Logic
local NoteLogic = require(ReplicatedStorage.Shared.Modules.NoteLogic)

local NoteService = Knit.CreateService {
	Name = "NoteService"
}

function NoteService:KnitInit()
	local note_g_sharp, note_a, note_c;

	-- Test Frequency
	print("fromFrequency")

	note_g_sharp = NoteLogic.fromFrequency(415.31)
	print("G#", note_g_sharp)

	note_a = NoteLogic.fromFrequency(440)
	print("A", note_a)

	note_c = NoteLogic.fromFrequency(523.26)
	print("C", note_c)

	-- Test Midi
	print("fromMIDI")

	note_g_sharp = NoteLogic.fromMIDI(note_g_sharp.MIDI)
	print("G#", note_g_sharp)

	note_a = NoteLogic.fromMIDI(note_a.MIDI)
	print("A", note_a)

	note_c = NoteLogic.fromMIDI(note_c.MIDI)
	print("C", note_c)

	-- Test Tone
	print("fromTone")

	note_g_sharp = NoteLogic.fromTone(note_g_sharp.Octave, note_g_sharp.Tone)
	print("G#", note_g_sharp)

	note_a = NoteLogic.fromTone(note_a.Octave, note_a.Tone)
	print("A", note_a)

	note_c = NoteLogic.fromTone(note_c.Octave, note_c.Tone)
	print("C", note_c)
end

function NoteService:KnitStart()
	print("Started!")
end

return NoteService