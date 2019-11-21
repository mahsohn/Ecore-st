initialization
setMinExclusiveFacet: eDataType literal: literal
	| eAnnotation |
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	literal ifNil: [ 
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'minExclusive' ]
	]
	ifNotNil: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: true.
		(eAnnotation getDetails) at: 'minExclusive' put: literal
	].
	(self getExtendedMetaData: eDataType) setMinExclusiveFacet: literal