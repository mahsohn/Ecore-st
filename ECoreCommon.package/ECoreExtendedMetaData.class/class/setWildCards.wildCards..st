initialization
setWildCards: eStructuralFeature wildCards: wildcards
	| eAnnotation details namespace |
	eAnnotation := self getAnnotation: eStructuralFeature  demandCreate: false.
	details := details. 
	wildcards size isZero ifTrue: [ 
		eAnnotation ifNotNil: [ 
			details removeKey: 'wildcards'.
			details removeKey: 'wildcards' 
		].
	]
	ifFalse: [ 
		namespace := self getPackageNamespace: eStructuralFeature.
		details at: 'wildcards' put: (self getEncodedWildcards: namespace wildcards: wildcards).
		details at: 'name' put: ''
	].
	(self getExtendedMetaData: eStructuralFeature) setWildCards: wildcards