as yet unclassified
basicGetContentKind: eClass
	| eAnnotation kinds kind|
	eAnnotation := self getAnnotation: eClass  demandCreate: false.
	eAnnotation ifNotNil: [ 
		kinds := ECoreExtendedMetaData CONTENT_KINDS.
		kind := (eAnnotation getDetails) get: 'kind'.
		kind ifNotNil: [ 
			2 to: kinds size do: [ :i | 
				(kinds at: i) == kind ifTrue: [ ^i ] 
				]
			 ]
		 ].
	^1