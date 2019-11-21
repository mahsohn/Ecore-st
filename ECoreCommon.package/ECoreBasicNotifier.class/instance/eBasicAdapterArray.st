as yet unclassified
eBasicAdapterArray
	| adapters |
	adapters := self eBasicAdapters.
	adapters ifNil: [ ^nil ]
				ifNotNil: [ ^adapters data ]