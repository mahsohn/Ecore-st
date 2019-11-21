initialization
setMinInclusiveFacet: eDataType literal: literal
	| eAnnotation |
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	literal ifNil: [ 
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'minInclusive' ]
	]
	ifNotNil: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: true.
		(eAnnotation getDetails) at: 'minInclusive' put: literal
	].
	(self getExtendedMetaData: eDataType) setMinInclusiveFacet: literal