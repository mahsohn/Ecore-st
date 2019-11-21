initialization
setNamespace: eStructuralFeature namespace: namespace
	| packageNamespace convertedNamespace eAnnotation |
	packageNamespace := self getPackageNamespace: eStructuralFeature.
	convertedNamespace := namespace.
	namespace ifNil: [ packageNamespace ifNil: [ convertedNamespace := '##targetNamespace']]
	ifNotNil: [ namespace == packageNamespace ifTrue: [ convertedNamespace := '##targetNamespace' ] ].
	convertedNamespace ifNil: [ 
		eAnnotation := self getAnnotation: eStructuralFeature  demandCreate: true.
		(eAnnotation getDetails) put: convertedNamespace at: 'namespace'
		 ]
	ifNotNil: [ 
		eAnnotation := self getAnnotation: eStructuralFeature  demandCreate: false.
		eAnnotation ifNotNil:[ (eAnnotation getDetails) removeKey: 'namespace' ]
	].
	(self getExtendedMetaData: eStructuralFeature) removeKey: 'namespace'