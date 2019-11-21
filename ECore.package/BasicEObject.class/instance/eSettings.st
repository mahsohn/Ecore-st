as yet unclassified
eSettings
	| size |
	self eHasSettings ifNil:[
		size := self eClass featureCount - self eStaticFeatureCount.
		self eProperties resize: size.
	].
	^ self eBasicProperties.