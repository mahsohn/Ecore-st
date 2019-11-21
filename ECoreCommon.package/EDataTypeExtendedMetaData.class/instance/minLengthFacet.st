as yet unclassified
minLengthFacet
	minLength ifNil: [ minLength := ECoreExtendedMetaData basicGetMinLengthFacet: eDataType ].
	^minLength