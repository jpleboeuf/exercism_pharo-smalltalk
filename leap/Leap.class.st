"
I encapsulate a solution to the ""Leap"" exercise.

I return whether a year is a leap year or not when sent the leapYear: message.

Example:

Create an instance:
leapCalculator := Leap new.

Then send the leapYear: message to check whether a year is a leap year or not:
leapCalculator leapYear: 2000.
leapCalculator leapYear: 2001.

"
Class {
	#name : #Leap,
	#superclass : #Object,
	#category : #'Exercise@Leap'
}

{ #category : #solving }
Leap >> leapYear: aYear [
	"returns whether aYear is a leap year or not"

	|  |
	^ (aYear \\ 4 == 0) and: [ (aYear \\ 100 ~~ 0) or: [ (aYear \\ 400 == 0) ] ]

]
