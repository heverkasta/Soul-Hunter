extends Control
@onready var http_request: HTTPRequest = $HTTPRequest
@onready var pontuação: Label = $pontuação
@onready var status: Label = $status

var url = "https://hostless-unwastefully-krystle.ngrok-free.dev/api/dados"

var user_score = {"usuario" : Global.username, "pontos" : Global.score}

func _ready() -> void:
	pontuação.text = "Pontuação: %d" % Global.score
	http_request.request_completed.connect(_on_request_completed)

func send_data(data):
	var json = JSON.stringify(data)
	var headers = ["Content-type: aplication/json"]
	
	http_request.request(url,headers,HTTPClient.METHOD_POST,json)

@warning_ignore("unused_parameter")
func _on_request_completed(results, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	if json:
		status.text = json["status"]
	else:
		status.text = "Lamentamos em informar: o servidor virou artigo da wikpedia"

func _on_send_score_button_pressed() -> void:
	if Global.username:
		send_data(user_score)
		status.text = "Enviando..."
	else:
		status.text = "Sem nome de usuário :("

func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
