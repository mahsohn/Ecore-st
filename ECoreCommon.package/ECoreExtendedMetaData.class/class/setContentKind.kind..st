initialization
setContentKind: eClass kind: kind
	| eAnnotation |
	((kind > 0) & (kind < ECoreExtendedMetaData CONTENT_KINDS size)) ifTrue: [ 
		eAnnotation := self getAnnotation: eClass  demandCreate: true.
		(eAnnotation getDetails) at: 'kind' put: (ECoreExtendedMetaData CONTENT_KINDS at: kind)
	]
	ifFalse: [ 
		eAnnotation := self getAnnotation: eClass  demandCreate: false.
		eAnnotation ifNil: [ (eAnnotation getDetails) removeKey: 'kind' ]
	].
	(self getExtendedMetaData: eClass) setContentKind: kind