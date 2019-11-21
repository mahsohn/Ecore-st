as yet unclassified
basicGetMinExclusiveFacet: eClassifier
	| eAnnotation result |
	eAnnotation := self getAnnotation: eClassifier demandCreate: false.
	eAnnotation ifNil: [ 
		result := (eAnnotation getDetails) get: 'minExclusive'.
		result ifNotNil: [ ^result ]
	].
	^nil