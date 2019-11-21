as yet unclassified
eDirectResource
	| eProperties |
	eProperties := self eBasicProperties.
	eProperties ifNil: [ ^nil ] ifNotNil: [ ^eProperties eResource ]