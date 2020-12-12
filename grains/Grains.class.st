"
I encapsulate a solution to the ""Grains"" exercise.

I can calculate the quantity of grains on a specific square of the chessboard (message atSquare:), and also the total quantity of grains on the chessboard (message total).

Example:

Create an instance:
grainsCalculator := Grains new.

Then send the atSquare: message to get the quantity of grains on a specific square of the chessboard:
grainsCalculator atSquare: 1.
grainsCalculator atSquare: 2.
grainsCalculator atSquare: 4.
grainsCalculator atSquare: 8.
grainsCalculator atSquare: 16.
grainsCalculator atSquare: 32.
grainsCalculator atSquare: 64.

Or send the total message to get the total quantity of grains on the chessboard:
grainsCalculator total.

"
Class {
	#name : #Grains,
	#superclass : #Object,
	#category : #'Exercise@Grains'
}

{ #category : #solving }
Grains >> atSquare: aSquareIdx [
	"returns the quantity of grains on a specific square of the chessboard"

	|  |
	(aSquareIdx between: 1 and: 64) ifFalse: [ Error signal: 'index of square must be between 1 and 64' ].
	^ 2 raisedTo: (aSquareIdx - 1).
]

{ #category : #solving }
Grains >> total [
	"returns the total quantity of grains on the chessboard"

	|  |
	^ (1 to: 64) inject: 0 into: [ :sum :each | sum + (self atSquare: each) ].
]
