as yet unclassified
getElement: eClass namespace: namespace name: name
	| result |
	result := self getLocalElement: eClass namespace: namespace name: name.
	result ifNil: [ 
		result := self getElement: namespace name: name.
		(result isNotNil & self getAffiliation: eClass eStructuralFeature: result) ifNil: [ ^nil ] 	
	].
	^result