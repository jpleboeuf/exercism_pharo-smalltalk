"
I encapsulate the definition of a list of allergens.

To use my pool of allergens:
 #1 Add my name (Allergens) to the poolDictionaries property of the class you want to have the pool available:
	  poolDictionaries: 'Allergens'
 #2 And don't forget to send me an initialization message from this class to initialize the allergens that will be available:
     Allergens initialize.

After initialization, each class variable from the pool has for value how much it contributes to the allergy score (you can see the details in my initialize method).
For convenience, you can send me the message allergenData to retrieve all the allergens as an ordered array of allergen data, each allergen datum represented by an association type name -> contribution to the allergy score.


Implementation note:
Check the messages fromItem: and toItem: to understand how the interface with tests is done.
"
Class {
	#name : #Allergens,
	#superclass : #SharedPool,
	#classVars : [
		'Cats',
		'Chocolate',
		'Eggs',
		'Peanuts',
		'Pollen',
		'Shellfish',
		'Strawberries',
		'Tomatoes'
	],
	#classInstVars : [
		'allergens'
	],
	#category : #'Exercise@Allergies'
}

{ #category : #accessing }
Allergens class >> allergenData [
	"returns an ordered array of allergen data,
	  each allergen datum represented by an association type name -> contribution to the allergy score"

	|  |
	^ allergens.
]

{ #category : #converting }
Allergens class >> asDict [
	"returns the pool (as a dictionary)"

	|  |
	^ self classPool.
]

{ #category : #converting }
Allergens class >> asSortedArray [
	"converts the pool to an array of associations sorted by their values"

	|  |
	^ self asDict associations sorted: [:a1 :a2 | a1 value < a2 value].
]

{ #category : #converting }
Allergens class >> fromItem: anItem [
	"retrieves the in-pool type corresponding to an allergen name given as a string"

	|  |
	^ self asDict at: (anItem asCamelCase asSymbol).
]

{ #category : #'class initialization' }
Allergens class >> initialize [
	"associates a value to each type in the pool"

	|  |
	Eggs         :=   1.
	Peanuts      :=   2.
	Shellfish    :=   4.
	Strawberries :=   8.
	Tomatoes     :=  16.
	Chocolate    :=  32.
	Pollen       :=  64.
	Cats         := 128.
	"for convenience, keep the pool as a sorted array in a variable:"
	allergens := self asSortedArray.
]

{ #category : #converting }
Allergens class >> toItem: anAllergen [
	"retrieves the allergen name as a string corresponding to an allergen given as an in-pool type"

	|  |
	^ anAllergen asString asLowercase.
]
