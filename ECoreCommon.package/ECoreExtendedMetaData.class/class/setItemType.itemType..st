initialization
setItemType: eDataType itemType: itemType
	| eAnnotation |
	itemType ifNil: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: false.
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'itemType' ]
	]
	ifNotNil: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: true.
		(eAnnotation getDetails) 
		at: 'itemType' 
		put: (self getQualifiedName: (self getNamespace: eDataType) eClassifier: itemType)
	].
	(self getExtendedMetaData: eDataType) setItemType: itemType