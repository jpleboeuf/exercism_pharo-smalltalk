"
I encapsulate a solution to the ""Matrix"" exercise.

Given a matrix represented as a string (parameter input: of the following messages), I can return:
- a specific row (message input:atRow:);
- a specific column (message input:atRow:).

Example: 

Create an instance:
matrixCalculator := MatrixReader new.

Let's consider the following matrix:
1 2 3
4 5 6
7 8 9
The following string is a representation of the previous matrix:
cr := String cr. m := '1 2 3' , cr , '4 5 6' , cr , '7 8 9'.

Send the input:atRow: message to retrieve the 2nd row of the matrix:
matrixCalculator input: m atRow: 2.

Or send the input:atColumn: message to retrieve the 2nd column of the matrix:
matrixCalculator input: m atColumn: 2.

"
Class {
	#name : #MatrixReader,
	#superclass : #Object,
	#category : #'Exercise@Matrix'
}

{ #category : #solving }
MatrixReader >> input: aString atColumn: aColIdx [
	"returns the column aColIdx from the matrix represented by the string aString"

	|  |
	^ (self parseMatrixFromString: aString) atColumn: aColIdx.
]

{ #category : #solving }
MatrixReader >> input: aString atRow: aRowIdx [
	"returns the row aRowIdx from the matrix represented by the string aString"

	|  |
	^ (self parseMatrixFromString: aString) atRow: aRowIdx.
]

{ #category : #parsing }
MatrixReader >> parseMatrixFromString: aString [
	"returns the matrix (as a 2D-array) represented by the string aString"

	| rows matrix |
	rows := (aString substrings: (String cr))
		collect: [ :row |
				(row substrings: (String space))
					collect: #asInteger
			].
	matrix := Array2D rows: (rows size) columns: ((rows at: 1) size).
	1 to: (rows size) do: [ :i | matrix atRow: i put: (rows at: i) ].
	^ matrix.
]
