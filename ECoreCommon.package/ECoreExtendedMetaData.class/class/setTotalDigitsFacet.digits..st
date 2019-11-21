initialization
setTotalDigitsFacet: eDataType digits: digits
	| eAnnotation |
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	digits == -1 ifTrue: [ 
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'totalDigits' ]
	]
	ifFalse: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: true.
		(eAnnotation getDetails) at: 'totalDigits' put: digits asString
	].
	(self getExtendedMetaData: eDataType) setTotalDigitsFacet: digits