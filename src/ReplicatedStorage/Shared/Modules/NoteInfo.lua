--!strict

--[[ Info:
	fn  =  2^(n/12)*440 Hz
	n  =  12*log2(fn/440 Hz)
	m  =  12*log2(fm/440 Hz) + 69
	fm  =  2(m−69)/12(440 Hz)
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local NoteData = require(ReplicatedStorage.Data.Notes)
local Types = require(ReplicatedStorage.Shared.Types)

local PITCH_REFERENCE = NoteData.pitchReference :: INote

local NoteInfo = {}

type INote = Types.INote

export type INoteObject = {
	noteValue: number,
	noteTones: table
}

NoteInfo.ToneToValue = {}
NoteInfo.ValueToTone = {}

function NoteInfo.init()
	table.foreach(NoteData.chromaticScale, function (_, noteObject: INoteObject)
		local noteValue, noteTones = noteObject.noteValue, noteObject.noteTones
		print(noteValue, noteTones)
	
		-- Index NoteTone -> NoteValue
		table.foreach(noteTones, function (_, noteTone)
			NoteInfo.ToneToValue[noteTone] = noteValue
		end)
	
		-- Index NoteValue -> NoteTone
		NoteInfo.ValueToTone[noteValue] = noteTones
	end)

	return true
end

function NoteInfo.getDefaultTuning(): number
	return PITCH_REFERENCE.Frequency
end

function NoteInfo.getPitchReference(): INote
	return PITCH_REFERENCE
end

NoteInfo.init()

return NoteInfo