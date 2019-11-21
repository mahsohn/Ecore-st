initialization
setGroup: eStructuralFeature group: group
	| eAnnotation |
	group ifNil: [ 
		eAnnotation := self getAnnotation: eStructuralFeature demandCreate: false.
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'group' ]
	]
	ifNotNil: [ 
		eAnnotation := self getAnnotation: eStructuralFeature demandCreate: true.
		(eAnnotation getDetails) 
		at: 'group' 
		put: (self getQualifiedName: (self getNamespace: eStructuralFeature) eClassifier: group)
	].
	(self getExtendedMetaData: eStructuralFeature) setGroup: group