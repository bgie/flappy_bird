extends Node2D

var started := false
var score := 0

func _ready():
	get_tree().paused = true

func _input(event):
	if event.is_action_pressed("flap") and not started:
		start_game()

func start_game():
	get_tree().paused = false
	$StartScreen.hide()
	$StartScreen/Timer.stop()
	started = true

func game_over():
	get_tree().paused = true
	$GameOver.visible = true
	$GameOver/Timer.start()

func restart_game():
	get_tree().reload_current_scene()


func increase_score():
	if not $Bird.dead:
		score += 1
		$CanvasLayer/ScoreLabel.text = str(score)
