as yet unclassified
basicGetMaxInclusiveFacet: eClassifier
	| eAnnotation result |
	eAnnotation := self getAnnotation: eClassifier demandCreate: false.
	eAnnotation ifNil: [ 
		result := (eAnnotation getDetails) get: 'maxInclusive'.
		result ifNotNil: [ ^result ]
	].
	^nil