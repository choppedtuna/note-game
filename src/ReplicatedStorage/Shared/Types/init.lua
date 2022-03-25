local types = {}

type INoteFrequency = {
	Frequency: number
}

type INoteTone = {
	Octave: number,
	Tone: string
}

export type INote = INoteTone & INoteFrequency

return nil