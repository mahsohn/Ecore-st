initialization
setProcessingKind: eStructuralFeature kind: kind
	| eAnnotation |
	((kind > 0) & (kind < self PROCESSING_KINDS size)) ifTrue: [ 
		eAnnotation := self getAnnotation: eStructuralFeature  demandCreate: true.
		(eAnnotation getDetails) at: 'processing' put: (self PROCESSING_KINDS at: kind)
	]
	ifFalse: [ 
		eAnnotation := self getAnnotation: eStructuralFeature  demandCreate: false.
		eAnnotation ifNil: [ (eAnnotation getDetails) removeKey: 'processing' ]
	].
	(self getExtendedMetaData: eStructuralFeature) setProcessingKind: kind