as yet unclassified
minInclusiveFacet
	minInclusive ifNil: [ minInclusive := ECoreExtendedMetaData basicGetMinInclusiveFacet: eDataType ].
	^minInclusive