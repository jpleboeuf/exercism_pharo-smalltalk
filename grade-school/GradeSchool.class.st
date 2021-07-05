"
I encapsulate a solution to the ""Grade School"" exercise.

Given a list of students:
- This list of students can be passed to me and it will be added to the roster of the school (message addStudents:);
- I can return a sorted list of all students in all grades (message roster);
- I can return a list of all students enrolled in a grade (message desiredGrade:).

A student is represented by a list coupling its name and the grade he/she is in.
The roster is sorted by grades, and students within a grade are sorted alphabetically by name.
 
Example: 

Create an instance:
gradeSchoolCalculator := GradeSchool new.

Then send the addStudents: message followed by the roster message to check that a provided list of students is now part of the school:
gradeSchoolCalculator
	addStudents: #(#('Jim' 2));
	roster.
gradeSchoolCalculator
	addStudents: #(
			#('Anna' 1) #('Barb' 1) #('Charlie' 1)
			#('Alex' 2) #('Peter' 2) #('Zoe' 2)
		);
	roster.

Finally send the desiredGrade: message to retrieve the list of students that are enrolled in a given grade:
gradeSchoolCalculator desiredGrade: 2.

"
Class {
	#name : #GradeSchool,
	#superclass : #Object,
	#instVars : [
		'students'
	],
	#category : #'Exercise@GradeSchool'
}

{ #category : #adding }
GradeSchool >> addStudents: aStudentList [
	"adds to the list of students of the school the provided list of students"

	|  |
	students := students , aStudentList.
	students sort: #last ascending, #first ascending.

]

{ #category : #accessing }
GradeSchool >> desiredGrade: aGrade [
	"returns a sorted list of all students enrolled in the given grade"

	|  |
	^ (students select: [ :s | s last = aGrade ]) collect: [ :s | s first ].
]

{ #category : #initialization }
GradeSchool >> initialize [
	"creates the student list"

	|  |
	students := #().
	
]

{ #category : #accessing }
GradeSchool >> roster [
	"returns a sorted list of all students in all grades"

	|  |
	^ students collect: [ :s | s first ].
]
