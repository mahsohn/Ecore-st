as yet unclassified
basicGetMaxExclusiveFacet: eClassifier
	| eAnnotation result |
	eAnnotation := self getAnnotation: eClassifier demandCreate: false.
	eAnnotation ifNil: [ 
		result := (eAnnotation getDetails) get: 'maxExclusive'.
		result ifNotNil: [ ^result ]
	].
	^nil