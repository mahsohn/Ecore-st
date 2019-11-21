as yet unclassified
getXMLNSPrefixMapFeature: eClass
	| eAllReferences |
	(self getContentKind: eClass == ECoreExtendedMetaData MIXED_CONTENT) ifTrue: [ 
		eAllReferences := eClass allReferences.
		eAllReferences do: [ :ref | 
			('xmlns:prefix' == self getName: ref ) ifTrue: [ ^ ref ]
			 ]
		 ].
	^nil