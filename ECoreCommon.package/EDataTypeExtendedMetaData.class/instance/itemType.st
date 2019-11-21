accessing
itemType
	itemType ifNil: [ ECoreExtendedMetaData basicGetItemType: eDataType ].
	^itemType