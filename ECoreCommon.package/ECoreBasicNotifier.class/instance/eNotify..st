as yet unclassified
eNotify: notification
	| eAdapters |
	eAdapters := self eBasicAdapterArray.
	(eAdapters notNil & self eDeliver) ifTrue: [ 
			1 to: eAdapters size do: [ :i | (eAdapters at: i) notifyChanged: notification]
		 ]