initialization
setBaseType: eDataType baseType: baseType
	| eAnnotation |
	baseType ifNil: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: false.
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'baseType' ]
	]
	ifNotNil: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: true.
		(eAnnotation getDetails) 
		at: 'baseType' 
		put: (self getQualifiedName: (self getNamespace: eDataType) eClassifier: baseType)
	].
	(self getExtendedMetaData: eDataType) setBaseType: baseType