as yet unclassified
basicGetTotalDigitsFacet: eClassifier
	| eAnnotation result |
	eAnnotation := self getAnnotation: eClassifier demandCreate: false.
	eAnnotation ifNil: [ 
		result := (eAnnotation getDetails) get: 'totalDigits'.
		result ifNotNil: [ ^self parseInt: result ]
	].
	^-1