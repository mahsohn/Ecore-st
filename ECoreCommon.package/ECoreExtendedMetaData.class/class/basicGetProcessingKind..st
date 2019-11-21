as yet unclassified
basicGetProcessingKind: eStructuralFeature
	| eAnnotation kinds kind|
	eAnnotation := self getAnnotation: eStructuralFeature  demandCreate: false.
	eAnnotation ifNotNil: [ 
		kinds := self PROCESSING_KINDS.
		kind := (eAnnotation getDetails) get: 'processing'.
		kind ifNotNil: [ 
			2 to: kinds size do: [ :i | 
				(kinds at: i) == kind ifTrue: [ ^i ] 
				]
			 ]
		 ].
	^1