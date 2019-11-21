as yet unclassified
getMixedFeature: eClass
	| kind|
	kind := self getContentKind: eClass.
	((kind == ECoreExtendedMetaData MIXED_CONTENT) | 
	(kind == ECoreExtendedMetaData MIXED_CONTENT)) ifTrue: [ 
		eClass getEAllAttributes do: [ :eAttribute |
				((self getFeatureKind: eAttribute) == ECoreExtendedMetaData ELEMENT_WILDCARD_FEATURE ) ifTrue: [ 
				^ eAttribute
			]
		]	
	].
	^nil