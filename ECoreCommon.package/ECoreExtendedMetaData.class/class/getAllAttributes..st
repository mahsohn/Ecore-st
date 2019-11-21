as yet unclassified
getAllAttributes: eClass
	| superTypes result allAttributes attributes changeable|
	superTypes := eClass getESuperTypes.
	changeable := false.
	superTypes do: [ :eSuperType |
		allAttributes := self getAllAttributes: eSuperType.
		allAttributes size isZero ifTrue: [ 
			result ifNil: [ result := allAttributes ]
			ifNotNil: [ changeable ifFalse: [ 
					changeable := true.
					result := UniqueEList new: result.	
				].
			result addAll: allAttributes 	 
			]		
		]
	].
	attributes := self getAttributes: eClass.
	attributes size isZero ifTrue: [ 
		result ifNil: [ ^attributes ].
		changeable ifFalse: [ result := UniqueEList new: result ].
		result addAll: attributes.
		^result
	].
	result ifNil: [ ^EStructuralFeature emptyList ] ifNotNil: [ ^result ]