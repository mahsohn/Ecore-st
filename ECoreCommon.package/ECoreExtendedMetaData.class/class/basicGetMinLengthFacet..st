as yet unclassified
basicGetMinLengthFacet: eClassifier
	| eAnnotation result |
	eAnnotation := self getAnnotation: eClassifier demandCreate: false.
	eAnnotation ifNil: [ 
		result := (eAnnotation getDetails) get: 'minLength'.
		result ifNotNil: [ ^self parseInt: result ]
	].
	^-1