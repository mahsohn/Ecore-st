initialization
setLengthFacet: eDataType length: length
	| eAnnotation |
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	length == -1 ifTrue: [ 
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'length' ]
	]
	ifFalse: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: true.
		(eAnnotation getDetails) at: 'length' put: length asString
	].
	(self getExtendedMetaData: eDataType) setLengthFacet: length