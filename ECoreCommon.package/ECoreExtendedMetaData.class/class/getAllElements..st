as yet unclassified
getAllElements: eClass
	| superTypes result allElements elements changeable|
	superTypes := eClass getESuperTypes.
	changeable := false.
	superTypes do: [ :eSuperType |
		allElements := self getAllElements: eSuperType.
		allElements size isZero ifTrue: [ 
			result ifNil: [ result := allElements ]
			ifNotNil: [ changeable ifFalse: [ 
					changeable := true.
					result := UniqueEList new: result.	
				].
			result addAll: allElements 	 
			]		
		]
	].
	elements := self getElements: eClass.
	elements size isZero ifTrue: [ 
		result ifNil: [ ^elements ].
		changeable ifFalse: [ result := UniqueEList new: result ].
		result addAll: elements.
		^result
	].
	result ifNil: [ ^EStructuralFeature emptyList ] ifNotNil: [ ^result ]