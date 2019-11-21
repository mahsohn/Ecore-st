initialization
setMaxExclusiveFacet: eDataType literal: literal
	| eAnnotation |
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	literal ifNil: [ 
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'maxExclusive' ]
	]
	ifNotNil: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: true.
		(eAnnotation getDetails) at: 'maxExclusive' put: literal
	].
	(self getExtendedMetaData: eDataType) setMaxExclusiveFacet: literal