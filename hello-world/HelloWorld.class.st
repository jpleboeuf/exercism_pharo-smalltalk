"
I encapsulate a solution to the ""Hello World"" exercise.

I return 'Hello, World!' when messaged.
Indeed when I receive sayHello, I return 'Hello, World!'.

Example: 

HelloWorld sayHello

"
Class {
	#name : #HelloWorld,
	#superclass : #Object,
	#category : #'Exercise@HelloWorld'
}

{ #category : #solving }
HelloWorld class >> sayHello [
	"returns 'Hello, World!'"

	|  |
	^ 'Hello, World!'
]
