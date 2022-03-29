--!strict

local Assert = {}

function Assert.isFrequency(frequency: number): boolean
	assert(typeof(frequency) == "number", "Frequency must be number type")
	return true
end

function Assert.isOctave(octave: number): boolean
	assert(typeof(octave) == "number", "Octave must be number type")
	return true
end

function Assert.isTone(tone: string): boolean
	assert(typeof(tone) == "string", "Tone must be string type")
	return true
end

function Assert.isMIDI(midi: number): boolean
	assert(typeof(midi) == "number", "MIDI must be number type" )
	return true
end

return Assert