as yet unclassified
basicGetMinInclusiveFacet: eClassifier
	| eAnnotation result |
	eAnnotation := self getAnnotation: eClassifier demandCreate: false.
	eAnnotation ifNil: [ 
		result := (eAnnotation getDetails) get: 'minInclusive'.
		result ifNotNil: [ ^result ]
	].
	^nil