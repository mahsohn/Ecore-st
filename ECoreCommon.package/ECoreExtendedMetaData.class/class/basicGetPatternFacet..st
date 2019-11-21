as yet unclassified
basicGetPatternFacet: eDataType
	| eAnnotation patternLiteral pattern result |
	eAnnotation := self getAnnotation: eDataType  demandCreate: false.
	result := OrderedCollection new.
	eAnnotation ifNotNil: [ 
		patternLiteral := (eAnnotation getDetails) get: 'pattern'.
		patternLiteral ifNotNil: [ 
			patternLiteral asByteArray do: [ :byte | 
				pattern := self replace: (self replace: byte asString oldString: '%20' newString: ' ') 										  									oldString: '%25'
									newString: '%'.
				result add: pattern.
				]
			 ]
		 ].
	^result