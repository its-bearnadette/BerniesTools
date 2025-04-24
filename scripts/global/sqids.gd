extends Node

var sqids = Sqids.new(
	{min_length = 6}
	)
var tag_sqid = sqids.encode([1,2,3])

var tags_dict = {}
