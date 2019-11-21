as yet unclassified
basicGetMaxLengthFacet: eClassifier
	| eAnnotation result |
	eAnnotation := self getAnnotation: eClassifier demandCreate: false.
	eAnnotation ifNil: [ 
		result := (eAnnotation getDetails) get: 'maxLength'.
		result ifNotNil: [ ^self parseInt: result ]
	].
	^-1