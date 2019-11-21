accessing
featureKind
	featureKind ifNil: [ featureKind := ECoreExtendedMetaData basicGetFeatureKind: eStructuralFeature ].
	^featureKind