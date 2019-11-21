as yet unclassified
getSimpleFeature: eClass
	| eStructuralFeature |
	((self getContentKind: eClass) == ECoreExtendedMetaData SIMPLE_CONTENT) ifTrue: [ 
		1 to: eClass getFeatureCount do: [ :i |
			eStructuralFeature := eClass getEStructuralFeature: i.
			((self getFeatureKind: eStructuralFeature) == ECoreExtendedMetaData SIMPLE_FEATURE) ifTrue: [ 
				^ eStructuralFeature 
			]
		]	
	].
	^nil