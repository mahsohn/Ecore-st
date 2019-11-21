initialization
setFractionDigitsFacet: eDataType digits: digits
	| eAnnotation |
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	digits == -1 ifTrue: [ 
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'fractionDigits' ]
	]
	ifFalse: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: true.
		(eAnnotation getDetails) at: 'fractionDigits' put: digits asString
	].
	(self getExtendedMetaData: eDataType) setFractionDigitsFacet: digits