local types = {}

export type INoteFrequency = {
	Frequency: number
}

export type INoteTone = {
	Octave: number,
	Tone: string
}

export type INoteMIDI = {
	MIDI: number,
}

export type INote = INoteTone & INoteFrequency & INoteMIDI

return nil