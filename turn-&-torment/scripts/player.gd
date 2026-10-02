extends CharacterBody2D


const SPEED: int = 50 # Kecepatan "konstan" player.


func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") # Menterjemahkan input player ke 4 arah vektor.
	velocity = direction * SPEED # Netralisasi kecepatan diagonal.

	move_and_slide() # Mengaktifasi logika gerakan.
