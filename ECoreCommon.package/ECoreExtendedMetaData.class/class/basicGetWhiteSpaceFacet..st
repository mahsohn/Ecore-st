as yet unclassified
basicGetWhiteSpaceFacet: eDataType
	| eAnnotation kinds kind|
	eAnnotation := self getAnnotation: eDataType  demandCreate: false.
	eAnnotation ifNotNil: [ 
		kinds := ECoreExtendedMetaData WHITE_SPACE_KINDS.
		kind := (eAnnotation getDetails) get: 'whiteSpace'.
		kind ifNotNil: [ 
			2 to: kinds size do: [ :i | 
				(kinds at: i) == kind ifTrue: [ ^i ] 
				]
			 ]
		 ].
	^1