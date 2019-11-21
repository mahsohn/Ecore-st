initialization
setWhiteSpaceFacet: eDataType whiteSpace: whiteSpace
	| eAnnotation |
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	whiteSpace == self UNSPECIFIED_WHITE_SPACE ifTrue: [ 
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'whiteSpace' ]
	]
	ifFalse: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: true.
		(eAnnotation getDetails) at: 'whiteSpace' put: (self WHITE_SPACE_KINDS at: whiteSpace)
	].
	(self getExtendedMetaData: eDataType) setWhiteSpaceFacet: whiteSpace