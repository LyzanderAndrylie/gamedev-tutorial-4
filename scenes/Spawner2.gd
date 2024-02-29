extends Node2D

export(PackedScene) var obstacle
export(int) var velocity = -250
export(float) var angular = -10.0
export(Vector2) var spawn_pos_conf


func _ready():
	repeat()


func spawn():
	var spawned = obstacle.instance()

	spawned.set_angular_velocity(angular)
	spawned.set_linear_velocity(Vector2(velocity, 0))

	var spawn_pos = global_position
	spawn_pos.x = spawn_pos_conf.x
	spawn_pos.y = spawn_pos_conf.y
	spawned.global_position = spawn_pos

	get_parent().add_child(spawned)


func repeat():
	spawn()
	yield(get_tree().create_timer(4), "timeout")
	repeat()
