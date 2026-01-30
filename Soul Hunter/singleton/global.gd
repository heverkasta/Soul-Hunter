extends Node

signal score_update
signal soul_update

var player

var score := 0:
	set(value):
		score = value
		score_update.emit(value)

var soul := 0:
	set(value):
		soul = value
		soul_update.emit(value)

var username := "teste de pontos"
