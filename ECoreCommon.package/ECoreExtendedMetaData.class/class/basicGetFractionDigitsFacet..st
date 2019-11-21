as yet unclassified
basicGetFractionDigitsFacet: eClassifier
	| eAnnotation result |
	eAnnotation := self getAnnotation: eClassifier demandCreate: false.
	eAnnotation ifNil: [ 
		result := (eAnnotation getDetails) get: 'fractionDigits'.
		result ifNotNil: [ ^self parseInt: result ]
	].
	^-1