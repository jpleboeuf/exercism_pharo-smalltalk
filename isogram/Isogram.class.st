"
I encapsulate a solution to the ""Isogram"" exercise.

When sent the message isIsogramPhrase: with a string as parameter, I return whether this string is an isogram or not.

Example:

Create an instance:
isogramCalculator := Isogram new.

Then send it the isIsogramPhrase: message to check whether the string given as parameter is an isogram oor not:
isogramCalculator isIsogramPhrase: 'Hello'.
isogramCalculator isIsogramPhrase: 'WORLD-y'.

"
Class {
	#name : #Isogram,
	#superclass : #Object,
	#category : #'Exercise@Isogram'
}

{ #category : #solving }
Isogram >> isIsogramPhrase: aPhrase [
	"returns whether aPhrase is an isogram or not"

	| aPhraseAlpha |
	aPhraseAlpha := (aPhrase asUppercase) select: [:c | c isLetter ].

	^ aPhraseAlpha size = (aPhraseAlpha asSet) size.
]
