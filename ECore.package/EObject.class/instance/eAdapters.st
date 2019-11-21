accessing
eAdapters
	eAdapters ifNil: [ eAdapters := EAdapterList new: self ].
	^eAdapters