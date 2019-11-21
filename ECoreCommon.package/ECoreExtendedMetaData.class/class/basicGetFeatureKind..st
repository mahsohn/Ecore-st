as yet unclassified
basicGetFeatureKind: eStructuralFeature
	| eAnnotation kinds kind|
	eAnnotation := self getAnnotation: eStructuralFeature  demandCreate: false.
	eAnnotation ifNotNil: [ 
		kinds := ECoreExtendedMetaData FEATURE_KINDS.
		kind := (eAnnotation getDetails) get: 'kind'.
		kind ifNotNil: [ 
			2 to: kinds size do: [ :i | 
				(kinds at: i) == kind ifTrue: [ ^i ] 
				]
			 ]
		 ].
	^1