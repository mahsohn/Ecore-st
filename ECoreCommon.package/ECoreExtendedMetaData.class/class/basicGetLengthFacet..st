as yet unclassified
basicGetLengthFacet: eClassifier
	| eAnnotation result |
	eAnnotation := self getAnnotation: eClassifier demandCreate: false.
	eAnnotation ifNil: [ 
		result := (eAnnotation getDetails) get: 'length'.
		result ifNotNil: [ ^self parseInt: result ]
	].
	^-1