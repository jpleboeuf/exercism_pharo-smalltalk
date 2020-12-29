"
I encapsulate a solution to the ""Allergies"" exercise.

Given a person's allergy score:
- I can determine whether or not they are allergic to a given item (message allergicToItem:forScore:);
- I can also determine their full list of allergies (message allergyListForScore:).

I rely on a list of allergens which provides for each of them its contribution to the allergy score (class Allergens).

Example: 

Create an instance:
allergiesCalculator := Allergies new.

Then send the allergicToItem:forScore: message to determine whether a person with an allergy score of 128 is allergic to cats or not:
allergiesCalculator allergicToItem: 'cats' forScore: 128.

Or send the allergyListForScore: message to determine the full list of allergies for score 129:
allergiesCalculator allergyListForScore: 129.

 
Implementation note:
This implementation rely of a pool dictionary, defined in the class Allergens; therefore each allergen is a type.
It forces some conversions at the interface with the tests, especially because the allergyListForScore: tests expect an ordered array and not a set.

"
Class {
	#name : #Allergies,
	#superclass : #Object,
	#pools : [
		'Allergens'
	],
	#category : #'Exercise@Allergies'
}

{ #category : #solving }
Allergies >> allergicToItem: anItem forScore: aScore [
	"returns whether or not someone is allergic to a given item, given her allergy score"

	|  |
	"since anItem is a string, we need to retrieve the corresponding class variable:"
	^ (Allergens fromItem: anItem) anyMask: aScore.
]

{ #category : #solving }
Allergies >> allergyListForScore: aScore [
	"returns someone's full list of allergies, given her allergy score"

	|  |
	"since tests expect an ordered array, we have to work on an ordered array too:"
	^ (Allergens allergenData
			"since each allergenDat is an association,
			  we need to explicitely ask for the value part to work with the mask:"
			select: [:allergenDat | allergenDat value anyMask: aScore ])
				"since tests expect an ordered array of strings, we need to collect type names as strings:"
				collect: [:allergenDat | Allergens toItem: (allergenDat key)].
]

{ #category : #initialization }
Allergies >> initialize [
	"initializes allergen data (required call)"

	|  |
	Allergens initialize.
]
