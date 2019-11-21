initialization
setMaxLengthFacet: eDataType length: length
	| eAnnotation |
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	length == -1 ifTrue: [ 
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'maxLength' ]
	]
	ifFalse: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: true.
		(eAnnotation getDetails) at: 'maxLength' put: length asString
	].
	(self getExtendedMetaData: eDataType) setMaxLengthFacet: length