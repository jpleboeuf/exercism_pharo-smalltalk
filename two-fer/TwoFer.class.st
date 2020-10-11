"
I encapsulate a solution to the ""Two Fer"" exercise.

I return ""One for {X}, one for me."" when sent one of the ""who*"" messages.
""{X}"" is a name given as parameter to the ""who:"" message, or is automagically set to ""you"" if no name was given, using the ""who"" message which does not take any parameter.
Indeed, after having been instanciated as ""twoFer"":
- when I receive twoFer who: 'Steph', I return 'One for Steph, one for me.';
- and when I receive twoFer who, I return 'One for you, one for me.'.

Example:

Create an instance:
twoFer := TwoFer new.

Then send some ""who*"" messages:
twoFer who: 'Steph'.
twoFer who.

"
Class {
	#name : #TwoFer,
	#superclass : #Object,
	#category : #'Exercise@TwoFer'
}

{ #category : #solving }
TwoFer >> who [
	"returns the string 'One for you, one for me.'"

	|  |
	^ self who: 'you'.
]

{ #category : #solving }
TwoFer >> who: name [
	"returns the interpolated string 'One for {name}, one for me.'"

	|  |
	^ 'One for {1}, one for me.' format: { name }.
]
