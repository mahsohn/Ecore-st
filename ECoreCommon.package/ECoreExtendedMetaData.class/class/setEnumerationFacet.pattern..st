initialization
setEnumerationFacet: eDataType pattern: pattern
	| eAnnotation result|
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	pattern size isZero ifTrue: [ 
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'pattern' ]
	]
	ifFalse: [ 
		result := ''.
		pattern asByteArray do: [ :byte |
			result := result, (self replace: (self replace: byte asString oldString: '%20' newString: ' ') 										  oldString: '%25'
										  newString: '%'), ' '.
			 ].
		(eAnnotation getDetails) at: 'pattern' put: (result copyFrom: 1 to: result size -1).
	].
	(self getExtendedMetaData: eDataType) setPatternFacet: pattern