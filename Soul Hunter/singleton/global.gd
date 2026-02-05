extends Node

signal score_update
signal soul_update

var player

var score : int = 0:
	set(value):
		score = value
		score_update.emit(value)

var soul : int = 0:
	set(value):
		soul = value
		soul_update.emit(value)

var username := "XD"
