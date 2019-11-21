as yet unclassified
basicGetEnumerationFacet: eDataType
	| eAnnotation enumerationLiteral enumeration result |
	eAnnotation := self getAnnotation: eDataType  demandCreate: false.
	result := OrderedCollection new.
	eAnnotation ifNotNil: [ 
		enumerationLiteral := (eAnnotation getDetails) get: 'enumeration'.
		enumerationLiteral ifNotNil: [ 
			enumerationLiteral asByteArray do: [ :byte | 
				enumeration := self replace: (self replace: byte asString oldString: '%20' newString: ' ') 										  oldString: '%25'
										  newString: '%'.
				result add: enumeration.
				]
			 ]
		 ].
	^result