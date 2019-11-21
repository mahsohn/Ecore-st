initialization
setEnumerationFacet: eDataType literals: literals
	| eAnnotation result|
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	literals size isZero ifTrue: [ 
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'enumeration' ]
	]
	ifFalse: [ 
		result := ''.
		literals asByteArray do: [ :byte |
			result := result, (self replace: (self replace: byte asString oldString: '%20' newString: ' ') 										  oldString: '%25'
										  newString: '%'), ' '.
			 ].
		(eAnnotation getDetails) at: 'enumeration' put: (result copyFrom: 1 to: result size -1).
	].
	(self getExtendedMetaData: eDataType) setEnumerationFacet: literals