as yet unclassified
basicGetName: eClassifier
	| eAnnotation result |
	eAnnotation := self getAnnotation: eClassifier demandCreate: false.
	eAnnotation ifNil: [ 
		result := (eAnnotation getDetails) get: 'name'.
		result ifNotNil: [ ^result ]
	].
	^ eClassifier getName