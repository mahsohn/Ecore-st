accessing
classLoaderToRegistryMap
	classLoaderToRegistryMap ifNil: [ classLoaderToRegistryMap := Dictionary new ].
	^classLoaderToRegistryMap