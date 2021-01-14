"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestExerciseMatrix,
	#superclass : #PackageManifest,
	#category : #'Exercise@Matrix-Manifest'
}

{ #category : #'code-critics' }
ManifestExerciseMatrix class >> ruleRBToDoRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MatrixReader #parseMatrixFromString: #false)) #'2021-01-15T00:47:05.558039+01:00') )
]
