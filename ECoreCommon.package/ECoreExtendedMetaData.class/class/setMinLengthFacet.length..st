initialization
setMinLengthFacet: eDataType length: length
	| eAnnotation |
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	length == -1 ifTrue: [ 
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'minLength' ]
	]
	ifFalse: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: true.
		(eAnnotation getDetails) at: 'minLength' put: length asString
	].
	(self getExtendedMetaData: eDataType) setMinLengthFacet: length