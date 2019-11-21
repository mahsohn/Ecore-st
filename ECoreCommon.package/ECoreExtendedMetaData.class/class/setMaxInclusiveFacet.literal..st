initialization
setMaxInclusiveFacet: eDataType literal: literal
	| eAnnotation |
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	literal ifNil: [ 
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'maxInclusive' ]
	]
	ifNotNil: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: true.
		(eAnnotation getDetails) at: 'maxInclusive' put: literal
	].
	(self getExtendedMetaData: eDataType) setMaxInclusiveFacet: literal