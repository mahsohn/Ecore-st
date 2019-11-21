accessing
name
	name ifNil: [ name := ECoreExtendedMetaData basicGetName: eStructuralFeature ].
	^name