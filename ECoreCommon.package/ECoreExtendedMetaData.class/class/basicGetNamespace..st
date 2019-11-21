as yet unclassified
basicGetNamespace: eStructuralFeature
	| eAnnotation result |
	eAnnotation := self getAnnotation: eStructuralFeature demandCreate: false.
	eAnnotation ifNil: [ ^nil ].
	result := eAnnotation getDetails get: 'namespace'. 
	'##targetNamespace' = result ifTrue: [ ^self getPackageNamespace: eStructuralFeature ].
	^result