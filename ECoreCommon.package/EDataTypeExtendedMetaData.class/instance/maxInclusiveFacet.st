as yet unclassified
maxInclusiveFacet
	maxInclusive ifNil: [ maxInclusive := ECoreExtendedMetaData basicGetMaxInclusiveFacet: eDataType ].
	^maxInclusive