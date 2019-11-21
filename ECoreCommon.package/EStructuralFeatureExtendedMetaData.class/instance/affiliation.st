accessing
affiliation
	affiliation ifNil: [ affiliation := ECoreExtendedMetaData basicGetAffiliation: eStructuralFeature ].
	^affiliation