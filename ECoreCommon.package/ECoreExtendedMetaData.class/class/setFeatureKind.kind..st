initialization
setFeatureKind: eStructuralFeature kind: kind
	| eAnnotation |
	((kind > 0) & (kind < ECoreExtendedMetaData FEATURE_KINDS size)) ifTrue: [ 
		eAnnotation := self getAnnotation: eStructuralFeature  demandCreate: true.
		(eAnnotation getDetails) at: 'kind' put: (ECoreExtendedMetaData FEATURE_KINDS at: kind)
	]
	ifFalse: [ 
		eAnnotation := self getAnnotation: eStructuralFeature  demandCreate: false.
		eAnnotation ifNil: [ (eAnnotation getDetails) removeKey: 'kind' ]
	].
	(self getExtendedMetaData: eStructuralFeature) setFeatureKind: kind