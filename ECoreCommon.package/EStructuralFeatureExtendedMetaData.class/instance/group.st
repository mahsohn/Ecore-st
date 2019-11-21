accessing
group 
	group ifNil: [ group := ECoreExtendedMetaData basicGetGroup: eStructuralFeature ].
	^group