as yet unclassified
getXSISchemaLocationMapFeature: eClass
	| eAllReferences |
	(self getContentKind: eClass == ECoreExtendedMetaData MIXED_CONTENT) ifTrue: [ 
		eAllReferences := eClass allReferences.
		eAllReferences do: [ :ref | 
			('xsi:schemaLocation' == self getName: ref ) ifTrue: [ ^ ref ]
			 ]
		 ].
	^nil