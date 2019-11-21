as yet unclassified
getAttribute: eClass namespace: namespace name: name
	| result |
	result := self getLocalAttribute: eClass namespace: namespace name: name.
	result ifNil: [ 
		result := self getAttribute: namespace name: name.
		(result isNotNil & self getAffiliation: eClass eStructuralFeature: result) ifNil: [ ^nil ] 	
	].
	^result