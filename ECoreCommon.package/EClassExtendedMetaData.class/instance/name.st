accessing
name
	name ifNil: [ ECoreExtendedMetaData basicGetName: eClass ].
	^name