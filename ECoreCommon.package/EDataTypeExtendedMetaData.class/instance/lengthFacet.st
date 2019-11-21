as yet unclassified
lengthFacet
	length ifNil: [ length := ECoreExtendedMetaData basicGetLengthFacet: eDataType ].
	^length