as yet unclassified
enumerationFacet
	enumerationLiterals ifNil: [ enumerationLiterals := ECoreExtendedMetaData basicGetEnumerationFacet: eDataType ].
	^enumerationLiterals