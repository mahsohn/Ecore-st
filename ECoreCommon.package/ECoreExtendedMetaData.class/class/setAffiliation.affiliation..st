initialization
setAffiliation: eStructuralFeature affiliation: affiliation
	| eAnnotation |
	affiliation ifNil: [ 
		eAnnotation := self getAnnotation: eStructuralFeature demandCreate: false.
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'affiliation' ]
	]
	ifNotNil: [ 
		eAnnotation := self getAnnotation: eStructuralFeature demandCreate: true.
		(eAnnotation getDetails) 
		at: 'affiliation' 
		put: (self getQualifiedName: (self getPackageNamespace: eStructuralFeature) 
			        eClassifier: affiliation )
	].
	(self getExtendedMetaData: eStructuralFeature) setAffiliation: affiliation