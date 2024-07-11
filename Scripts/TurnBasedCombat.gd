extends Node2D

# Definição das variáveis iniciais
var player_health = 100
var enemy_health = 100
var is_player_turn = true

@onready var player_health_bar = $Player/HealthBar
@onready var enemy_health_bar = $Enemy/HealthBar
@onready var log_label = $Log
@onready var attack_button = $Player/AttackButton

func _ready():
	# Atualiza as barras de vida
	update_health_bars()
	# Conecta o botão de ataque ao método de ataque
	attack_button.pressed.connect(_on_AttackButton_pressed)
	# Atualiza o log
	log_label.text = "Seu turno! Clique em 'Atacar' para atacar o inimigo."

func update_health_bars():
	player_health_bar.value = player_health
	enemy_health_bar.value = enemy_health

func _on_AttackButton_pressed():
	if is_player_turn:
		enemy_health -= randi() % 20 + 5
		log_label.text = "Você atacou o inimigo!"
		is_player_turn = false
		attack_button.disabled = true
		if enemy_health <= 0:
			log_label.text = "Você venceu!"
		else:
			await get_tree().create_timer(1.0).timeout
			enemy_turn()

func enemy_turn():
	player_health -= randi() % 20 + 5
	log_label.text = "O inimigo atacou você!"
	is_player_turn = true
	attack_button.disabled = false
	if player_health <= 0:
		log_label.text = "Você perdeu!"
	update_health_bars()

