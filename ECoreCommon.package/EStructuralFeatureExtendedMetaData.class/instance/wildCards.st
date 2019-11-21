as yet unclassified
wildCards
	wildcards ifNil: [ wildcards := ECoreExtendedMetaData basicGetWildcards: eStructuralFeature ].
	^wildcards