as yet unclassified
minExclusiveFacet
	minExclusive ifNil: [ minExclusive := ECoreExtendedMetaData basicGetMinExclusiveFacet: eDataType ].
	^minExclusive