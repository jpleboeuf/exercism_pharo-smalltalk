"
I encapsulate a solution to the ""ReverseString"" exercise.

When sent the message reverseValue: with a string as parameter, I return this string reversed.

Example:

Create an instance:
reverseStringCalculator := ReverseString new.

Then send it the reverseValue: message to reverse a string given as parameter:
reverseStringCalculator reverseValue: 'Hello'.
reverseStringCalculator reverseValue: 'WORLD!'.

"
Class {
	#name : #ReverseString,
	#superclass : #Object,
	#category : #'Exercise@ReverseString'
}

{ #category : #solving }
ReverseString >> reverseValue: aString [
	"returns aString reversed"

	| readStream writeStream |
	readStream := aString readStream.
	readStream setToEnd.
	writeStream := WriteStream on: String new.
	[ readStream position ~= 0 ] whileTrue: [ 
			readStream skip: -1.
			writeStream nextPut: readStream peek.
		].
	^ writeStream contents.
]
